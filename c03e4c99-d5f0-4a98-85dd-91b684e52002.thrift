namespace java com.example.product
namespace py product_service

struct Product {
  1: required i32 id,
  2: required string name,
  3: optional string description,
  4: required double price,
  5: optional i32 stockQuantity,
  6: optional string category
}
