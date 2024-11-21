// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// inheriting contract with ERC721 to mint NFTs
contract RealEstateNFT is ERC721 {
    uint256 public nextTokenId;
    address public admin;

    // setting contract name and value as a token in parent ERC721 contract
    constructor() ERC721("RealEstateNFT", "RET") {
        admin = msg.sender;
    }

    function mint(address to) external {
        require(msg.sender == admin, "Only admin can mint"); // only admin can mint 
        // minting nfts and sending to the receiver
        _safeMint(to, nextTokenId);
        nextTokenId++;
    }
}
