// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimplePayableContract {
    address payable public owner;
    uint256 public balance;

    constructor() payable {
        owner = payable(msg.sender);
        balance = msg.value;
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 amount = balance;
        balance = 0;
        owner.transfer(amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}