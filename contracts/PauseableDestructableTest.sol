pragma solidity ^0.4.22;

import "../node_modules/openzeppelin-solidity/contracts/lifecycle/Destructible.sol";
import "../node_modules/openzeppelin-solidity/contracts/lifecycle/Pausable.sol";

contract PauseableDestructableTest is Destructible, Pausable{

  function () public payable  {}               //receive payments

  function HelloWorld() pure public returns (string) {
    	return "Hello World";
  }

}

