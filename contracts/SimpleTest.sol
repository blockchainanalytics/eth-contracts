pragma solidity ^0.4.18;

contract SimpleTest {
    
  string public currentString;
  uint8 public currentInt;
  uint8 public currentInt2;

  constructor(string cs, uint8 ci) public 
  {
    currentString = cs;
    currentInt = ci;
  }


  function setCurrentData(string cs, uint8 ci) public 
  {
    currentString = cs;
    currentInt = ci;
  }


  function getCurrentStringData() view public returns (string)
  {
     return currentString;
  }
  
  
  function getCurrentIntData() view public returns (uint8)
  {
     return currentInt;
  }
  
}
