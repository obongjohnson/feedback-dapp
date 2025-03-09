// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


contract Feedback {
    struct FeedbackEntry {
        address user;
        string message;
        uint256 timestamp;
    }

    FeedbackEntry[] public feedbacks;

    event FeedbackSubmitted(address indexed user, string message, uint256 timestamp);

    function submitFeedback(string calldata message) external {
        feedbacks.push(FeedbackEntry({
            user: msg.sender,
            message: message,
            timestamp: block.timestamp
        }));

        emit FeedbackSubmitted(msg.sender, message, block.timestamp);
    }

    function getFeedbackCount() external view returns (uint256) {
        return feedbacks.length;
    }

    function getFeedback(uint256 index) external view returns (FeedbackEntry memory) {
        require(index < feedbacks.length, "Index out of bounds");
        return feedbacks[index];
    }
}
