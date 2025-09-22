#!/usr/bin/env python3

import sys
sys.path.append('gen-py')

from gen_py.order_service import OrderProcessor
from gen_py.order_service.ttypes import *

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

def main():
    # Создаем подключение к серверу
    transport = TSocket.TSocket('127.0.0.1', 9090)
    transport = TTransport.TBufferedTransport(transport)
    protocol = TBinaryProtocol.TBinaryProtocol(transport)
    client = OrderProcessor.Client(protocol)
    
    # Открываем соединение
    transport.open()
    
    # Создаем тестовый заказ
    order = Order()
    order.customer_name = "John Doe"
    order.items = "Pizza, Coke"
    order.total_amount = 15.99
    order.is_processed = False
    
    # Отправляем заказ на обработку
    print("Sending order for processing...")
    result = client.processOrder(order)
    print(f"Result: {result.message}")
    print(f"Processed order ID: {result.order.id}")
    
    # Получаем заказ по ID
    print("\nRetrieving order by ID...")
    retrieved_order = client.getOrder(result.order.id)
    print(f"Retrieved order: {retrieved_order}")
    
    # Получаем все заказы
    print("\nRetrieving all orders...")
    all_orders = client.getAllOrders()
    print(f"Total orders: {len(all_orders)}")
    for o in all_orders:
        print(f"  Order {o.id}: {o.customer_name} - {o.items} - ${o.total_amount}")
    
    # Закрываем соединение
    transport.close()

if __name__ == '__main__':
    try:
        main()
    except Thrift.TException as tx:
        print(f"Thrift exception: {tx.message}")