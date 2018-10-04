var TokenTest = artifacts.require("TokenTest");
var TokenSale = artifacts.require("TokenSaleTest");


module.exports = function(deployer) {

  return deployer.then(() =>
  {
	  return deployer.deploy(TokenTest, {gas: 6721975})
  })
  .then(() => {
	  const tokenPrice = 10000000000000000;
	  return deployer.deploy(TokenSale, tokenPrice, "0x65d40a05b024d2e93d69c96b9dcc4f41623cf8de", TokenTest.address, {gas: 6721975})
  }).then(() => {
    	var token = TokenTest.at(TokenTest.address);
        token.transfer(TokenSale.address, 1200000000);
  })
 
};