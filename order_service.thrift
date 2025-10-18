namespace java com.example.order
namespace py order_service

// Order status enumeration
enum OrderStatus {
  PENDING = 1,
  CONFIRMED = 2,
  PROCESSING = 3,
  SHIPPED = 4,
  DELIVERED = 5,
  CANCELLED = 6
}

// Order item structure
struct OrderItem {
  1: required i64 productId,
  2: required string productName,
  3: required i32 quantity,
  4: required double price
}

// Order structure
struct Order {
  1: required i64 orderId,
  2: required string customerId,
  3: required list<OrderItem> items,
  4: required double totalAmount,
  5: required OrderStatus status,
  6: required string createdAt,
  7: optional string updatedAt
}

// Response structure
struct OrderResponse {
  1: required bool success,
  2: optional Order order,
  3: optional string errorMessage
}

// Request structure for creating an order
struct CreateOrderRequest {
  1: required string customerId,
  2: required list<OrderItem> items
}

// Service definition
service OrderService {
  // Create a new order
  OrderResponse createOrder(1: CreateOrderRequest request),
  
  // Get order by ID
  OrderResponse getOrder(1: i64 orderId),
  
  // Update order status
  OrderResponse updateOrderStatus(1: i64 orderId, 2: OrderStatus status),
  
  // Cancel an order
  OrderResponse cancelOrder(1: i64 orderId)
}