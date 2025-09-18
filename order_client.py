#!/usr/bin/env python3

import sys
sys.path.append('/workspace/generated/py')

from order_service import OrderService
from order_service.ttypes import *
from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

def main():
    # Создаем соединение с сервером
    transport = TSocket.TSocket('127.0.0.1', 9090)
    transport = TTransport.TBufferedTransport(transport)
    protocol = TBinaryProtocol.TBinaryProtocol(transport)
    client = OrderService.Client(protocol)
    
    # Открываем соединение
    transport.open()
    
    try:
        # Создаем новый заказ
        print("Creating a new order...")
        order = client.createOrder("John Doe", "Pizza, Cola", 15.50)
        print(f"Created order: ID={order.id}, Customer={order.customerName}, Items={order.items}, Total={order.totalAmount}, Status={order.status}")
        
        # Получаем заказ по ID
        print("\nRetrieving the order...")
        retrieved_order = client.getOrder(order.id)
        print(f"Retrieved order: ID={retrieved_order.id}, Customer={retrieved_order.customerName}, Items={retrieved_order.items}, Total={retrieved_order.totalAmount}, Status={retrieved_order.status}")
        
        # Обновляем статус заказа
        print("\nUpdating order status...")
        success = client.updateOrderStatus(order.id, "CONFIRMED")
        if success:
            updated_order = client.getOrder(order.id)
            print(f"Updated order status: {updated_order.status}")
        
        # Пытаемся получить несуществующий заказ
        print("\nTrying to retrieve a non-existent order...")
        try:
            client.getOrder(99999)
        except OrderException as e:
            print(f"Caught exception: {e.message}")
            
    except Thrift.TException as tx:
        print(f"Thrift exception: {tx.message}")
        
    finally:
        # Закрываем соединение
        transport.close()

if __name__ == '__main__':
    main()