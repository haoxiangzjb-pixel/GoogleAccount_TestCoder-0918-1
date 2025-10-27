// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义一个事件，用于记录值的更改
    event ValueChanged(address indexed sender, uint256 oldValue, uint256 newValue);

    uint256 private value;

    constructor(uint256 initialValue) {
        value = initialValue;
        // 在构造函数中触发事件
        emit ValueChanged(msg.sender, 0, value);
    }

    // 设置新值的函数，会触发事件
    function setValue(uint256 newValue) public {
        uint256 oldValue = value;
        value = newValue;
        // 触发事件，记录值的更改
        emit ValueChanged(msg.sender, oldValue, newValue);
    }

    // 获取当前值的函数
    function getValue() public view returns (uint256) {
        return value;
    }
}