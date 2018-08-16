var Migrations = artifacts.require("./Migrations.sol");
var SimpleTest = artifacts.require("./SimpleTest.sol");


module.exports = function(deployer) {
  deployer.deploy(Migrations);
  
  deployer.deploy(SimpleTest,"Hello World","123");
};
