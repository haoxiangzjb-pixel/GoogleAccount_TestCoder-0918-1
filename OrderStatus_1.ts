/**
 * 定义订单状态的TypeScript枚举。
 */
export enum OrderStatus {
  PENDING = 'pending',       // 待处理
  CONFIRMED = 'confirmed',   // 已确认
  SHIPPED = 'shipped',       // 已发货
  DELIVERED = 'delivered',   // 已送达
  CANCELLED = 'cancelled',   // 已取消
}