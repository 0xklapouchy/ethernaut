// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./CoinFlip.sol";
import "./CoinFlipAttacker.sol";

contract CoinFlipSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        CoinFlip instance = CoinFlip(getLevelInstance(Levels.coinflip));
        CoinFlipAttacker attacker = new CoinFlipAttacker(address(instance));

        for (uint256 i = 0; i < 10; i++) {
            vm.roll(1337 + i);
            attacker.attack();
        }

        require(validateLevelInstance(Levels.coinflip, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
