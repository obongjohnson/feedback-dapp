// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Feedback.sol";

contract FeedbackTest is Test {
    Feedback public feedback;

    function setUp() public {
        feedback = new Feedback();
    }

    function testSubmitFeedback() public {
        feedback.submitFeedback("Great DApp!");
        (address user, string memory message, uint256 timestamp) = feedback.getFeedback(0);
        assertEq(user, address(this));
        assertEq(message, "Great DApp!");
        assertTrue(timestamp > 0);
    }
}

