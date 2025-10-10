// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RandomContract_8921 {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        owner.transfer(address(this).balance);
    }

    // A payable function to receive Ether
    function pay() public payable {
        // Function body can be empty to just receive funds
    }

    // Function to check the balance of the contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}