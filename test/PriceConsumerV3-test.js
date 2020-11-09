const { expect } = require("chai")
const { waffle } = require("hardhat")
// Not an end-to-end testing suite. 
// Please check https://github.com/smartcontractkit/box/blob/master/test/MyContract_test.js
// For a more robust implementation


describe("PriceConsumerV3", function () {
  beforeEach(async () => {
    let PriceConsumerV3 = await ethers.getContractFactory("PriceConsumerV3")
    PriceConsumerV3 = await PriceConsumerV3.deploy()
  })

  it("Should be able to successfully get round data", async function () {
    await PriceConsumerV3.requestVolumeData()
  })
})