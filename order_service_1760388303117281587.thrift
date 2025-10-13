// Файл определения Thrift для сервиса обработки заказов
// Сгенерировано случайное имя файла: /workspace/order_service_1760388303117281587.thrift

// Структура для элемента заказа
struct OrderItem {
  1: i32 productId,
  2: i32 quantity,
  3: double price,
}

// Структура для заказа
struct Order {
  1: i64 orderId,
  2: list<OrderItem> items,
  3: string customerEmail,
  4: double totalAmount,
}

// Исключение для ошибок валидации
exception ValidationException {
  1: string message,
}

// Сервис обработки заказов
service OrderProcessor {
  // Метод для размещения заказа
  i64 placeOrder(1: Order order) throws (1: ValidationException validationException),

  // Метод для получения статуса заказа
  string getOrderStatus(1: i64 orderId),

  // Метод для отмены заказа
  bool cancelOrder(1: i64 orderId) throws (1: ValidationException validationException),
}
