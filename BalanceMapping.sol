// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BalanceMapping {
    mapping(address => uint256) private balances;

    function setBalance(address _account, uint256 _amount) public {
        balances[_account] = _amount;
    }

    function getBalance(address _account) public view returns (uint256) {
        return balances[_account];
    }
}