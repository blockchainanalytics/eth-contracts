pragma solidity ^0.4.22;

import './TokenTest.sol';
import "../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";
import '../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol';


contract TokenSaleTest is Ownable {
  using SafeMath for uint256;
  using SafeERC20 for TokenTest;
  
  TokenTest public token;
  address public wallet;
  uint256 public rate;


  // Amount of wei raised
  uint256 public weiRaised;

  event TokenPurchase(
    address indexed purchaser,
    address indexed beneficiary,
    uint256 value,
    uint256 amount
  );



  constructor(uint256 _rate, address _wallet, TokenTest _token) public {
      require(_rate > 0);
      require(_wallet != address(0));
      require(_token != address(0));

      rate = _rate;
      wallet = _wallet;
      token = _token;
  }


  function () external payable {
       buyTokens(msg.sender);
  }


  function buyTokens(address _beneficiary) public payable 
  {
       uint256 weiAmount = msg.value;
       _preValidatePurchase(_beneficiary, weiAmount);

       // calculate token amount to be created	   
       uint256 tokens = _getTokenAmount(weiAmount);

	   // update state
       weiRaised = weiRaised.add(weiAmount);

	   _processPurchase(_beneficiary, tokens);
       emit TokenPurchase(
         msg.sender,
         _beneficiary,
         weiAmount,
         tokens
       );
	   
	   _updatePurchasingState(_beneficiary, weiAmount);
	   
       _forwardFunds();
       _postValidatePurchase(_beneficiary, weiAmount);	   
  }


  function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) pure internal
  {
      require(_beneficiary != address(0));
      require(_weiAmount != 0);
  }
  
  function _postValidatePurchase( address _beneficiary, uint256 _weiAmount ) internal
  {
     // optional override
  }  


  function _processPurchase(address _beneficiary, uint256 _tokenAmount) internal
  {
    _deliverTokens(_beneficiary, _tokenAmount);
  }
  
  
  function _deliverTokens( address _beneficiary, uint256 _tokenAmount ) internal
  {
    token.safeTransfer(_beneficiary, _tokenAmount);
  }
  

  function _updatePurchasingState( address _beneficiary, uint256 _weiAmount )internal
  {
    // optional override
  }  
  

  function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256)
  {
      return _weiAmount.div(rate);
  }


  function _forwardFunds() internal 
  {
      wallet.transfer(msg.value);
  }

}
