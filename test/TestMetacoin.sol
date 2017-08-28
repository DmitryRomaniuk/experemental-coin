pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/BlockCoin.sol";

contract TestBlockCoin {

  function testInitialBalanceUsingDeployedContract() {
    BlockCoin meta = BlockCoin(DeployedAddresses.BlockCoin());

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 BlockCoin initially");
  }

  function testInitialBalanceWithNewBlockCoin() {
    BlockCoin meta = new BlockCoin();

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 BlockCoin initially");
  }

}
