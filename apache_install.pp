# Puppet manifest to install Apache web server

class apache_install {
  # Manage the Apache package
  package { 'apache2':
    ensure => installed,
  }

  # Manage the Apache service
  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }

  # Create a basic index.html file
  file { '/var/www/html/index.html':
    ensure  => file,
    content => '<html><body><h1>Hello from Puppet-managed Apache!</h1></body></html>',
    require => Service['apache2'],
  }
}

# Include the class to apply the configuration
include apache_install