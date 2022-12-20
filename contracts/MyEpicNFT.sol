// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721 {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    event NewEpicNFTMinted(address sender, uint256 tokenId);

    constructor () ERC721 ("Ebbi", "Dog") {
        console.log("This is my NFT contact");
    }

    function makeAnEpicNFT() public {
        require(_tokenIds.current() < 3, "All NFTs already minted");
        uint256 newItemId = _tokenIds.current();

        _safeMint(msg.sender, newItemId);

        tokenURI(newItemId);

        _tokenIds.increment();

        emit NewEpicNFTMinted(msg.sender, newItemId);

    }

    function getTotalNumberNFTMinted() public view returns(uint256) {
        return _tokenIds.current();
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        require(_exists(_tokenId));
        console.log("An NFT w/ ID %s has been minted to %s", _tokenId, msg.sender);
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                "eyJuYW1lIjoiUG9vcGluZyBFYmJpIG9uY2hhaW4iLCJkZXNjcmlwdGlvbiI6IlRoZSBzYW1lIHBvb3BpbmcgRWJiaSBidXQgb25jaGFpbi4iLCJpbWFnZSI6ImlwZnM6Ly9iYWZ5YmVpY3JhN3NoZXR2c2JvNmRscmdvYzR3NzQ2bjV6Zm96eG5lY3VodzVpcWtmZGNjYzVsdTVvZS8ifQ=="
            )
        );
    }
}