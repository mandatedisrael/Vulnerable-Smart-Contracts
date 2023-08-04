// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DEXPOOL {

  address public owner;
  event hackStatus(string indexed msg);

  constructor() payable {
    owner = payable(msg.sender);
  }

  modifier onlyOwner()  {
    require(tx.origin == owner, "Only owners can make a transfer");
    _;
  }

  function transfer(address recipient, uint256 value) public payable onlyOwner {
    (bool success, ) = recipient.call{value:value}("");
    if(success){
      emit hackStatus("Contract hacked successfully and Dexpool drained");
    }else{
      emit hackStatus("Try again");
    }
  }
  function getBalance() public view returns(uint256){
    return address(this).balance;
  }
}