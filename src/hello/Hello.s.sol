// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "../utils/Ethernaut.sol";
import "./Hello.sol";

contract HelloSolver is Ethernaut {
    function run() public broadcasted {
        Instance instance = Instance(getLevelInstance(Levels.hello));

        instance.authenticate(instance.password());

        submitLevelInstance(address(instance));
    }
}
