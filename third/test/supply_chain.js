const SupplyChain = artifacts.require("SupplyChain");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("SupplyChain", function (/* accounts */) {
  it("should assert true", async function () {
    await SupplyChain.deployed();
    return assert.isTrue(true);
  });
  it("should create a Participant", async () => {
    let instance = await SupplyChain.deployed();
    await instance.addParticipant("a", "passA", "0x1c107580a026e707d39F216bc53b207fA4a6828C", "Manufacturer")
    let participant = await instance.participants(0)
    assert.equal(participant[0], "a")
    assert.equal(participant[2], "Manufacturer")
  })
  it("should return participant details", async () => {
    let instance = await SupplyChain.deployed()
    let participantDetails = await instance.getParticipant(0)
    assert.equal(participantDetails[0], "a")
  })
});
