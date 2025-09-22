class network_setup {
  # Параметры класса
  $interface = 'eth0',
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
  $dns_servers = ['8.8.8.8', '8.8.4.4']

  # Настройка сетевого интерфейса
  file { "/etc/sysconfig/network-scripts/ifcfg-${interface}":
    ensure  => file,
    content => template('network_setup/ifcfg.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['network'],
  }

  # Настройка DNS
  file { '/etc/resolv.conf':
    ensure  => file,
    content => template('network_setup/resolv.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['network'],
  }

  # Управление сервисом сети
  service { 'network':
    ensure => running,
    enable => true,
  }
}