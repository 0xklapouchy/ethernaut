// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./DexTwo.sol";
import "./DexTwoAttacker.sol";

contract DexTwoSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        DexTwo instance = DexTwo(getLevelInstanceFromEntry(Levels.dextwo, 11));
        DexTwoAttacker attacker = new DexTwoAttacker(address(instance));

        attacker.attack();

        if (IS_TEST) {
            require(validateLevelInstance(Levels.dextwo, address(instance)), "no validation");
        } else {
            submitLevelInstance(address(instance));
        }
    }
}
