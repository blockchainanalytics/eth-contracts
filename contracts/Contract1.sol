pragma solidity ^0.4.17;

contract Contract1
{

	function GetDouble(int _data) pure public returns (int _output) 
	{
		return _data * 2;
	}	

}