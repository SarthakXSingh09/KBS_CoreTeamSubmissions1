// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SavingsBank {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Only owner");
        require(_amount <= address(this).balance, "Insufficient balance");

        payable(owner).transfer(_amount);
    }
}
