// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@forge-std/Test.sol";
import "../src/token.sol";

contract TestSpurToken is Test {
    SpurToken public token;
    address public owner;
    address public user1;

    function setUp() public {
        owner = address(this);
        user1 = makeAddr("user1");
        
        // Deploy the token
        token = new SpurToken();
    }

    function testBasicInfo() public view {
        // Check token name and symbol
        assertEq(token.name(), "Spur Token");
        assertEq(token.symbol(), "SPUR");
        assertEq(token.decimals(), 18);
    }

    function testInitialSupply() public view {
        // Check total supply is 1 million tokens
        assertEq(token.totalSupply(), 1000000 * 10**18);
        // Check owner has all tokens
        assertEq(token.balanceOf(owner), 1000000 * 10**18);
    }

    function testTransfer() public {
        // Transfer 1000 tokens to user1
        uint256 amount = 1000 * 10**18;
        token.transfer(user1, amount);
        
        // Check balances
        // Owner balance before the transfer is 100000 * 10**18, for more info go look at spur/src/token.sol
        assertEq(token.balanceOf(user1), amount);
        assertEq(token.balanceOf(owner), 1000000 * 10**18 - amount);
    }
}
