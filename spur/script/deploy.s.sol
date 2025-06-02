// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@forge-std/Script.sol";
import "../src/token.sol";

contract DeploySimple is Script {
    function run() external {
        // Get private key from environment
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(deployerPrivateKey);
        
        console.log("Deploying with account:", deployer);
        console.log("Account balance:", deployer.balance);
        
        // Start recording transactions
        vm.startBroadcast(deployerPrivateKey);
        
        // Deploy the token
        SimpleToken token = new SimpleToken();
        
        // Stop recording
        vm.stopBroadcast();
        
        // Show results
        console.log("Token deployed to:", address(token));
        console.log("Token name:", token.name());
        console.log("Token symbol:", token.symbol());
        console.log("Your token balance:", token.balanceOf(deployer));
    }
}
