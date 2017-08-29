var BlockCoin = artifacts.require("./BlockCoin.sol");
var SellerContract = artifacts.require("./SellerContract.sol");
var Ballot = artifacts.require("./Ballot.sol");

module.exports = function(deployer) {
    deployer.deploy(BlockCoin);
    deployer.deploy(SellerContract);
    deployer.deploy(Ballot);
};
