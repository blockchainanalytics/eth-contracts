var contract1 = artifacts.require("./Contract1.sol");
var contract2 = artifacts.require("./Contract2.sol");

module.exports = function(deployer) {

    return deployer.then(() => 
	{
		return deployer.deploy(contract1, {gas: 6721975});
    })
    .then(() => {
		return deployer.deploy(contract2, contract1.address, {gas: 6721975})
	})

};
