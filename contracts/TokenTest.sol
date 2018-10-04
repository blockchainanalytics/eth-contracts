pragma solidity ^0.4.22;

import '../node_modules/openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol';
import '../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol';
import '../node_modules/openzeppelin-solidity/contracts/payment/PullPayment.sol';


contract TokenTest is StandardToken, Ownable, PullPayment {

    string public name = 'MyToken';
    string public symbol = 'MTK';
    uint8 public decimals = 2;
    uint public INITIAL_SUPPLY = 1200000000;

    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        owner = msg.sender;
    }

}
