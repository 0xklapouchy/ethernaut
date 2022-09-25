// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./MagicNum.sol";
import "./MagicNumAttacker.sol";

contract MagicNumSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        MagicNum instance = MagicNum(getLevelInstance(Levels.magicnum));
        MagicNumAttacker attacker = new MagicNumAttacker();

        instance.setSolver(address(attacker));

        require(validateLevelInstance(Levels.magicnum, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
