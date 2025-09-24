// Определение структуры заказа
struct Order {
  1: i64 id,
  2: string customerName,
  3: list<string> items,
  4: double totalAmount
}

// Определение исключения для ошибок обработки
exception OrderProcessingException {
  1: string message
}

// Определение сервиса обработки заказов
service OrderProcessor {
  // Метод для размещения заказа
  bool placeOrder(1: Order order) throws (1: OrderProcessingException ope),

  // Метод для получения статуса заказа по ID
  string getOrderStatus(1: i64 orderId) throws (1: OrderProcessingException ope)
}