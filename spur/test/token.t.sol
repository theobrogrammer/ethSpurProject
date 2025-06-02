// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@forge-std/Test.sol";
import "../src/token.sol";

contract SimpleTokenTest is Test {
    SimpleToken public token;
    address public owner;
    address public user1;

    function setUp() public {
        owner = address(this);
        user1 = makeAddr("user1");
        
        // Deploy the token
        token = new SimpleToken();
    }

    function testBasicInfo() public {
        // Check token name and symbol
        assertEq(token.name(), "Simple Token");
        assertEq(token.symbol(), "SIMPLE");
        assertEq(token.decimals(), 18);
    }

    function testInitialSupply() public {
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
        assertEq(token.balanceOf(user1), amount);
        assertEq(token.balanceOf(owner), 1000000 * 10**18 - amount);
    }
}
