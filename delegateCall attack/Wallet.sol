// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet{
    address public owner;
    uint256 public balance;
    event Message(string indexed message);  

    constructor() payable {
        owner = msg.sender;
    }

    function changeOwner() public{
        owner = msg.sender;

    }
    modifier onlyOwner {
        require(msg.sender == owner, "Only owners can call this function");
        _;
    }

    function transfer(address _to, uint256 amount) onlyOwner public payable {
        (bool success, ) = _to.call{value:amount}("");
        if (success){
            emit Message("Transfer done");
        }else{
            emit Message("Transfer not successs");
        }
    }
}