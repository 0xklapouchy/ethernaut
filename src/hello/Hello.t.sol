// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Hello.sol";

contract HelloSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Instance instance = Instance(getLevelInstance(Levels.hello));

        instance.authenticate(instance.password());

        require(validateLevelInstance(Levels.hello, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
