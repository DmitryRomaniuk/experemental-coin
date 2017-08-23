pragma solidity ^0.4.4;

import "node_modules/zeppelin-solidity/contracts/token/MintableToken.sol";
import "node_modules/zeppelin-solidity/contracts/payment/PullPayment.sol";

contract BlockCoin is MintableToken, PullPayment {
    string public name = "the Block Token";
    string public symbol = "BlockCoin";
    uint256 public decimals = 18;

    function BlockCoin(uint256 _amount) {
        owner = msg.sender;
        mint(msg.sender, _amount);
    }
}
