// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {} //To accept the ETH sent to this contract.

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function withdraw(uint _amount) external onlyOwner {
        require(_amount < address(this).balance);
        (bool success, ) = msg.sender.call{value: _amount}(" ");
        require(success, "call failed");
    }

    function getBalance() external view returns (uint) {
        return (address(this).balance);
    }
}
