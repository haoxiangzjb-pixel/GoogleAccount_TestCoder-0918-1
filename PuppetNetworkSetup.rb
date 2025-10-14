# Класс Puppet для настройки сети
class PuppetNetworkSetup
  # Конструктор класса
  # @param interface_name [String] Имя сетевого интерфейса (например, 'eth0')
  # @param ip_address [String] Желаемый IP-адрес (например, '192.168.1.100')
  # @param netmask [String] Маска подсети (например, '255.255.255.0')
  # @param gateway [String] Шлюз по умолчанию (например, '192.168.1.1')
  def initialize(interface_name, ip_address, netmask, gateway)
    @interface_name = interface_name
    @ip_address = ip_address
    @netmask = netmask
    @gateway = gateway
  end

  # Метод для генерации манифеста Puppet
  # @return [String] Содержимое манифеста Puppet в формате строки
  def generate_manifest
    manifest = <<~MANIFEST
      # Манифест Puppet для настройки сетевого интерфейса #{@interface_name}
      
      # Управление конфигурацией интерфейса через файлы
      file { "/etc/network/interfaces.d/ifcfg-#{@interface_name}":
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('network/ifcfg.erb'), # Используем ERB-шаблон
        notify  => Exec['restart_network'],
      }

      # ERB-шаблон 'network/ifcfg.erb' должен быть расположен в директории шаблонов Puppet
      # и содержать, например, следующее:
      # ---
      # BOOTPROTO=static
      # IPADDR=#{@ip_address}
      # NETMASK=#{@netmask}
      # GATEWAY=#{@gateway}
      # ONBOOT=yes
      # ---

      # Перезапуск службы сети после изменения файла конфигурации
      exec { 'restart_network':
        command     => '/sbin/ifdown #{@interface_name} && /sbin/ifup #{@interface_name}',
        refreshonly => true,
      }

      # Альтернативный подход: использование ресурса package и service для управления сетью
      # service { 'networking':
      #   ensure => running,
      #   enable => true,
      #   subscribe => File["/etc/network/interfaces.d/ifcfg-#{@interface_name}"],
      # }
    MANIFEST
    manifest
  end

  # Метод для сохранения манифеста в файл
  # @param filename [String] Имя файла для сохранения
  def save_manifest(filename)
    File.write(filename, generate_manifest())
    puts "Манифест Puppet для интерфейса #{@interface_name} сохранен в #{filename}"
  end
end

# Пример использования:
# network_config = PuppetNetworkSetup.new('eth0', '192.168.1.100', '255.255.255.0', '192.168.1.1')
# network_config.save_manifest('network_config_eth0.pp')