namespace py order_service

struct Order {
  1: i64 id,
  2: string customer_name,
  3: string product,
  4: i32 quantity,
  5: double price,
  6: string status
}

exception OrderNotFound {
  1: string message
}

service OrderProcessor {
  Order create_order(1: string customer_name, 2: string product, 3: i32 quantity, 4: double price),
  Order get_order(1: i64 id) throws (1: OrderNotFound not_found),
  bool update_order_status(1: i64 id, 2: string new_status) throws (1: OrderNotFound not_found),
  bool delete_order(1: i64 id) throws (1: OrderNotFound not_found)
}