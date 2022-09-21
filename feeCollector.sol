//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract feeCollector{
    address public owner;
    uint256 public balance;

    constructor(){
        owner = msg.sender;
    }

    receive() payable external{
        balance += msg.value;
    }

    function withdraw(uint amount, address payable destAddr) public   {
        require(msg.sender == owner, "Only the owner can withdraw.");
        require(amount <= balance, "Insufficient balance");

        destAddr.transfer(amount);
        balance -=amount;
    }
}

