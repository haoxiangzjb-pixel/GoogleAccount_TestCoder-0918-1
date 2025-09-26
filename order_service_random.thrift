namespace py order_service_gen

struct Order {
  1: i32 id,
  2: string customer_name,
  3: string product,
  4: i32 quantity,
  5: double price,
}

exception OrderNotFound {
  1: string message
}

service OrderService {
  Order create_order(1: string customer_name, 2: string product, 3: i32 quantity, 4: double price),
  Order get_order(1: i32 id) throws (1: OrderNotFound not_found),
  bool update_order(1: i32 id, 2: string customer_name, 3: string product, 4: i32 quantity, 5: double price),
  bool delete_order(1: i32 id)
}