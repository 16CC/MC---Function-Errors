// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract SecureStorage {
    address private admin;

    uint256 private storedValue;

    event ValueSet(uint256 newValue);
    event ValueDecremented(uint256 newValue);
    event ValueReset();

    // Constructor sets the deployer as the admin of the contract
    constructor() {
        admin = msg.sender;
    }

    // Modifier to restrict functions to only the admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Caller is not the admin");
        _;
    }

    // Function to set the stored value, only callable by the admin
    function setStoredValue(uint256 _value) public onlyAdmin {
        require(_value > 0, "Value must be greater than zero");
        storedValue = _value;
        emit ValueSet(_value);
    }

    // Function to decrement the stored value by one, only callable by the admin
    function decrementStoredValue() public onlyAdmin {
        assert(storedValue > 0);
        storedValue -= 1;
        emit ValueDecremented(storedValue);
    }

    // Function to reset the stored value to zero, only callable by the admin
    function resetStoredValue() public onlyAdmin {
        if (storedValue == 0) {
            revert("Stored value is already zero");
        }
        storedValue = 0;
        emit ValueReset();
    }

    // Function to get the current stored value
    function getStoredValue() public view returns (uint256) {
        return storedValue;
    }

    // Function to get the admin address
    function getAdmin() public view returns (address) {
        return admin;
    }
}
