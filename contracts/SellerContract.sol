pragma solidity ^0.4.4;

import "node_modules/zeppelin-solidity/contracts/lifecycle/Destructible.sol";
import "node_modules/zeppelin-solidity/contracts/math/SafeMath.sol";

contract SellerContract is Destructible {
    mapping (address => uint) balances;
    mapping (address => string) votes;
	uint releaseTime;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	function SellerContract(address _initialAccount, uint _initialBalance, uint _releaseTime) {
		balances[_initialAccount] = _initialBalance;
		releaseTime = _releaseTime;
	}

	function getBalanceInEth(address addr) returns(uint){
		return amount * conversionRate;
	}

	function getBalance(address addr) returns(uint) {
		return balances[addr];
	}

    function donate(uint256 _value) returns(uint) {
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[msg.sender] -= _value;
        balanceOf[owner] += _value;
        Transfer(msg.sender, owner, _value);
        return true;
    }

    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) internal returns (bool) { // should to be updated
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function transfer(address _to, uint256 _value) { // should to be updated
        /* Check if sender has balance and for overflows */
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);
        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }

    /**
    *
    */
    function propose(address addr) onlyOwner returns(uint) { // should to be updated
        require(now >= releaseTime);

        uint amount = token.balanceOf(this);
        require(amount > 0);
        token.transfer(beneficiary, amount);
        return balances[addr];
    }

    /**
    *
    */
    function getBackMoney(address addr) returns(uint) { // should to be updated
        require(now >= releaseTime);
        uint amount = token.balanceOf(this);
        require(amount > 0);
        token.transfer(beneficiary, amount);
        return balances[addr];
    }

	function vote(string _value) external returns(string) {
		votes[msg.sender] = strConcat(votes[msg.sender], " ");
		votes[msg.sender] = strConcat(votes[msg.sender], _value);
	}

	function getVote(address addr) external constant returns (string) {
		return votes[addr];
	}

    function strConcat(string _a, string _b) internal returns (string){
        bytes memory _bytesA = bytes(_a);
        bytes memory _bytesB = bytes(_b);
        string memory ab = new string(_bytesa.length + _bytesB.length);
        bytes memory bytesAB = bytes(ab);
        uint k = 0;
        for (uint i = 0; i < _bytesA.length; i++) bytesAB[k++] = _bytesA[i];
        for (i = 0; i < _bytesB.length; i++) bytesAB[k++] = _bytesB[i];
        return string(bytesAB);
    }
}
