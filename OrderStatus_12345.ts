// Enum representing the status of an order
export enum OrderStatus {
  PENDING = 'PENDING',
  CONFIRMED = 'CONFIRMED',
  SHIPPED = 'SHIPPED',
  DELIVERED = 'DELIVERED',
  CANCELLED = 'CANCELLED'
}

// Example usage:
// let currentStatus: OrderStatus = OrderStatus.PENDING;
// console.log(currentStatus); // Output: PENDING