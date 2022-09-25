// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

contract MagicNumAttacker {
    constructor() public {
        // push1 0x2A - 42          60 2a
        // push1 0    - slot        60 00
        // mstore     - save        52
        // push1 0x20 - 32 bytes    60 20
        // push1 0    - read        60 00
        // return                   F3
        bytes32 bytecode = bytes32(uint256(0x602a60005260206000f3));
        assembly {
            mstore(0x0, bytecode)
            return(0x16, 0xa)
        }
    }
}
