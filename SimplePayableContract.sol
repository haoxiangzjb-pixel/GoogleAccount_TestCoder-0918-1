// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimplePayableContract {
    address payable public owner;
    uint256 public totalValue;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {
        require(msg.value > 0, "Value must be greater than 0");
        totalValue += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        owner.transfer(address(this).balance);
        totalValue = 0;
    }
}