var OwnableTest = artifacts.require("./OwnableTest.sol");
var PauseableDestructableTest = artifacts.require("./PauseableDestructableTest.sol");
var ClaimableTest = artifacts.require("./ClaimableTest.sol");

module.exports = function(deployer) {
	deployer.deploy(OwnableTest);
	deployer.deploy(PauseableDestructableTest);
	deployer.deploy(ClaimableTest);
};
