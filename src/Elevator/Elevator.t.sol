// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Elevator.sol";
import "./ElevatorAttacker.sol";

contract ElevatorSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Elevator instance = Elevator(getLevelInstance(Levels.elevator));
        ElevatorAttacker attacker = new ElevatorAttacker(address(instance));

        attacker.attack();

        require(validateLevelInstance(Levels.elevator, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
