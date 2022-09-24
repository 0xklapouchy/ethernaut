// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./GatekeeperOne.sol";
import "./GatekeeperOneAttacker.sol";

contract GatekeeperOneSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        GatekeeperOne instance = GatekeeperOne(getLevelInstanceWithValue(Levels.gatekeeperone, 1e15));
        GatekeeperOneAttacker attacker = new GatekeeperOneAttacker(address(instance));

        attacker.attack();

        require(validateLevelInstance(Levels.gatekeeperone, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
