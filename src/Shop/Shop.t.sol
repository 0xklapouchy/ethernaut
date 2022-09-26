// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Shop.sol";
import "./ShopAttacker.sol";

contract ShopSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Shop instance = Shop(getLevelInstance(Levels.shop));
        ShopAttacker attacker = new ShopAttacker(address(instance));

        attacker.attack();

        if (IS_TEST) {
            require(validateLevelInstance(Levels.shop, address(instance)), "no validation");
        } else {
            submitLevelInstance(address(instance));
        }
    }
}
