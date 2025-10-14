namespace py order_service
namespace java com.example.orderservice

// Тип статуса заказа
enum OrderStatus {
    PENDING = 1,
    CONFIRMED = 2,
    SHIPPED = 3,
    DELIVERED = 4,
    CANCELLED = 5
}

// Структура товара
struct Item {
    1: required i64 id,
    2: required string name,
    3: required double price,
    4: required i32 quantity
}

// Структура заказа
struct Order {
    1: required i64 id,
    2: required list<Item> items,
    3: required double total_amount,
    4: required OrderStatus status = OrderStatus.PENDING,
    5: required string customer_email
}

// Исключение для ошибок
exception OrderNotFound {
    1: string message
}

exception InvalidOrder {
    1: string message
}

// Сервис обработки заказов
service OrderProcessor {
    // Создать новый заказ
    Order create_order(1: list<Item> items, 2: string customer_email) throws (1: InvalidOrder error),

    // Получить информацию о заказе по ID
    Order get_order(1: i64 order_id) throws (1: OrderNotFound error),

    // Обновить статус заказа
    void update_order_status(1: i64 order_id, 2: OrderStatus new_status) throws (1: OrderNotFound error),

    // Рассчитать общую сумму заказа
    double calculate_total(1: list<Item> items)
}