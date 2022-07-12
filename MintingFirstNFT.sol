pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Kudos is ERC721 {
    constructor() ERC721("kudos", "AG") {

    }
    mapping (address => uint[]) allKudos;
    mapping (uint => Kudo) nfts;
    uint nextTokenID = 0;
    
    function giveKudos(address who, string memory what, string memory comments) public {
        Kudo memory kudo = Kudo(what, msg.sender, comments, nextTokenID);
        _mint(who, nextTokenID);
        nfts[nextTokenID] = kudo;
        allKudos[who].push(nextTokenID);
        nextTokenID = nextTokenID + 1; 
    }
    
    function getKudosLength(address who) public view returns(uint) {
        uint[] memory allKudosForWho = allKudos[who];
        return allKudosForWho.length;
    }
    
    function getKudosAtIndex(address who, uint idx) public view returns(string memory, address, string memory) { 
        Kudo memory kudo = nfts[allKudos[who][idx]];
        return (kudo.what, kudo.giver, kudo.comments);
    }

    function getNFTInfo(uint tokenID) public view returns(string memory, address, string memory) {
        Kudo memory kudo = nfts[tokenID];
        return (kudo.what, kudo.giver, kudo.comments);
    }
    
    
}

struct Kudo {
    string what;
    address giver;
    string comments;
    uint nftTokenID;
}