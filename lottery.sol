// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Lottery{
    address public manager; // address of manager 
    address payable[] public participants; // array to store participants address

    constructor()
    {
        manager=msg.sender; // global variable to store manager address
    }

    receive() external payable 
    {
        require(msg.value==2 ether); // at least 1 ether must be transferred 
        participants.push(payable(msg.sender)); // push the participants adderss n the created array 
    }

    function getBalance() public view returns(uint) // to fetch balanace 
    {
        require(msg.sender== manager); // only manager can see the balance 
        return address(this).balance; // return the balance in manager account 
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length))); // to select the winner randomly
    }

    function selectWinner() public // to select winner and transfer the money
    {
        require(msg.sender==manager);// only manager can do it 
        require(participants.length>=3); // no. of participants should be greater than 3 to select the winner 
        uint r=random(); // generate random no.
        address payable winner; // variable to store winner address
        uint index = r%participants.length; // method to select the winner 
        winner=participants[index];  
        winner.transfer(getBalance()); // transferring the money to winner
        participants=new address payable[](0); // now empty the participants list 
    }
}