// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract XX2TestToken is ERC20 {
    constructor(uint256 totalSupply) ERC20("XX2TestToken", "XX2"){
        _mint(msg.sender, totalSupply);
    }
}