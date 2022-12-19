// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

import "hardhat/console.sol";

contract Payment {
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }


    function payOwner() public payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Failed to transfer Ether");
    }

    function getContractBalance() external view returns (uint){
        return address(this).balance;
    }


}
