// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract identity 
{
    string name; // two variables are created
    uint age;

    constructor() public
    {
        name="Ravi"; // constructor called automatically
        age=17;
    }

    function getName() view public returns(string memory)
    {
        return name; // fetch name 
    }
    function getAge() view public returns(uint)
    {
        return age; // fetch age
    }

    function setAge() public 
    {
        age=age+1; // increase age by one
    }
}