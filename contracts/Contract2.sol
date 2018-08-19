pragma solidity ^0.4.17;

import "./Contract1.sol";

contract Contract2 
{

	address contract1Address;	
	int public _data;
	
	constructor(address _contract1) public {
		contract1Address = _contract1;
	}

	function SetData(int number) public {
		Contract1 con = Contract1(contract1Address);
		_data = con.GetDouble(number);
	}
  	
	function getCurrentValue() view public returns (int)
    {
       return _data;
    }
	
}
