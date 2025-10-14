# A sample Puppet class for network configuration.
# This class is saved in a file named PuppetNetworkConfig.rb.

class NetworkConfig {
  # Define parameters for the network interface
  param String $interface = 'eth0',
  param String $ip_address,
  param String $netmask = '255.255.255.0',
  param String $gateway,
  param Array[String] $dns_servers = ['8.8.8.8', '8.8.4.4']

  # Resource to manage the network interface configuration file
  # This is a conceptual example, actual Puppet syntax might differ slightly
  # and require specific modules like `puppetlabs-network`.
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('network_config.erb'), # This would be a Puppet ERB template
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['puppet-agent'],
    notify  => Service['networking'], # Restart networking service on change
  }

  # Resource to manage DNS resolution
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('resolv_conf.epp'), # This would be a Puppet EPP template
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}