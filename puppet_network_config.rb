# Класс Puppet для настройки сети
class { 'network':
  # Управление сетевыми интерфейсами
  manage_interfaces => true,
  # Управление маршрутами
  manage_routes     => true,
  # Управление файлом /etc/resolv.conf
  manage_resolv     => true,
  # Базовые настройки DNS
  dns_servers       => ['8.8.8.8', '8.8.4.4'],
  dns_domain        => 'example.com',
}

# Пример ресурса для конкретного интерфейса (закомментировано)
# network::interface { 'eth0':
#   ipaddress => '192.168.1.10',
#   netmask   => '255.255.255.0',
#   gateway   => '192.168.1.1',
# }