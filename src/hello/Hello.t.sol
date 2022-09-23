// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Hello.sol";

contract HelloTest is Test, Ethernaut {
    function testHello() public broadcasted {
        Instance instance = Instance(getLevelInstance(Levels.hello));

        instance.authenticate(instance.password());

        require(validateLevelInstance(Levels.hello, address(instance)), "no validation");
    }
}
