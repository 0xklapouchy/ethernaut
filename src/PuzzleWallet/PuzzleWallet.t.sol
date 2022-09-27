// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./PuzzleWallet.sol";
import "./PuzzleWalletAttacker.sol";

contract PuzzleWalletSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        PuzzleWallet instance = PuzzleWallet(getLevelInstanceWithValue(Levels.puzzle, 1e15));
        PuzzleWalletAttacker attacker = new PuzzleWalletAttacker(address(instance));

        attacker.attack{ value: 1e15 }();

        if (IS_TEST) {
            require(validateLevelInstance(Levels.puzzle, address(instance)), "no validation");
        } else {
            submitLevelInstance(address(instance));
        }
    }
}
