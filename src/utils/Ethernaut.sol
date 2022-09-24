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
        IEthernaut(ethernaut).createLevelInstance(level);
        Vm.Log[] memory entries = vm.getRecordedLogs();

        return abi.decode(entries[0].data, (address));
    }

    function getLevelInstanceFromEntry(address level, uint256 entry) internal returns (address payable) {
        vm.recordLogs();
        IEthernaut(ethernaut).createLevelInstance(level);
        Vm.Log[] memory entries = vm.getRecordedLogs();

        return abi.decode(entries[entry].data, (address));
    }

    function getLevelInstanceWithValue(address level, uint256 value) internal returns (address payable) {
        vm.recordLogs();
        IEthernaut(ethernaut).createLevelInstance{ value: value }(level);
        Vm.Log[] memory entries = vm.getRecordedLogs();

        return abi.decode(entries[0].data, (address));
    }

    function validateLevelInstance(address level, address instance) internal returns (bool) {
        return ILevel(level).validateInstance(instance, msg.sender);
    }

    function submitLevelInstance(address instance) internal {
        IEthernaut(ethernaut).submitLevelInstance(instance);
    }
}

interface IEthernaut {
    function createLevelInstance(address level) external payable;

    function submitLevelInstance(address instance) external;
}

interface ILevel {
    function validateInstance(address instance, address player) external returns (bool);
}
