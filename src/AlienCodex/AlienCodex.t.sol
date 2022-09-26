// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./AlienCodexAttacker.sol";

contract AlienCodex {}

contract AlienCodexSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        AlienCodex instance = AlienCodex(getLevelInstance(Levels.aliencodex));
        AlienCodexAttacker attacker = new AlienCodexAttacker(address(instance));

        attacker.attack();

        if (IS_TEST) {
            require(validateLevelInstance(Levels.aliencodex, address(instance)), "no validation");
        } else {
            submitLevelInstance(address(instance));
        }
    }
}
