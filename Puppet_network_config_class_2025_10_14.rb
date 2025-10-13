# This file was randomly generated to store the Puppet class.

class network_config {
  # Define parameters for the network interface
  $interface = 'eth0',
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
  $dns_servers = ['8.8.8.8', '8.8.4.4'],
) {

  # Manage the network interface configuration file
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('network_config/interface.erb'),
  }

  # Manage the resolv.conf file for DNS
  file { '/etc/resolv.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('network_config/resolv.conf.epp'),
  }

  # Example of managing a package and a service
  package { 'net-tools':
    ensure => installed,
  }

  service { 'networking':
    enable => true,
    ensure => running,
    require => [File["/etc/network/interfaces.d/${interface}"], Package['net-tools']],
    subscribe => File["/etc/network/interfaces.d/${interface}"],
  }
}

# Template for the interface file (usually stored in /etc/puppetlabs/code/templates/)
# This would be saved as templates/interface.erb
# auto <%= @interface %>
# iface <%= @interface %> inet static
#     address <%= @ip_address %>
#     netmask <%= @netmask %>
#     gateway <%= @gateway %>

# EPP template for resolv.conf (usually stored in /etc/puppetlabs/code/manifests/templates/)
# This would be saved as templates/resolv.conf.epp
# <% $dns_servers.each |$server| { -%>
# nameserver <%= $server %>
# <% } -%>
