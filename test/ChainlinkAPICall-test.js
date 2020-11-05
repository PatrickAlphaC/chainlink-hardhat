const { expect } = require("chai")
const { waffle } = require("hardhat")
// Not an end-to-end testing suite. 
// Please check https://github.com/smartcontractkit/box/blob/master/test/MyContract_test.js
// For a more robust implementation


describe("ChainlinkAPICall", function () {
  let mockChainlinkAPICall, link
  beforeEach(async () => {
    let MockChainlinkAPICall = await ethers.getContractFactory("MockChainlinkAPICall")
    let MockERC20 = await ethers.getContractFactory("MockERC20")
    link = await MockERC20.deploy()
    mockChainlinkAPICall = await MockChainlinkAPICall.deploy(link.address)
  })

  it("Should be able to successfully request data", async function () {
    await mockChainlinkAPICall.requestVolumeData()
  })
})