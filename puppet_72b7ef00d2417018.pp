# Puppet manifest to install Apache web server
class apache_install {
  package { 'apache2':
    ensure => installed,
    name   => $facts['os']['family'] ? {
      'RedHat' => 'httpd',
      'Debian' => 'apache2',
      default  => 'apache2',
    },
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    name    => $facts['os']['family'] ? {
      'RedHat' => 'httpd',
      'Debian' => 'apache2',
      default  => 'apache2',
    },
    require => Package['apache2'],
  }

  # Ensure the default site is enabled (on Debian-based systems)
  exec { 'a2ensite default':
    command     => '/usr/sbin/a2ensite 000-default',
    onlyif      => '/bin/test -f /etc/apache2/sites-available/000-default.conf',
    subscribe   => Package['apache2'],
    refreshonly => true,
  }
}

# Apply the class
include apache_install