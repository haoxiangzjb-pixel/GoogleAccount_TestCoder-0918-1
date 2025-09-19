// 定义订单状态枚举
enum OrderStatus {
    // 订单已创建，等待处理
    Pending = 'pending',
    // 订单已确认，正在处理
    Confirmed = 'confirmed',
    // 订单已发货
    Shipped = 'shipped',
    // 订单已完成
    Delivered = 'delivered',
    // 订单已取消
    Cancelled = 'cancelled'
}

export default OrderStatus;