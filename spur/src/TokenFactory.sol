// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {token} from "../src/token.sol";

contract TokenFactory {
    address public owner;

    struct CompanyInfo {
        address tokenAddress;
        string name;
        string symbol;
        uint256 supply;
    }

    mapping(string => CompanyInfo) public registry;
    string[] public registeredCompanies;

    event TokenCreated(string companyName, address tokenAddress);

    constructor() {
        owner = msg.sender;
    }

    function createCompanyToken(
        string memory _companyName,
        string memory _symbol,
        uint256 _initialSupply
    ) public {
        require(
            registry[_companyName].tokenAddress == address(0),
            "Already exists"
        );

        CompanyToken newToken = new CompanyToken(
            _companyName,
            _symbol,
            _initialSupply,
            msg.sender
        );

        registry[_companyName] = CompanyInfo({
            tokenAddress: address(newToken),
            name: _companyName,
            symbol: _symbol,
            supply: _initialSupply
        });

        registeredCompanies.push(_companyName);

        emit TokenCreated(_companyName, address(newToken));
    }

    function getAllCompanies() public view returns (string[] memory) {
        return registeredCompanies;
    }
}
