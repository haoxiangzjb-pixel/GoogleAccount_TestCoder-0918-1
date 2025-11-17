/**
 * 订单状态枚举
 */
export enum OrderStatus {
  PENDING = 'PENDING',          // 待处理
  CONFIRMED = 'CONFIRMED',      // 已确认
  SHIPPED = 'SHIPPED',          // 已发货
  DELIVERED = 'DELIVERED',      // 已送达
  CANCELLED = 'CANCELLED',      // 已取消
  REFUNDED = 'REFUNDED',        // 已退款
  PROCESSING = 'PROCESSING'     // 处理中
}

// 示例用法
console.log('订单状态枚举值:');
console.log('待处理:', OrderStatus.PENDING);
console.log('已确认:', OrderStatus.CONFIRMED);
console.log('已发货:', OrderStatus.SHIPPED);
console.log('已送达:', OrderStatus.DELIVERED);
console.log('已取消:', OrderStatus.CANCELLED);
console.log('已退款:', OrderStatus.REFUNDED);
console.log('处理中:', OrderStatus.PROCESSING);