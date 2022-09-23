// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Fallout.sol";

contract FalloutTest is Test, Ethernaut {
    function testFallout() public broadcasted {
        Fallout instance = Fallout(getLevelInstance(Levels.fallout));

        instance.Fal1out();

        require(validateLevelInstance(Levels.fallout, address(instance)), "no validation");
    }
}
