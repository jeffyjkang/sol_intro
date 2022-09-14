// compiler version, when inputing `truffle version` in command line, solc version will display
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

// contract name
contract HelloWorld {
  // type, access modifier, name
  string private helloMessage = "Hello World!";
  // access modifier, view: local values, not on block chain, returns string from local mem
  function getHelloMessage() public view returns (string memory) {
    return helloMessage;
  }
}

// f5: hotkey for run compiler on vscode
// (sudo) truffle deploy (--reset): deploys || truffle migrate
// truffle console: opens up truffle console
// HelloWorld.deployed().then((instance)=>instance) : return pointer to instance
// HelloWorld.deployed().then(instance=>instance.getHelloMessage()): return message on contract
