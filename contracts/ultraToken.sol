// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./proxiable.sol";

contract Ultratoken is ERC20("UltraToken", "UTK"), Proxiable{
    address public owner;
    bool set = false;
    string tokenName;
    string tokenSymbol;
    uint256 _tokenTotalSupply;

    function initialize() public{
        require((owner == address(0) && set == false), "already intialized");
        owner = msg.sender;
        set = true;
        tokenName = "UltraToken";
        tokenSymbol = "UTK";
        _tokenTotalSupply = 1000e18;

         _mint(address(this), _tokenTotalSupply);
    }

    function name() public view override returns (string memory) {
        return tokenName;
    }

    function symbol() public view override returns (string memory) {
        return tokenSymbol;
    }

    function totalSupply() public view override returns (uint256) {
        return _tokenTotalSupply;
    }


    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferFromContract(address _to, uint256 amount) external onlyOwner {
        uint bal = balanceOf(address(this));
        require(bal >= amount, "You are transferring more than the amount available!");
        _transfer(address(this), _to, amount);
    }

    function updateCode(address newImpAddress) external {
        updateCodeAddress(newImpAddress);
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "you are not the owner");
        _;
    }

}