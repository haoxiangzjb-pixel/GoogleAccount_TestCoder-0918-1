namespace java com.example.orderservice
namespace py order_service

// Define an order item
struct OrderItem {
    1: i32 id,
    2: string name,
    3: i32 quantity,
    4: double price
}

// Define an order
struct Order {
    1: i32 id,
    2: list<OrderItem> items,
    3: string customer_name,
    4: string customer_email,
    5: string status,
    6: double total_amount,
    7: i64 created_at
}

// Define exceptions
exception OrderNotFoundException {
    1: string message
}

exception InvalidOrderException {
    1: string message
}

// Define the service
service OrderService {
    // Create a new order
    i32 createOrder(1: Order order) throws (1: InvalidOrderException e),
    
    // Get order by ID
    Order getOrder(1: i32 orderId) throws (1: OrderNotFoundException e),
    
    // Update order status
    bool updateOrderStatus(1: i32 orderId, 2: string status) throws (1: OrderNotFoundException e),
    
    // Get all orders for a customer
    list<Order> getOrdersByCustomer(1: string customerEmail),
    
    // Cancel an order
    bool cancelOrder(1: i32 orderId) throws (1: OrderNotFoundException e),
    
    // List all orders
    list<Order> getAllOrders()
}