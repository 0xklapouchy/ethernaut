// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Telephone.sol";
import "./TelephoneAttacker.sol";

contract TelephoneTest is Test, Ethernaut {
    function testTelephone() public broadcasted {
        Telephone instance = Telephone(getLevelInstance(Levels.telephone));

        TelephoneAttacker attacker = new TelephoneAttacker(address(instance));
        attacker.attack();

        require(validateLevelInstance(Levels.telephone, address(instance)), "no validation");
    }
}
