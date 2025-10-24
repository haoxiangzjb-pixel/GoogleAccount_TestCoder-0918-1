// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义事件
    event ValueChanged(address indexed sender, uint256 oldValue, uint256 newValue);
    event UserRegistered(address indexed user, string name, uint256 timestamp);
    event Transfer(address indexed from, address indexed to, uint256 value);

    uint256 public value;
    mapping(address => uint256) public balances;

    constructor(uint256 initialValue) {
        value = initialValue;
        // 触发初始值设置事件
        emit ValueChanged(msg.sender, 0, initialValue);
    }

    // 修改值的函数，会触发事件
    function setValue(uint256 newValue) public {
        uint256 oldValue = value;
        value = newValue;
        // 触发事件
        emit ValueChanged(msg.sender, oldValue, newValue);
    }

    // 注册用户的函数，会触发事件
    function registerUser(string memory name) public {
        // 触发用户注册事件
        emit UserRegistered(msg.sender, name, block.timestamp);
    }

    // 转账函数，会触发事件
    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        balances[msg.sender] -= amount;
        balances[to] += amount;
        
        // 触发转账事件
        emit Transfer(msg.sender, to, amount);
    }

    // 存款函数
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
}