# Puppet manifest to install Apache web server
# File: vkdwtqqb.pp

class apache_install {
  # Install Apache package
  package { 'apache2':
    ensure => installed,
  }

  # Enable and start Apache service
  service { 'apache2':
    ensure => running,
    enable => true,
    require => Package['apache2'],
  }
}

# Apply the apache_install class
include apache_install