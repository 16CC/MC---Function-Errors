# SimpleVoting Contract

## Overview
The `SimpleVoting` contract allows an administrator to manage a list of nominees and enables users to vote for these nominees. It tracks votes and provides functionalities for nominee management and voting.

## Features
- **Add Nominee**: Administrator can add new nominees.
- **Remove Nominee**: Administrator can remove existing nominees.
- **Cast Vote**: Users can vote for valid nominees.
- **Reset Votes**: Administrator can reset all votes to zero.
- **Get Nominees**: Retrieve the list of all nominees.
- **Get Votes**: Retrieve the vote count for a specific nominee.
- **Verify Invariant**: Ensure at least one nominee exists.
- **Halt Voting**: Emergency function to stop voting.

## Steps to Run
1. **Deploy the Contract**: Deploy the `SimpleVoting` contract on a blockchain network (e.g., Ethereum).
2. **Interact with the Contract**:
   - Use the `addNominee` function to add new nominees (only the administrator can do this).
   - Use the `removeNominee` function to remove existing nominees (only the administrator can do this).
   - Use the `castVote` function to vote for a valid nominee.
   - Use the `resetVotes` function to reset all votes to zero (only the administrator can do this).
   - Use the `getAllNominees` function to get the list of all nominees.
   - Use the `getVotes` function to get the vote count for a specific nominee.
   - Use the `verifyInvariant` function to ensure there is at least one nominee.
   - Use the `haltVoting` function to stop voting (only the administrator can do this).

## Author
Clyde Calub
