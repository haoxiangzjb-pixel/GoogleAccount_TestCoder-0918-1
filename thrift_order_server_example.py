import sys
sys.path.append('/workspace/gen-py')

from order_service_gen import OrderService
from order_service_gen.ttypes import Order, OrderNotFound
from thrift.transport import TSocket, TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

# Простой обработчик (handler) для нашего сервиса
class OrderServiceHandler:
    def __init__(self):
        self.orders = {}
        self.next_id = 1

    def create_order(self, customer_name, product, quantity, price):
        order = Order()
        order.id = self.next_id
        order.customer_name = customer_name
        order.product = product
        order.quantity = quantity
        order.price = price
        self.orders[order.id] = order
        self.next_id += 1
        print(f"Created order: {order}")
        return order

    def get_order(self, id):
        order = self.orders.get(id)
        if order is None:
            raise OrderNotFound(message=f"Order with id {id} not found")
        return order

    def update_order(self, id, customer_name, product, quantity, price):
        order = self.orders.get(id)
        if order is None:
            return False
        order.customer_name = customer_name
        order.product = product
        order.quantity = quantity
        order.price = price
        print(f"Updated order: {order}")
        return True

    def delete_order(self, id):
        if id in self.orders:
            del self.orders[id]
            print(f"Deleted order with id: {id}")
            return True
        return False

if __name__ == '__main__':
    handler = OrderServiceHandler()
    processor = OrderService.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()

    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)

    print('Starting the server...')
    server.serve()
    print('Server finished.')