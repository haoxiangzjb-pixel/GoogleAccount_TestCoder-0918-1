# Класс Puppet для настройки сети
class NetworkConfig
  # Атрибуты для хранения конфигурации сети
  attr_accessor :ip_address, :netmask, :gateway, :dns_servers

  # Конструктор класса
  def initialize(ip_address = nil, netmask = nil, gateway = nil, dns_servers = [])
    @ip_address = ip_address
    @netmask = netmask
    @gateway = gateway
    @dns_servers = dns_servers
  end

  # Метод для вывода текущей конфигурации
  def show_config
    puts "Конфигурация сети:"
    puts "IP-адрес: #{@ip_address}"
    puts "Маска подсети: #{@netmask}"
    puts "Шлюз: #{@gateway}"
    puts "DNS-серверы: #{@dns_servers.join(', ')}"
  end

  # Метод для проверки, является ли конфигурация минимально полной
  def valid?
    !@ip_address.nil? && !@netmask.nil? && !@gateway.nil?
  end
end

# Пример использования класса
if __FILE__ == $0
  # Создание экземпляра класса с начальной конфигурацией
  network = NetworkConfig.new("192.168.1.100", "255.255.255.0", "192.168.1.1", ["8.8.8.8", "1.1.1.1"])

  # Вывод конфигурации
  network.show_config

  # Проверка валидности
  if network.valid?
    puts "\nКонфигурация сети действительна."
  else
    puts "\nКонфигурация сети неполная."
  end
end