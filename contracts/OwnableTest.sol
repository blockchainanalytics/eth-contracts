pragma solidity ^0.4.22;

import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract OwnableTest is Ownable{

  function HelloWorld() pure public returns (string) {
    	return "Hello World";
  }

}

