# Puppet manifest to install Apache web server
# Supports RedHat and Debian based systems

class apache {
  case $facts['os']['family'] {
    'RedHat': {
      $package_name = 'httpd'
      $service_name = 'httpd'
    }
    'Debian': {
      $package_name = 'apache2'
      $service_name = 'apache2'
    }
    default: {
      fail("Unsupported OS family: ${facts['os']['family']}")
    }
  }

  package { $package_name:
    ensure => installed,
  }

  service { $service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package[$package_name],
  }
}

# Apply the apache class
include apache