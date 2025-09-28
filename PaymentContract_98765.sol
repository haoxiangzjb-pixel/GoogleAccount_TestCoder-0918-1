// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PaymentContract {
    address payable public owner;
    uint256 public totalPaid;

    constructor() {
        owner = payable(msg.sender);
    }

    function pay() public payable {
        require(msg.value > 0, "Must send some amount");
        totalPaid += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        owner.transfer(address(this).balance);
    }
}