// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Hello.sol";

contract HelloTest is Test, Ethernaut {
    function testLevel0() public broadcasted {
        Instance instance = Instance(getLevelInstance(Levels.hello));

        instance.authenticate(instance.password());

        submitLevelInstance(address(instance));
    }
}
