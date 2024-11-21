// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FractionalRealEstate is ERC20 {
    address public nftContract;
    uint256 public nftTokenId;

    constructor(
        address _nftContract,
        uint256 _nftTokenId
    ) ERC20("RealEstateShare", "RESHARE") {
        nftContract = _nftContract;
        nftTokenId = _nftTokenId;
        _mint(msg.sender, 1000 * 10 ** decimals());
    }
}
