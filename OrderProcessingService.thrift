namespace java com.example.order
namespace py order_service
namespace cpp order_service

// Enum for order status
enum OrderStatus {
  PENDING = 0,
  CONFIRMED = 1,
  PROCESSING = 2,
  SHIPPED = 3,
  DELIVERED = 4,
  CANCELLED = 5
}

// Struct for an order item
struct OrderItem {
  1: i32 product_id,
  2: string product_name,
  3: i32 quantity,
  4: double price
}

// Struct for an order
struct Order {
  1: i64 order_id,
  2: string customer_id,
  3: list<OrderItem> items,
  4: double total_amount,
  5: string address,
  6: OrderStatus status,
  7: i64 created_at
}

// Exception for order-related errors
exception OrderException {
  1: string message,
  2: i32 error_code
}

// Service definition for order processing
service OrderService {
  // Create a new order
  i64 createOrder(1: Order order) throws (1: OrderException ex),
  
  // Get order by ID
  Order getOrder(1: i64 order_id) throws (1: OrderException ex),
  
  // Update order status
  bool updateOrderStatus(1: i64 order_id, 2: OrderStatus status) throws (1: OrderException ex),
  
  // List orders for a customer
  list<Order> getOrdersByCustomer(1: string customer_id) throws (1: OrderException ex),
  
  // Cancel an order
  bool cancelOrder(1: i64 order_id) throws (1: OrderException ex),
  
  // Get all orders (admin function)
  list<Order> getAllOrders() throws (1: OrderException ex)
}