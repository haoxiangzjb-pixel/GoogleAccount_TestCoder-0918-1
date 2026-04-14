// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EGVgT3Bp {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    // Payable function to receive Ether
    function deposit() external payable {
        require(msg.value > 0, "Must send Ether to deposit");
        balance += msg.value;
    }

    // Function to withdraw funds (only owner)
    function withdraw(uint256 amount) external {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficient balance");
        
        balance -= amount;
        payable(owner).transfer(amount);
    }

    // Fallback function to receive Ether
    receive() external payable {
        balance += msg.value;
    }
}
