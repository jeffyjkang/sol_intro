// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

// abstract contract ERC20Interface {
//   uint public totSupply;

//   function totalSupply() public virtual view returns (uint);
//   function balnceOf(address tokenOwner) public virtual view returns (uint balance);
//   function allowance(address tokenOwner, address spender) public virtual view returns (uint remaining);
//   function transfer(address to, uint tokens) public virtual returns (bool success);
//   function approve(address spender, uint tokens) public virtual returns (bool success);
//   function transferFrom(address from, address to, uint tokens) public virtual returns (bool success);

//   event Transfer(address indexed from, address indexed to, uint tokens);
//   event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
// }

interface IERC20 {
  // uint public totSupply;

  function totalSupply() external view returns (uint);
  function balanceOf(address tokenOwner) external view returns (uint balance);
  function allowance(address tokenOwner, address spender) external view returns (uint remaining);
  function transfer(address recipient, uint amount) external returns (bool success);
  function approve(address spender, uint amount) external returns (bool success);
  function transferFrom(address sender, address recipient, uint amount) external returns (bool success);

  event Transfer(address indexed sender, address indexed recipient, uint amount);
  event Approval(address indexed tokenOwner, address indexed spender, uint amount);
}
