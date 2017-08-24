pragma solidity ^0.4.4;

import "node_modules/zeppelin-solidity/contracts/lifecycle/Destructible.sol";

contract SellerContract is Destructible {
    mapping (address => uint) balances;
    mapping (address => string) votes;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	function SellerContract(address initialAccount, uint initialBalance) {
		balances[initialAccount] = initialBalance;
		totalSupply = initialBalance;
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

    function transfer(address _to, uint256 _value) {
        /* Check if sender has balance and for overflows */
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);
        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }

	function donate(uint256 _value) returns(uint) {
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[msg.sender] -= _value;
        balanceOf[owner] += _value;
		Transfer(msg.sender, owner, _value);
		return true;
	}

	function propose(address addr) returns(uint) {
		return balances[addr];
	}

	function vote(address addr) returns(uint) {
		return balances[addr];
	}

    function strConcat(string _a, string _b) internal returns (string){
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        string memory ab = new string(_ba.length + _bb.length);
        bytes memory bytesab = bytes(ab);
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++) bytesab[k++] = _ba[i];
        for (i = 0; i < _bb.length; i++) bytesab[k++] = _bb[i];
        return string(babcde);
    }

    function strConcat(string _a, string _b) internal returns (string) {
        return strConcat(_a, _b);
    }
}
