// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

contract BasicMath {
  uint constant private MAX_UINT256 = 2**256 - 1;

  function add (uint _numA, uint _numB) public pure returns (uint) {
    return (_numA + _numB);
  }
}
