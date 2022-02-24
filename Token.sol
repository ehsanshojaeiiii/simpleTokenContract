// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.10;


contract Token{

    address public minter;
    mapping(address => uint)public balances;

    event Sent(address from , address to,uint amount);
    constructor(){

        minter=msg.sender;
    }

    function mint(address reciver ,uint amount) public{
        require(msg.sender==minter);
        balances[reciver] +=amount;


    }

 
    error insufficientBalance (uint req,uint available);


    function send(address reciver,uint amount)public{
       if(amount > balances[msg.sender]){
            revert insufficientBalance({
                req:amount,
                available:balances[msg.sender]
            });
       }

        balances[msg.sender] -=amount;
        balances[reciver]+=amount;
         
        emit Sent(msg.sender,reciver,amount);
    }


}
