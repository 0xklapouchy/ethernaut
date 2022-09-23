// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "forge-std/Script.sol";
import "./Levels.sol";

contract Ethernaut is Script {
    address internal constant ethernaut = 0xD991431D8b033ddCb84dAD257f4821E9d5b38C33;

    modifier broadcasted() {
        vm.startBroadcast();
        _;
        vm.stopBroadcast();
    }

    function getLevelInstance(address level) internal returns (address payable) {
        vm.recordLogs();

        (bool success, bytes memory data) = ethernaut.call(abi.encodeWithSelector(0xdfc86b17, level));
        require(success && data.length == 0, "no instance");

        Vm.Log[] memory entries = vm.getRecordedLogs();

        return abi.decode(entries[0].data, (address));
    }

    function submitLevelInstance(address instance) internal {
        (bool success, bytes memory data) = ethernaut.call(abi.encodeWithSelector(0xc882d7c2, address(instance)));
        require(success && data.length == 0, "already submited");
    }
}
