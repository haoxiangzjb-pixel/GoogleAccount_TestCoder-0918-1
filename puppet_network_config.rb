# Класс Puppet для настройки сети
class NetworkConfig {
  # Параметры класса
  $interface = 'eth0',
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
  $dns_servers = ['8.8.8.8', '8.8.4.4']
} {

  # Управление файлом конфигурации интерфейса
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('network_config.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['linux-base'],
    notify  => Exec['restart_networking'],
  }

  # Перезапуск службы сети
  exec { 'restart_networking':
    command     => '/sbin/ifdown ${interface} && /sbin/ifup ${interface}',
    refreshonly => true,
  }

  # Управление пакетом resolvconf для DNS
  package { 'resolvconf':
    ensure => installed,
  }

  # Управление файлом /etc/resolv.conf
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('resolv_conf.epp', { 'dns_servers' => $dns_servers }),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['resolvconf'],
  }
}