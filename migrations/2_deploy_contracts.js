var BlockCoin = artifacts.require('./BlockCoin.sol');
var SellerContract = artifacts.require('./SellerContract.sol');


module.exports = function(deployer) {
    const tokenAmount = web3.toWei(123456, "ether");
    deployer.deploy(BlockCoin, tokenAmount);
    const tokenSeller = web3.toWei(0, "ether");
    var date = Date.now();
    date += date + 3600000;
    deployer.deploy(SellerContract, tokenSeller, date);
};