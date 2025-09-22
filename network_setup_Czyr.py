#!/usr/bin/env python3
"""
Класс Puppet для настройки сети
"""

import subprocess
import os
import sys


class Puppet:
    """
    Класс для автоматизации настройки сети в Linux
    """

    def __init__(self, interface_name):
        """
        Инициализация класса
        
        :param interface_name: Название сетевого интерфейса (например, eth0)
        """
        self.interface_name = interface_name
        self.config_file = f"/etc/sysconfig/network-scripts/ifcfg-{interface_name}"

    def set_static_ip(self, ip_address, netmask, gateway, dns_servers=None):
        """
        Настройка статического IP адреса
        
        :param ip_address: IP адрес
        :param netmask: Маска подсети
        :param gateway: Шлюз по умолчанию
        :param dns_servers: Список DNS серверов
        """
        try:
            # Создание конфигурационного файла для интерфейса
            config_content = f"""TYPE=Ethernet
BOOTPROTO=static
NAME={self.interface_name}
DEVICE={self.interface_name}
ONBOOT=yes
IPADDR={ip_address}
NETMASK={netmask}
GATEWAY={gateway}
"""
            
            if dns_servers:
                for i, dns in enumerate(dns_servers, start=1):
                    config_content += f"DNS{i}={dns}\n"
            
            # Запись конфигурации в файл
            with open(self.config_file, 'w') as f:
                f.write(config_content)
            
            print(f"Статический IP {ip_address} успешно настроен для интерфейса {self.interface_name}")
            return True
            
        except Exception as e:
            print(f"Ошибка при настройке статического IP: {e}")
            return False

    def set_dhcp(self):
        """
        Настройка получения IP адреса по DHCP
        """
        try:
            # Создание конфигурационного файла для DHCP
            config_content = f"""TYPE=Ethernet
BOOTPROTO=dhcp
NAME={self.interface_name}
DEVICE={self.interface_name}
ONBOOT=yes
"""
            
            # Запись конфигурации в файл
            with open(self.config_file, 'w') as f:
                f.write(config_content)
            
            print(f"DHCP успешно настроен для интерфейса {self.interface_name}")
            return True
            
        except Exception as e:
            print(f"Ошибка при настройке DHCP: {e}")
            return False

    def restart_network_service(self):
        """
        Перезапуск сетевой службы
        """
        try:
            # Перезапуск сетевой службы (для systemd систем)
            result = subprocess.run(['systemctl', 'restart', 'network'], 
                                  capture_output=True, text=True, check=True)
            print("Сетевая служба успешно перезапущена")
            return True
            
        except subprocess.CalledProcessError as e:
            print(f"Ошибка при перезапуске сетевой службы: {e}")
            return False
        except FileNotFoundError:
            # Альтернативная команда для систем без systemctl
            try:
                subprocess.run(['service', 'network', 'restart'], 
                             capture_output=True, text=True, check=True)
                print("Сетевая служба успешно перезапущена")
                return True
            except subprocess.CalledProcessError as e:
                print(f"Ошибка при перезапуске сетевой службы: {e}")
                return False

    def get_interface_info(self):
        """
        Получение информации о сетевом интерфейсе
        """
        try:
            # Получение информации об интерфейсе с помощью ip addr
            result = subprocess.run(['ip', 'addr', 'show', self.interface_name], 
                                  capture_output=True, text=True, check=True)
            return result.stdout
            
        except subprocess.CalledProcessError as e:
            print(f"Ошибка при получении информации об интерфейсе: {e}")
            return None

    def add_route(self, network, netmask, gateway):
        """
        Добавление статического маршрута
        
        :param network: Адрес сети
        :param netmask: Маска сети
        :param gateway: Шлюз
        """
        try:
            # Добавление маршрута
            subprocess.run(['ip', 'route', 'add', f"{network}/{netmask}", 'via', gateway], 
                         capture_output=True, text=True, check=True)
            print(f"Маршрут к сети {network} через {gateway} успешно добавлен")
            return True
            
        except subprocess.CalledProcessError as e:
            print(f"Ошибка при добавлении маршрута: {e}")
            return False


# Пример использования класса
if __name__ == "__main__":
    # Создание экземпляра класса для интерфейса eth0
    puppet = Puppet("eth0")
    
    # Пример настройки статического IP
    # puppet.set_static_ip("192.168.1.100", "255.255.255.0", "192.168.1.1", ["8.8.8.8", "8.8.4.4"])
    
    # Пример настройки DHCP
    # puppet.set_dhcp()
    
    # Пример перезапуска сетевой службы
    # puppet.restart_network_service()
    
    # Пример получения информации об интерфейсе
    # info = puppet.get_interface_info()
    # print(info)
    
    # Пример добавления маршрута
    # puppet.add_route("10.0.0.0", "255.0.0.0", "192.168.1.1")