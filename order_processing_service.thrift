// Service definition for order processing
namespace java com.example.order
namespace cpp order_processing

// Definition of an order item
struct OrderItem {
    1: i32 productId,
    2: string productName,
    3: i32 quantity,
    4: double price
}

// Definition of an order
struct Order {
    1: i64 orderId,
    2: string customerId,
    3: list<OrderItem> items,
    4: double totalAmount,
    5: string status,
    6: i64 createdAt
}

// Exception for order processing errors
exception OrderProcessingException {
    1: string message
}

// Service definition
service OrderService {
    // Create a new order
    i64 createOrder(1: Order order) throws (1: OrderProcessingException ex),
    
    // Get order by ID
    Order getOrder(1: i64 orderId) throws (1: OrderProcessingException ex),
    
    // Update order status
    void updateOrderStatus(1: i64 orderId, 2: string status) throws (1: OrderProcessingException ex),
    
    // Cancel an order
    void cancelOrder(1: i64 orderId) throws (1: OrderProcessingException ex),
    
    // Get all orders for a customer
    list<Order> getCustomerOrders(1: string customerId) throws (1: OrderProcessingException ex)
}