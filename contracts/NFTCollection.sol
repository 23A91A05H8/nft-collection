// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NFTCollection {
    // ---------------------------------------------------------
    // State Variables
    // ---------------------------------------------------------
    
    string public name;         // Token name
    string public symbol;       // Token symbol
    uint256 public maxSupply;   // Maximum number of NFTs allowed
    uint256 public totalSupply; // Minted NFTs count

    // Mappings
    mapping(uint256 => address) public ownerOf;               // tokenId → owner
    mapping(address => uint256) public balanceOf;             // owner → balance
    mapping(uint256 => address) public tokenApprovals;        // tokenId → approved address
    mapping(address => mapping(address => bool)) public isApprovedForAll; // owner → operator approvals


    // ---------------------------------------------------------
    // Step 3: Access Control + Pause State
    // ---------------------------------------------------------

  // ---------------------------------------------------------
    // Metadata / Token URI 
    // ---------------------------------------------------------

    string private baseURI;

    // Admin function to set metadata base URI
    function setBaseURI(string memory _baseURI) public onlyAdmin {
        baseURI = _baseURI;
    }

    // Return metadata URL for each token
    function tokenURI(uint256 tokenId) public view returns (string memory) {
        require(ownerOf[tokenId] != address(0), "Token does not exist");

        // Convert tokenId to string
        return string(abi.encodePacked(baseURI, _toString(tokenId)));
    }

    // Helper function to convert uint256 -> string
    function _toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
    address private _admin;   // Contract admin/owner
    bool public paused = false; // Pause minting state

    modifier onlyAdmin() {
        require(msg.sender == _admin, "Only admin can perform this action");
        _;
    }

    function pauseMinting() public onlyAdmin {
        paused = true;
    }

    function unpauseMinting() public onlyAdmin {
        paused = false;
    }


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

        // Set deployer as admin
        _admin = msg.sender;

        // totalSupply starts at 0
    }


    // ---------------------------------------------------------
    // Function Placeholders (filled in future steps)
    // ---------------------------------------------------------

    function mint(address to) public {
        require(!paused, "Minting is paused");
        // TODO: Implement safe mint logic in next step
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

    // Optional metadata
    function tokenURI(uint256 tokenId) public view returns (string memory) {
        // TODO: return metadata URI
        return "";
    }
}  
