namespace java com.example.product
namespace py product_service

struct Product {
  1: i64 id,
  2: string name,
  3: string description,
  4: double price,
  5: i32 quantity,
  6: string category,
  7: bool isActive = true,
  8: string createdAt,
  9: string updatedAt
}