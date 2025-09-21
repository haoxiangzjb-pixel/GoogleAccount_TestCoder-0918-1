# Puppet manifest to install Apache
# Filename: wpqvfqzugz.pp

class apache_install {
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure => running,
    enable => true,
  }
}

# Apply the class
include apache_install