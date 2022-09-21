//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract feeCollector{
    address public owner;
    uint256 public balance;

    constructor(){
        owner = msg.sender; //msg.sender stands for the wallet that is currently interacting with the contract. 
    }

    receive() payable external{
        balance += msg.value; //msg.value is the amoun of ether sent in the transactions.
    }

    function withdraw(uint amount, address payable destAddr) public   {
        require(msg.sender == owner, "Only the owner can withdraw.");  //sets the privacy
        require(amount <= balance, "Insufficient balance");

        destAddr.transfer(amount);
        balance -=amount;
    }
}

