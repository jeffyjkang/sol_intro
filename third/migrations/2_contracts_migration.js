const ERC20Token = artifacts.require("ERC20");
const SupplyChain = artifacts.require("SupplyChain");
const BasicMath = artifacts.require("BasicMath")

module.exports = function (deployer) {
  deployer.deploy(ERC20Token, "SimpleToken", "STN", 18, 10000);
  deployer.deploy(SupplyChain);
  deployer.deploy(BasicMath);
}
