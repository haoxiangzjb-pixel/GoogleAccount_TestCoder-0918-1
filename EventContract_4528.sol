// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义一个事件，用于记录数值变更
    event ValueChanged(address indexed changer, uint256 oldValue, uint256 newValue);
    
    // 定义另一个事件，用于记录账户余额更新
    event BalanceUpdated(address indexed account, uint256 newBalance);
    
    // 定义一个事件，用于记录转账操作
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    uint256 public currentValue;
    mapping(address => uint256) public balances;
    
    constructor() {
        currentValue = 0;
    }
    
    // 函数用于更新值并触发ValueChanged事件
    function updateValue(uint256 _newValue) public {
        uint256 oldVal = currentValue;
        currentValue = _newValue;
        
        // 触发ValueChanged事件
        emit ValueChanged(msg.sender, oldVal, _newValue);
    }
    
    // 函数用于更新账户余额并触发BalanceUpdated事件
    function updateBalance(address _account, uint256 _amount) public {
        balances[_account] = _amount;
        
        // 触发BalanceUpdated事件
        emit BalanceUpdated(_account, _amount);
    }
    
    // 函数用于执行转账并触发Transfer事件
    function transfer(address _to, uint256 _value) public {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        
        // 触发Transfer事件
        emit Transfer(msg.sender, _to, _value);
    }
}