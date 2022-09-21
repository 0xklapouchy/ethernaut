// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

import "forge-std/Test.sol";
import "./Hello.sol";

contract HelloTest is Test {
    Instance challenge = Instance(0xE1f0d4A2F1f61A9D31525B8F8Cb30E008D306dC2);

    function test() public {
        vm.startBroadcast();

        challenge.authenticate(challenge.password());

        vm.stopBroadcast();
    }
}
