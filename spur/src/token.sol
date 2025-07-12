// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SpurToken is ERC20 {
    // Constructor runs once when contract is deployed
    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _initialSupply,
        address _owner
    ) ERC20(_name, _symbol) {
        // Mint 1 million tokens to whoever deploys the contract
        // msg.sender = the address who called the function
        // _mint(msg.sender, 1000000 * 10**18);
        _mint(_owner, _initialSupply);
    }
}
