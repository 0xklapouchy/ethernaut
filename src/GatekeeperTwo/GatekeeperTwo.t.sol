// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./GatekeeperTwo.sol";
import "./GatekeeperTwoAttacker.sol";

contract GatekeeperTwoSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        GatekeeperTwo instance = GatekeeperTwo(getLevelInstanceWithValue(Levels.gatekeepertwo, 1e15));
        GatekeeperTwoAttacker attacker = new GatekeeperTwoAttacker(address(instance));

        require(validateLevelInstance(Levels.gatekeepertwo, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
