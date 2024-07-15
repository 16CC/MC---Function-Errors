# SecureStorage Smart Contract

## Overview

The `SecureStorage` smart contract is designed to securely manage a single value on the Ethereum blockchain. It ensures that only the designated administrator can modify the stored value, providing a secure way to manage data.

## Features

- **Admin Control**: Only the contract's admin can set, decrement, and reset the stored value.
- **Event Logging**: Emits events whenever the stored value is set, decremented, or reset, providing a traceable log of changes.
- **Error Handling**: Uses Solidity's `require`, `assert`, and `revert` statements for robust error handling.

### Functions

- `function setStoredValue(uint256 _value) public onlyAdmin { ... }`: Allows the admin to set the stored value. Requires the new value to be greater than zero.
- `function decrementStoredValue() public onlyAdmin { ... }`: Allows the admin to decrement the stored value by one. Uses `assert` to ensure the value is greater than zero.
- `function resetStoredValue() public onlyAdmin { ... }`: Allows the admin to reset the stored value to zero. Uses `revert` to stop the operation if the value is already zero.
- `function getStoredValue() public view returns (uint256) { ... }`: Allows anyone to view the current stored value.
- `function getAdmin() public view returns (address) { ... }`: Allows anyone to view the admin's address.

### Deployment

1. Open Remix IDE.
2. Create a new file named `securestorage.sol` and paste the contract code.
3. Compile the contract using the Solidity compiler.
4. Deploy the contract to the desired network.

## Author

- Clyde Calub
