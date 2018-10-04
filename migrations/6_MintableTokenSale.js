var VentureFusion_VET = artifacts.require("VentureFusion_VET");


module.exports = function(deployer) {

	var name = "Venture Fusion VET Token";
	var symbol = "VFVT";
	var decimals = 3;	
    var rate = new web3.BigNumber(1);

  return deployer.then(() =>
  {
	  return deployer.deploy(VentureFusion_VET, name, symbol, decimals, {gas: 6721975})
  })

};