// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem { 
    struct Voter {
        bool isRegistered;
        bool hasVoted;
        uint candidateVoted;
        string state;
        string voterId; // Clave de Elector
        string validity; // OCR - Vigencia
        string cic;
    }
    address public admin;
    mapping(address => Voter) public voters;
    mapping(address => Voter) public activatedVoters;
    bool public votingActive;
    constructor() {
        admin = msg.sender;
       
    }
     function startVoting() public {
        require(admin == msg.sender, "No eres el Administrador");
        votingActive = true; 
        
    }
     function endVoting() public {
        require(admin == msg.sender, "No eres el Administrador");
        votingActive = false; 
        
    }
     function registerVoter(
        address _voter, 
        string memory _state,     
        string memory _voterId, 
        string memory _validity, 
        string memory _cic
    ) public  {
        require(admin == msg.sender, "No eres el Administrador");
        
        voters[_voter].state = _state;
        voters[_voter].voterId = _voterId;
        voters[_voter].validity = _validity;
        voters[_voter].cic = _cic;

    }
    function createDemoUsers() public {
        require(admin == msg.sender, "No eres el Administrador");
        // create first user
        voters[0xdD870fA1b7C4700F2BD7f44238821C26f7392148].state = "CDMX";
        voters[0xdD870fA1b7C4700F2BD7f44238821C26f7392148].voterId = "Vot123";
        voters[0xdD870fA1b7C4700F2BD7f44238821C26f7392148].validity = "1234";
        voters[0xdD870fA1b7C4700F2BD7f44238821C26f7392148].cic = "1234";

        // create second user
        
        voters[0x583031D1113aD414F02576BD6afaBfb302140225].state = "Yucatan";
        voters[0x583031D1113aD414F02576BD6afaBfb302140225].voterId = "Vot123";
        voters[0x583031D1113aD414F02576BD6afaBfb302140225].validity = "1234";
        voters[0x583031D1113aD414F02576BD6afaBfb302140225].cic = "5678";

        // create first user
        voters[0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB].state = "Jalisco";
        voters[0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB].voterId = "Vot123";
        voters[0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB].validity = "1234";
        voters[0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB].cic = "9101";

        // create first user
        voters[0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C].state = "Nuevo Leon";
        voters[0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C].voterId = "Vot123";
        voters[0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C].validity = "1234";
        voters[0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C].cic = "1213";
    }

    function registerForVoting(
        string memory _state,     
        string memory _voterId, 
        string memory _validity, 
        string memory _cic
        )public  {
        //If the voter is in the nominal list (voters). Then, it can be registered for remote voting in the activatedVoters mapping
        if (keccak256(abi.encodePacked(voters[msg.sender].validity))  == keccak256(abi.encodePacked(""))){
            revert();
        }
        activatedVoters[msg.sender].state = _state;
        activatedVoters[msg.sender].voterId = _voterId;
        activatedVoters[msg.sender].validity = _validity;
        activatedVoters[msg.sender].cic = _cic;
    }
}