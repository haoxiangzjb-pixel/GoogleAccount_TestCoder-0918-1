namespace py orderservice
namespace java orderservice

// Определение типа для элемента заказа
struct OrderItem {
    1: i32 productId,
    2: string name,
    3: i32 quantity,
    4: double price
}

// Определение типа для адреса
struct Address {
    1: string street,
    2: string city,
    3: string state,
    4: string zipCode
}

// Определение типа для заказа
struct Order {
    1: i64 orderId,
    2: list<OrderItem> items,
    3: Address shippingAddress,
    4: double totalAmount,
    5: string status
}

// Исключение для ошибок при обработке заказа
exception OrderProcessingException {
    1: string message
}

// Сервис для обработки заказов
service OrderService {
    // Создать новый заказ
    Order createOrder(1: list<OrderItem> items, 2: Address shippingAddress) throws (1: OrderProcessingException ope),

    // Получить информацию о заказе по ID
    Order getOrder(1: i64 orderId) throws (1: OrderProcessingException ope),

    // Обновить статус заказа
    void updateOrderStatus(1: i64 orderId, 2: string status) throws (1: OrderProcessingException ope)
}