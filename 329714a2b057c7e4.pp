# Puppet manifest to install Apache web server

class apache_install {
  package { 'apache2':
    ensure => installed,
    name   => $facts['os']['family'] ? {
      'RedHat' => 'httpd',
      'Debian' => 'apache2',
      'Suse'   => 'apache2',
      default  => 'apache2',
    },
  }

  service { 'apache2':
    ensure  => running,
    name    => $facts['os']['family'] ? {
      'RedHat' => 'httpd',
      'Debian' => 'apache2',
      'Suse'   => 'apache2',
      default  => 'apache2',
    },
    enable  => true,
    require => Package['apache2'],
  }

  # Ensure the default site is present (optional)
  file { '/var/www/html/index.html':
    ensure  => file,
    content => '<html><body><h1>Hello from Puppet-managed Apache!</h1></body></html>',
    require => [ Package['apache2'], Service['apache2'] ],
  }
}

# Apply the class
include apache_install