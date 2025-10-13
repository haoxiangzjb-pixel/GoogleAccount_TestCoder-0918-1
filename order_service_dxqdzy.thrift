namespace py order_service
namespace java com.example.order

// Определение структуры заказа
struct Order {
  1: i64 id,
  2: string status,
  3: double total_amount,
  4: i64 created_at
}

// Определение исключения
exception OrderNotFoundException {
  1: string message
}

// Определение сервиса
service OrderService {
  // Получить заказ по ID
  Order getOrder(1: i64 orderId) throws (1: OrderNotFoundException notFound),

  // Создать новый заказ
  i64 createOrder(1: Order newOrder),

  // Обновить статус заказа
  void updateOrderStatus(1: i64 orderId, 2: string newStatus) throws (1: OrderNotFoundException notFound)
}