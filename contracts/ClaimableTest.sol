pragma solidity ^0.4.22;

import "../node_modules/openzeppelin-solidity/contracts/ownership/Claimable.sol";

contract ClaimableTest is Claimable{

  function HelloWorld() pure public returns (string) {
    	return "Hello World";
  }

}

