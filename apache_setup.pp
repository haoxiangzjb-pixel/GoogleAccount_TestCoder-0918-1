# Puppet manifest to install Apache
class apache_setup {
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }
}

# Include the class
include apache_setup