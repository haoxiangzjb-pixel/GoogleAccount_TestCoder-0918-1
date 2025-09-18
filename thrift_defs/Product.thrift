// Product.thrift
// Definition of a Product struct for e-commerce systems

namespace java com.example.thrift.product
namespace py product

struct Product {
  1: required i64 id,
  2: required string name,
  3: optional string description,
  4: required double price,
  5: optional string category,
  6: optional list<string> tags,
  7: optional bool inStock = true,
  8: optional map<string, string> attributes,
  9: optional i32 quantity = 0
}