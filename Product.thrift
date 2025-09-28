// Product.thrift

namespace py product_service
namespace java com.example.productservice

// Represents a product in the inventory
struct Product {
  1: required i64 id,                    // Unique product identifier
  2: required string name,               // Product name
  3: optional string description,        // Product description (can be empty)
  4: required double price,              // Product price
  5: optional list<string> categories,   // List of categories the product belongs to
  6: optional string currency = "USD"    // Currency code for the price
}