const BasicMath = artifacts.require("BasicMath");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("BasicMath", function (/* accounts */) {
  it("the sum should not overflow", async () => {
    try {
      let instance = await BasicMath.deployed()
      await instance.add((2**256 - 1), 5)
      assert.ok(false, "Threw an exception instead of overflowing")
    } catch (error) {
      assert.ok(true, "Caught the exception")
    }
  })
  it("should return sum", async () => {
    let instance = await BasicMath.deployed()
    let res = await instance.add(5, 5) // BN: a stored as hex
    assert.equal(res.toNumber(), 10)
  })
});
