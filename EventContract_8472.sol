// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // Define events
    event ValueChanged(address indexed sender, uint256 oldValue, uint256 newValue);
    event UserRegistered(address indexed user, string name);
    event Transfer(address indexed from, address indexed to, uint256 value);

    uint256 public value;
    mapping(address => string) public userNames;

    constructor() {
        value = 0;
    }

    // Function that triggers ValueChanged event
    function setValue(uint256 _newValue) public {
        uint256 oldValue = value;
        value = _newValue;
        emit ValueChanged(msg.sender, oldValue, _newValue);
    }

    // Function that triggers UserRegistered event
    function registerUser(string memory _name) public {
        userNames[msg.sender] = _name;
        emit UserRegistered(msg.sender, _name);
    }

    // Function that triggers Transfer event
    function transferValue(address _to, uint256 _value) public {
        require(_to != address(0), "Invalid address");
        emit Transfer(msg.sender, _to, _value);
    }
}