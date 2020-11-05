
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

import "../oracleClient/IOracleClient.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MockChainlinkAPICall is IOracleClient, ChainlinkClient, Ownable {
    uint private _price = 10**18;
    uint private _decs = 18;

    event Tweet(string content);
    event TweetId(uint256 id);
    address public governance;
    address public link;

    bool public governanceSet;

    constructor(address _link) public {
        //setPublicChainlinkToken();
        link = _link;
    }

    function setGovernance(address _governance) external onlyOwner {
        require(governanceSet == false, "Governance can only be set once!");
        governance = _governance;
        governanceSet = true;
    }

    function getPrice() external view override returns (uint, uint) {
        return (_price, _decs);
    }

    function paymentTokenAddress() external view override returns (address) {
        //return chainlinkTokenAddress();
        return link;
    }

    function sendTweet(string memory content) external override onlyGovernance {
        emit Tweet(content);
    }

    function returnTweetId(bytes32 _requestId, uint256 _tweetId) public recordChainlinkFulfillment(_requestId){
        emit TweetId(_tweetId);
    }

    modifier onlyGovernance() {
        require(msg.sender == governance, "Governance only");
        _;
    }
}