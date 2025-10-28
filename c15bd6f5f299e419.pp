# Puppet manifest to install Apache web server
class apache_install {
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }

  # Ensure default index page exists
  file { '/var/www/html/index.html':
    ensure  => file,
    content => '<html><body><h1>Apache is running!</h1></body></html>',
    require => Service['apache2'],
  }
}

# Apply the class
include apache_install