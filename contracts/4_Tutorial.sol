// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Tutorial
 * @dev Just to learn the ropes
 */
contract Tutorial {

    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;
    
    uint256 openingTime = 1627946388;
    
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime, "Time needs to pass");
        _;
    }
    
    struct Person {
        uint _id;
        string _firstname;
        string _lastname;
    }
    
    function addPerson
        (
            string memory _firstname, 
            string memory _lastname
        ) 
            public onlyWhileOpen
        {
            incrementCount();
            people[peopleCount] = Person(peopleCount, _firstname, _lastname);
        }

    function incrementCount() internal {
        peopleCount += 1;
    }
}