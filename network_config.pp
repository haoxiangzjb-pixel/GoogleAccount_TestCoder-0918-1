# frozen_string_literal: true

# Define a Puppet class for network configuration
class network_config(
  String $hostname = $facts['hostname'],
  Hash $interfaces = {},
) {
  # Set the hostname
  file { '/etc/hostname':
    ensure  => file,
    content => "${hostname}\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Configure network interfaces based on the $interfaces hash
  # Example hash structure:
  # {
  #   'eth0' => {
  #     'ip' => '192.168.1.10',
  #     'netmask' => '255.255.255.0',
  #     'gateway' => '192.168.1.1',
  #   },
  #   'eth1' => {
  #     'ip' => '10.0.0.5',
  #     'netmask' => '255.255.0.0',
  #   }
  # }
  $interfaces.each |$iface_name, $config| {
    # Construct the interface configuration content
    # This is a basic example for a Debian/Ubuntu /etc/network/interfaces style file
    $iface_content = inline_template(@("END_IFACE_CONTENT")
      | auto <%= @iface_name %>
      | iface <%= @iface_name %> inet static
      |     address <%= @config['ip'] %>
      |     netmask <%= @config['netmask'] %>
      |<% if @config['gateway'] { | %>
      |     gateway <%= @config['gateway'] %>
      |<% } %>
      |
      END_IFACE_CONTENT
    )

    file { "/etc/network/interfaces.d/${iface_name}":
      ensure  => file,
      content => $iface_content,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }
}