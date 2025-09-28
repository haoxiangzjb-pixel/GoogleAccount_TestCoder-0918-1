namespace py orderservice
namespace java com.example.orderservice

struct Order {
    1: i64 id,
    2: string customerName,
    3: string product,
    4: i32 quantity,
    5: double price
}

struct OrderConfirmation {
    1: i64 orderId,
    2: string status,
    3: string message
}

service OrderService {
    OrderConfirmation placeOrder(1: Order order)
}