//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract lottery {
    address payable[] public players;//users who will buy lottery tickets
    address public manager;//only manager can call start lottery function
    address payable public winner;//winner address
    constructor() {
        manager = msg.sender;
    }

    receive() external payable {
        require(msg.value == 1 ether , "Ticket amount is 1 ETH");
        players.push(payable(msg.sender));
    }//ticket value being 1 ETH 

    function getbalance() public view returns (uint256) {//only manager can call this function.
        require(msg.sender == manager , "You are not the manager");
        return address(this).balance;
    }//balance of the smart contract. That is amount of tickets being purchased

    function random() private view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.difficulty,
                        block.timestamp,
                        players.length
                    )
                )
            );
    }//Random function which chooses winner of lottery

    function Winner() public {
        require(msg.sender == manager , "You are not the manager");//only manager can call this function
        require(players.length >= 3 , "Not enough players");

        uint256 r = random();
        uint256 index = r % players.length;
        winner = players[index];
        winner.transfer(getbalance());
    }//winner is identified and the contract amount is transfered to that winner. 
}