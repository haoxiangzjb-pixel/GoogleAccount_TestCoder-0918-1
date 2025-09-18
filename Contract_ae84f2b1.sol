// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableExample {
    // Address of the contract owner
    address payable public owner;
    
    // Event to log deposits
    event Deposit(address indexed from, uint256 amount);
    
    // Event to log withdrawals
    event Withdrawal(address indexed to, uint256 amount);
    
    // Constructor sets the owner
    constructor() {
        owner = payable(msg.sender);
    }
    
    // Function to deposit ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Must send some ether");
        emit Deposit(msg.sender, msg.value);
    }
    
    // Function to withdraw all ether from the contract
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 balance = address(this).balance;
        require(balance > 0, "No ether to withdraw");
        
        emit Withdrawal(owner, balance);
        owner.transfer(balance);
    }
    
    // Function to get the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}