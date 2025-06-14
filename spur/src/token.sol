// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SpurToken is ERC20 {
    // Constructor runs once when contract is deployed
    constructor() ERC20("Spur Token", "SPUR") {
        // Mint 1 million tokens to whoever deploys the contract
        _mint(msg.sender, 1000000 * 10**18);
    }
}
