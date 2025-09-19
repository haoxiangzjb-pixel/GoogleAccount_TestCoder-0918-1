"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// 定义订单状态枚举
var OrderStatus;
(function (OrderStatus) {
    // 订单已创建，等待处理
    OrderStatus["Pending"] = "pending";
    // 订单已确认，正在处理
    OrderStatus["Confirmed"] = "confirmed";
    // 订单已发货
    OrderStatus["Shipped"] = "shipped";
    // 订单已完成
    OrderStatus["Delivered"] = "delivered";
    // 订单已取消
    OrderStatus["Cancelled"] = "cancelled";
})(OrderStatus || (OrderStatus = {}));
exports.default = OrderStatus;
