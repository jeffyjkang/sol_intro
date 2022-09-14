// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

contract DataTypes {
  // unsigned int, 256-bit automatically, if this is state, you have to pay for space on blockchain
  uint x = 9;
  // can store negative values
  int i = -68;
  // like uint but defining the size to 8-bit
  uint8 j = 17;
  //
  bool isEthereumCool = true;
  // address of your ether account, msg will have sender attribute, owner of the asset, the account that is sending this transaction
  address owner = msg.sender;
  // store arrays of data of any type
  bytes32 bMsg = "hello";
  // array of characters
  string sMsg = "hello";

  function getStateVariables() public view returns (uint, int, uint, bool, address, bytes32, string memory) {
    return (x, i, j, isEthereumCool, owner, bMsg, sMsg);
  }

  function setbMsg(bytes32 newValue) private {
    bMsg = newValue;
  }
}

/*
visibility modifiers
public:
  function: anyone can call
  variable: anyone can read or write to
external: only external entities can invoke a function or access a variable
internal:
  function: only functions in current smart contract (or any contract derived from it) can invoke
  variable: only accessible in current smart contract (or any contract derived from it)
  smart contract derivations: interface (template), can write smart contracts based on the template (interface)
private: nothing external or derived contract can access
  function: only functions within current smart contract can invoke
  variable: only be accessed by functions within current smart contract
*/

/*
view: tells compiler that the function will only reference local variables and not touch the blockchain (saves gas)
pure: similar to view but also ensure that data is not read from the blockchain
*/

/*
gas price:
  highest price per unit transaction creator is willing to pay
  miners (usually) choose most lucrative transactions
  higher gas prices usually mean more complex and longer to mine

gas limit:
  total number of gas units a transaction creator is willing to pay
  depends on complexity of algo

gas cost:
  every operation in solidity has a cost, add operation costs 3 gas units

transaction fee:
  fee to access the blockchain
  total cost for computations in a transaction, total gas cost * gas price

unused gas:
  gas budget - gas used
  goes back to transaction originator
*/
