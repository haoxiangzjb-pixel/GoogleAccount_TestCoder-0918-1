#!/usr/bin/env python3

import sys
import glob
import os
from gen_py.order_service import OrderProcessor
from gen_py.order_service.ttypes import *

from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

class OrderHandler:
    def __init__(self):
        self.orders = {}
        self.next_id = 1

    def processOrder(self, order):
        # Присваиваем ID заказу, если он не установлен
        if order.id == 0:
            order.id = self.next_id
            self.next_id += 1
            
        # Обрабатываем заказ
        order.is_processed = True
        
        # Сохраняем заказ
        self.orders[order.id] = order
        
        result = OrderResult()
        result.success = True
        result.message = f"Order {order.id} processed successfully"
        result.order = order
        
        return result

    def getOrder(self, order_id):
        return self.orders.get(order_id, None)

    def getAllOrders(self):
        return list(self.orders.values())

if __name__ == '__main__':
    handler = OrderHandler()
    processor = OrderProcessor.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()
    
    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)
    
    print("Starting the order service server...")
    server.serve()