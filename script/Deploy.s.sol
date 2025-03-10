
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Feedback.sol";

contract DeployFeedback is Script {
    function run() external {
        vm.startBroadcast();
        new Feedback();
        vm.stopBroadcast();
    }
}