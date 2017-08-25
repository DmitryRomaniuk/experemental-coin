var Migrations = artifacts.require("./Migrations.sol");
var MigrationsSeller = artifacts.require("./MigrationsSeller.sol");

module.exports = function(deployer) {
  const tokenAmount = web3.toWei(1400000, "ether");
  deployer.deploy(Migrations, tokenAmount);
  const tokenSeller = web3.toWei(0, "ether");
  var date = Date.now();
  date += date + 3600000;
  deployer.deploy(MigrationsSeller, tokenSeller, date);
};
