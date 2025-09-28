# Класс Puppet для настройки сети
class NetworkConfig {
  # Параметры класса
  param String $interface = 'eth0',
  param String $ip_address,
  param String $netmask = '255.255.255.0',
  param Optional[String] $gateway,
  param Optional[Array[String]] $dns_servers = []

  # Ресурс для управления файлом конфигурации интерфейса
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('network_config.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['linux-base'],
    notify  => Exec['restart-networking'],
  }

  # Опциональный ресурс для настройки шлюза и DNS в /etc/resolv.conf и /etc/default/gateway
  # Реализация зависит от дистрибутива и требует дополнительных ресурсов типа file, exec.

  # Команда для перезапуска службы сети после изменений
  exec { 'restart-networking':
    command     => '/sbin/ifdown ${interface} && /sbin/ifup ${interface}',
    refreshonly => true,
  }
}