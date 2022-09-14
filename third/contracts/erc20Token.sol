// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;
import "./erc20Interface.sol";

contract ERC20 is IERC20 {

  uint constant private MAX_UINT256 = 2**256 -1;
  string public name; // Descriptive name of token
  string public symbol; // Short identifier for token
  uint8 public decimals; // How many decimals to use when displaying amounts
  uint public totalSupply; // Total number of tokens
  mapping(address => uint) public balanceOf;
  mapping(address => mapping(address => uint)) public allowance;

  constructor(
    string memory _tokenName,
    string memory _tokenSymbol,
    uint8 _decimalUnits,
    uint _initalAmount
  ) IERC20() {
    balanceOf[msg.sender] = _initalAmount; // creator owns all initial tokens
    totalSupply = _initalAmount; // update init token supply
    name = _tokenName;
    symbol = _tokenSymbol;
    decimals = _decimalUnits;
  }

  function transfer(address _recipient, uint _amount) external returns (bool success) {
    // guard, bal of sender is greater than amount sent
    require(balanceOf[msg.sender] >= _amount, "Insufficient funds for transfer");
    balanceOf[msg.sender] -= _amount;
    balanceOf[_recipient] += _amount;
    emit Transfer(msg.sender, _recipient, _amount);
    return true;
  }

  function transferFrom(address _sender, address _recipient, uint _amount) external returns (bool success) {
    uint allowedAmt = allowance[_sender][msg.sender];
    // guard, bal of sender is greater than amount sent, and sender's allowance amount is greater than amount sent
    require(balanceOf[_sender] >= _amount && allowedAmt >= _amount, "Insufficient allowed funds for transfer");
    balanceOf[_recipient] += _amount;
    balanceOf[_sender] -= _amount;
    if (allowedAmt <= MAX_UINT256) {
      allowance[_sender][msg.sender] -= _amount;
    }
    emit Transfer(_sender, _recipient, _amount);
    return true;
  }

  function approve(address _spender, uint _amount) external returns (bool success) {
    allowance[msg.sender][_spender] = _amount;
    emit Approval(msg.sender, _spender, _amount);
    return true;
  }

  // function totalSupply() public view returns (uint remaining) {
  //   return totalSupply;
  // }

  // function balanceOf(address _tokenOwner) public view returns (uint balance) {
  //   return balances[_tokenOwner];
  // }

  // function allowance(address _tokenOwner, address _spender) public view returns (uint remaining) {
  //   return allowance[_tokenOwner][_spender];
  // }

}
