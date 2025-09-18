#!/usr/bin/env python3

import sys
import glob
sys.path.append('/workspace/generated/py')

from order_service import OrderService
from order_service.ttypes import *
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

class OrderHandler:
    def __init__(self):
        self.orders = {}
        self.next_id = 1

    def createOrder(self, customerName, items, totalAmount):
        order = Order()
        order.id = self.next_id
        order.customerName = customerName
        order.items = items
        order.totalAmount = totalAmount
        order.status = "CREATED"
        
        self.orders[order.id] = order
        self.next_id += 1
        
        print(f"Created order {order.id} for {customerName}")
        return order

    def getOrder(self, orderId):
        if orderId in self.orders:
            return self.orders[orderId]
        else:
            raise OrderException(f"Order with ID {orderId} not found")

    def updateOrderStatus(self, orderId, status):
        if orderId in self.orders:
            self.orders[orderId].status = status
            return True
        else:
            raise OrderException(f"Order with ID {orderId} not found")

    def deleteOrder(self, orderId):
        if orderId in self.orders:
            del self.orders[orderId]
            return True
        else:
            raise OrderException(f"Order with ID {orderId} not found")

if __name__ == '__main__':
    handler = OrderHandler()
    processor = OrderService.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()

    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)

    print("Starting the order service server...")
    server.serve()