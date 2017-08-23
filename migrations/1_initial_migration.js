var Migrations = artifacts.require("./Migrations.sol");

module.exports = function(deployer) {
  const tokenAmount = web3.toWei(1400000, "ether");
  deployer.deploy(Migrations, tokenAmount);
};
