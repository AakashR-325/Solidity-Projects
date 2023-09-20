// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract IterableMapping {
    mapping(address => uint) private balances;
    mapping(address => bool) private inserted;
    address[] private keys;

    function set(address _addr, uint _val) external {
        balances[_addr] = _val;

        if (!inserted[_addr]) {
            inserted[_addr] = true;
            keys.push(_addr);
        }
    }

    function getSize() external view returns (uint) {
        return keys.length;
    }

    function first() external view returns (uint) {
        return balances[keys[0]];
    }

    function last() external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    function get(uint _i) external view returns (uint) {
        return balances[keys[_i]];
    }
}
