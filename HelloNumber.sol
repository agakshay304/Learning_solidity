// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract HelloNumber{
    int number;
    function numberexchange(int num) public{
        number=num;
    }

    function sumNumber(int newNumber) public view returns (int) {
        return number+newNumber;
    }
}