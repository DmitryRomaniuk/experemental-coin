pragma solidity ^0.4.4;

import "node_modules/zeppelin-solidity/contracts/token/MintableToken.sol";

contract BlockCoin is  {
	mapping (address => uint) balances;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	function BlockCoin() {
		balances[tx.origin] = 10000;
	}

	function sendCoin(address receiver, uint amount) returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		Transfer(msg.sender, receiver, amount);
		return true;
	}

	function getBalanceInEth(address addr) returns(uint){
		return amount * conversionRate;
	}

	function getBalance(address addr) returns(uint) {
		return balances[addr];
	}

	function donate(address addr) returns(uint) {
		return balances[addr];
	}

	function propose(address addr) returns(uint) {
		return balances[addr];
	}

	function vote(address addr) returns(uint) {
		return balances[addr];
	}
}
