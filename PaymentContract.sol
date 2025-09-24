// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PaymentContract {
    address payable public owner;
    uint256 public totalPayments;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() external {
        require(msg.sender == owner, "Only the owner can withdraw");
        owner.transfer(address(this).balance);
    }

    function () external payable {
        totalPayments += msg.value;
    }
}