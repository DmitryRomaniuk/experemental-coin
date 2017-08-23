var BlockCoin = artifacts.require("./BlockCoin.sol");
var SellerContract = artifacts.require("./SellerContract.sol");

module.exports = function(deployer) {
    deployer.deploy(BlockCoin);
    deployer.deploy(SellerContract);
};
