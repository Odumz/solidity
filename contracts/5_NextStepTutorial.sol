// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Tutorial
 * @dev Just to learn the ropes
 */
contract NextStepTutorial {
    mapping(address => uint256) public balances;
    address payable wallet;
    
    event Purchase (
        address indexed _buyer,
        uint256 _amount
    );
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    fallback() external payable {
        buyToken();
    }
    
    function buyToken() public payable {
        // buy a token
        balances[msg.sender] += 1;
        // send ether to wallet
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
}