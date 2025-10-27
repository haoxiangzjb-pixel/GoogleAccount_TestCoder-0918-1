# Puppet class for network configuration
class puppet_network_config {
  # Parameters for network configuration
  $interface = 'eth0',
  $ipaddress = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
  $dns_servers = ['8.8.8.8', '8.8.4.4']
} {
  
  # Configure network interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('puppet_network_config/interface.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['network-manager'],
    notify  => Service['networking'],
  }

  # Configure static IP
  exec { "configure_static_ip_${interface}":
    command     => "/sbin/ifconfig ${interface} ${ipaddress} netmask ${netmask}",
    onlyif      => "/bin/expr '${ipaddress}' : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null",
    refreshonly => true,
  }

  # Set default gateway
  exec { "set_gateway":
    command     => "/sbin/ip route add default via ${gateway}",
    onlyif      => "/bin/expr '${gateway}' : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null",
    refreshonly => true,
  }

  # Configure DNS servers
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('puppet_network_config/resolv.conf.epp', { 'dns_servers' => $dns_servers }),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Ensure networking service is running
  service { 'networking':
    ensure  => running,
    enable  => true,
    require => [
      File['/etc/network/interfaces.d/${interface}'],
      File['/etc/resolv.conf'],
    ],
  }
}

# Define resource for individual network interfaces
define puppet_network_config::interface (
  String $ipaddress,
  String $netmask = '255.255.255.0',
  Optional[String] $gateway = undef,
  Boolean $enable = true,
) {
  # Create interface configuration file
  file { "/etc/network/interfaces.d/${title}":
    ensure  => $enable ? {
      true  => file,
      false => absent,
    },
    content => epp('puppet_network_config/interface_config.epp', {
      'interface' => $title,
      'ipaddress' => $ipaddress,
      'netmask'   => $netmask,
      'gateway'   => $gateway,
    }),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['net-tools'],
    notify  => Exec["reload_${title}"],
  }

  # Reload network interface after configuration changes
  exec { "reload_${title}":
    command     => $enable ? {
      true  => "/sbin/ifdown ${title} && /sbin/ifup ${title}",
      false => "/sbin/ifdown ${title}",
    },
    subscribe => File["/etc/network/interfaces.d/${title}"],
    onlyif    => "/sbin/ifconfig -a | grep -q ${title}",
  }
}