/**
 * 枚举：订单状态
 */
export enum OrderStatus {
  PENDING = 'PENDING',       // 待支付
  PAID = 'PAID',             // 已支付
  SHIPPED = 'SHIPPED',       // 已发货
  DELIVERED = 'DELIVERED',   // 已送达
  CANCELLED = 'CANCELLED'    // 已取消
}

// 示例：如何使用此枚举
/*
const myOrderStatus: OrderStatus = OrderStatus.PAID;
console.log(myOrderStatus); // 输出: PAID
*/