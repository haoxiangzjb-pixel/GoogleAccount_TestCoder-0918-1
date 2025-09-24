// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentContract {
    address payable public owner;
    uint256 public totalBalance;

    constructor() {
        owner = payable(msg.sender);
    }

    function pay() public payable {
        require(msg.value > 0, "Value must be greater than 0");
        totalBalance += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 amount = totalBalance;
        totalBalance = 0;
        owner.transfer(amount);
    }

    function getBalance() public view returns (uint256) {
        return totalBalance;
    }
}