// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Denial.sol";
import "./DenialAttacker.sol";

contract DenialSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Denial instance = Denial(getLevelInstanceWithValue(Levels.denial, 1e15));
        DenialAttacker attacker = new DenialAttacker(address(instance));

        attacker.attack();

        if (IS_TEST) {
            require(validateLevelInstance(Levels.denial, address(instance)), "no validation");
        } else {
            submitLevelInstance(address(instance));
        }
    }
}
