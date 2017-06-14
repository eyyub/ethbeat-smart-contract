pragma solidity ^0.4.11;

/*
 * Ethbeat(like a heartbeat) simple smart contract acting as a proof that
 * an account was at least alive at a certain block number. 
*/
contract Ethbeat {

    // Store the last time(i.e. block.number) an account
    // has called Ethbeat.beats()
    mapping(address => uint) public ethbeats;
    
    event Beats(address indexed sender, uint indexed currentBlock);
    
    function beats() returns (address, uint) {
        ethbeats[msg.sender] = block.number;
        Beats(msg.sender, block.number);
        return (msg.sender, block.number); // for local 'call' test only
    }

    // Fallback function, cannot send ether to Ethbeat smart contract
    function() {
        throw;
    }
}
