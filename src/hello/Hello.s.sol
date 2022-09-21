// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

import "forge-std/Script.sol";
import "./Hello.sol";

contract HelloSolver is Script {
    Instance challenge = Instance(0xE1f0d4A2F1f61A9D31525B8F8Cb30E008D306dC2);

    function run() external {
        vm.startBroadcast();

        challenge.authenticate(challenge.password());

        vm.stopBroadcast();
    }
}
