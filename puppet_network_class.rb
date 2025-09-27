# frozen_string_literal: true

# Класс для настройки сети с помощью Puppet
class NetworkConfig
  # Основной класс ресурсов для настройки сети
  # @param interface_name [String] Имя сетевого интерфейса, например 'eth0'
  # @param ip_address [String] Желаемый IP-адрес, например '192.168.1.10'
  # @param netmask [String] Маска подсети, например '255.255.255.0'
  # @param gateway [String] Адрес шлюза, например '192.168.1.1'
  # @param dns_servers [Array<String>] Массив DNS-серверов, например ['8.8.8.8', '1.1.1.1']
  define(
    'network_config::interface',
    interface_name:,
    ip_address:,
    netmask:,
    gateway:,
    dns_servers: ['8.8.8.8']
  ) do

    # Управление файлом конфигурации интерфейса
    # Этот пример предполагает систему на базе Debian/Ubuntu.
    file { "/etc/network/interfaces.d/ifcfg-#{interface_name}":
      ensure  => file,
      content => template('network_config/ifcfg.erb'),
      require => Package['puppet'],
      notify  => Exec['restart_network'],
    }

    # Перезапуск сети после изменения конфигурации
    exec { 'restart_network':
      command     => '/etc/init.d/networking restart',
      refreshonly => true,
    }

    # Управление файлом resolv.conf для DNS
    file { '/etc/resolv.conf':
      ensure  => file,
      content => epp('network_config/resolv.conf.epp', { 'dns_servers' => $dns_servers }),
      require => File["/etc/network/interfaces.d/ifcfg-#{interface_name}"],
    }
  end
end

# Пример использования
# network_config::interface { 'eth0':
#   ip_address => '10.0.0.100',
#   netmask    => '255.255.255.0',
#   gateway    => '10.0.0.1',
#   dns_servers => ['8.8.8.8', '8.8.4.4'],
# }