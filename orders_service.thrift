namespace java com.example.orders
namespace py orders_service

// Определение структуры заказа
struct Order {
  1: i64 id,
  2: string customer_name,
  3: string customer_email,
  4: list<OrderItem> items,
  5: double total_amount,
  6: string status,
  7: i64 created_at
}

// Определение элемента заказа
struct OrderItem {
  1: i64 product_id,
  2: string product_name,
  3: i32 quantity,
  4: double unit_price
}

// Определение структуры ответа
struct OrderResponse {
  1: bool success,
  2: string message,
  3: optional Order order
}

// Определение структуры запроса на создание заказа
struct CreateOrderRequest {
  1: string customer_name,
  2: string customer_email,
  3: list<OrderItem> items
}

// Определение исключения
exception OrderException {
  1: string message
}

// Определение сервиса
service OrderService {
  // Создание нового заказа
  OrderResponse create_order(1: CreateOrderRequest request) throws (1: OrderException ex),
  
  // Получение заказа по ID
  OrderResponse get_order(1: i64 order_id) throws (1: OrderException ex),
  
  // Обновление статуса заказа
  OrderResponse update_order_status(1: i64 order_id, 2: string status) throws (1: OrderException ex),
  
  // Получение всех заказов клиента
  list<Order> get_orders_by_customer(1: string customer_email) throws (1: OrderException ex),
  
  // Удаление заказа
  bool delete_order(1: i64 order_id) throws (1: OrderException ex)
}