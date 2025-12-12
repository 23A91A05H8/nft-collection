// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Basic skeleton for your NFT Collection Contract
// In later steps you will fill in logic for minting, transfers, approvals, etc.

contract NFTCollection {
    // ---------------------------------------------------------
    // State Variables
    // ---------------------------------------------------------
    
    string public name;         // Token name
    string public symbol;       // Token symbol
    uint256 public maxSupply;   // Maximum number of NFTs that can ever be minted
    uint256 public totalSupply; // Current number of minted NFTs

    // Mappings
    mapping(uint256 => address) public ownerOf;          // tokenId => owner
    mapping(address => uint256) public balanceOf;        // owner => balance
    mapping(uint256 => address) public tokenApprovals;   // tokenId => approved address
    mapping(address => mapping(address => bool)) public isApprovedForAll; // owner => operator approvals

    // ---------------------------------------------------------
    // Constructor
    // ---------------------------------------------------------
    
    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _maxSupply
    ) {
        name = _name;
        symbol = _symbol;
        maxSupply = _maxSupply;

        // totalSupply starts at 0
    }

    // ---------------------------------------------------------
    // Function Placeholders (You will fill these in Step 3)
    // ---------------------------------------------------------

    function mint(address to) public {
        // TODO: Implement safe mint
    }

    function transferFrom(address from, address to, uint256 tokenId) public {
        // TODO: Implement transfer logic
    }

    function approve(address to, uint256 tokenId) public {
        // TODO: Implement approval logic
    }

    function setApprovalForAll(address operator, bool approved) public {
        // TODO: Implement operator approval
    }

    function getApproved(uint256 tokenId) public view returns (address) {
        // TODO: return approved address
        return address(0);
    }

    function isApproved(address owner, address operator) public view returns (bool) {
        // TODO: return operator approval status
        return false;
    }

    // Optional: metadata
    function tokenURI(uint256 tokenId) public view returns (string memory) {
        // TODO: Return metadata URI
        return "";
    }
}
