// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    address public administrator;
    mapping(string => uint256) public votes;
    string[] public nominees;

    constructor() {
        administrator = msg.sender;
        nominees = ["Jason", "Andrew", "Vince"]; // Initialize the nominees
    }

    modifier onlyAdmin() {
        require(msg.sender == administrator, "Not the contract owner");
        _;
    }

    // Add a new nominee
    function addNominee(string memory nominee) public onlyAdmin {
        require(!isValidNominee(nominee), "Nominee already exists");
        nominees.push(nominee);
    }

    // Remove an existing nominee
    function removeNominee(string memory nominee) public onlyAdmin {
        require(isValidNominee(nominee), "Invalid nominee");

        // Find and remove the nominee
        for (uint256 i = 0; i < nominees.length; i++) {
            if (keccak256(abi.encodePacked(nominees[i])) == keccak256(abi.encodePacked(nominee))) {
                nominees[i] = nominees[nominees.length - 1];
                nominees.pop();
                delete votes[nominee];
                break;
            }
        }
    }

    // Cast a vote for a nominee
    function castVote(string memory nominee) public {
        require(isValidNominee(nominee), "Invalid nominee");
        votes[nominee] += 1;
    }

    // Check if a nominee is valid
    function isValidNominee(string memory nominee) internal view returns (bool) {
        for (uint256 i = 0; i < nominees.length; i++) {
            if (keccak256(abi.encodePacked(nominees[i])) == keccak256(abi.encodePacked(nominee))) {
                return true;
            }
        }
        return false;
    }

    // Reset all votes to zero
    function resetVotes() public onlyAdmin {
        for (uint256 i = 0; i < nominees.length; i++) {
            votes[nominees[i]] = 0;
        }
    }

    // Get the list of all nominees
    function getAllNominees() public view returns (string[] memory) {
        return nominees;
    }

    // Get the number of votes for a specific nominee
    function getVotes(string memory nominee) public view returns (uint256) {
        require(isValidNominee(nominee), "Invalid nominee");
        return votes[nominee];
    }

    // Verify the invariant that there should be at least one nominee
    function verifyInvariant() public view {
        assert(nominees.length > 0);
    }

    // Emergency stop voting function
    function haltVoting() public view onlyAdmin {
        revert("You are not allowed to stop voting");
    }
}

