// Order service definition in Thrift
namespace java com.example.order
namespace py order_service
namespace cpp order_service

// Order item structure
struct OrderItem {
  1: i32 product_id,
  2: string product_name,
  3: i32 quantity,
  4: double price
}

// Order structure
struct Order {
  1: i64 order_id,
  2: string customer_id,
  3: list<OrderItem> items,
  4: double total_amount,
  5: string status,
  6: i64 created_at
}

// Request for creating an order
struct CreateOrderRequest {
  1: string customer_id,
  2: list<OrderItem> items
}

// Response for creating an order
struct CreateOrderResponse {
  1: bool success,
  2: i64 order_id,
  3: string message
}

// Request for getting an order
struct GetOrderRequest {
  1: i64 order_id
}

// Response for getting an order
struct GetOrderResponse {
  1: bool success,
  2: Order order,
  3: string message
}

// Exception for order not found
exception OrderNotFoundException {
  1: string message
}

// Exception for invalid request
exception InvalidRequestException {
  1: string message
}

// Main service definition
service OrderService {
  // Create a new order
  CreateOrderResponse createOrder(1: CreateOrderRequest request) 
    throws (1: InvalidRequestException invalidRequest),

  // Get an existing order by ID
  GetOrderResponse getOrder(1: GetOrderRequest request) 
    throws (1: OrderNotFoundException orderNotFound, 
            2: InvalidRequestException invalidRequest),

  // Update order status
  bool updateOrderStatus(1: i64 order_id, 2: string status) 
    throws (1: OrderNotFoundException orderNotFound),

  // Cancel an order
  bool cancelOrder(1: i64 order_id) 
    throws (1: OrderNotFoundException orderNotFound)
}