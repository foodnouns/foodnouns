// SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

import "../governance/GovernorNDelegate.sol";

contract GovernorNDelegateHarness is GovernorNDelegate {
    function initialize(
        address timelock_,
        address nouns_,
        address vetoer_,
        uint votingPeriod_,
        uint votingDelay_,
        uint proposalThresholdBPS_,
        uint quorumVotesBPS_)
    override public {
        require(msg.sender == admin, "GovernorN::initialize: admin only");
        require(address(timelock) == address(0), "GovernorN::initialize: can only initialize once");
        
        timelock = TimelockInterface(timelock_);
        nouns = NounsInterface(nouns_);
        vetoer = vetoer_;
        votingPeriod = votingPeriod_;
        votingDelay = votingDelay_;
        proposalThresholdBPS = proposalThresholdBPS_;
        quorumVotesBPS = quorumVotesBPS_;
    }
}