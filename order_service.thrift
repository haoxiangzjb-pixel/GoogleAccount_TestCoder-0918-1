namespace java com.example.order
namespace py order_service

// Структура заказа
struct Order {
  1: i64 id,
  2: string customerName,
  3: string items,
  4: double totalAmount,
  5: string status,
}

// Исключение для обработки ошибок
exception OrderException {
  1: string message,
}

// Сервис обработки заказов
service OrderService {
  // Создание нового заказа
  Order createOrder(1: string customerName, 2: string items, 3: double totalAmount) throws (1: OrderException ex),
  
  // Получение заказа по ID
  Order getOrder(1: i64 orderId) throws (1: OrderException ex),
  
  // Обновление статуса заказа
  bool updateOrderStatus(1: i64 orderId, 2: string status) throws (1: OrderException ex),
  
  // Удаление заказа
  bool deleteOrder(1: i64 orderId) throws (1: OrderException ex),
}