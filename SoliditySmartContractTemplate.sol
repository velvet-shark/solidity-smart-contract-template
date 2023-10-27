/*
├── Pragma (version)
├── Imports
├── Events
├── Errors
├── Interfaces
├── Libraries
└── Contracts
    ├── Type declarations
    ├── State variables
    ├── Events
    ├── Errors
    ├── Modifiers
    └── Functions
        ├── Constructor
        ├── Receive function (if exists)
        ├── Fallback function (if exists)
        ├── External
        ├── Public
        ├── Internal
        ├── Private
        ├── View
        └── Pure
*/

// SPDX-License-Identifier: MIT
pragma solidity >=0.8.16 <0.9.0; // ^0.8.16;

// Import other contracts
import "./Ownable.sol"; // Import from local
import "@openzeppelin/contracts/access/Ownable.sol"; // Import from npm
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol"; // Import from GitHub

// Events
event Change(string message, uint newVal);

// Errors
error NotEnoughBalance(uint requested, uint available);

// Interfaces
interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
}

// Libraries
library SquareLib {
    function square(uint a) internal pure returns (uint) {
        return a * a;
    }
}

// Contract

/// @title Solidity contract template
/// @author Radek Sienkiewicz
/// @notice You can use this contract for quickly and easily building your layout and structure
/// @dev Explain to a developer any extra details here (e.g. "The functions are for illustration purposes only")
contract SimpleContract is Ownable {
    // Type declarations
    struct Person {
        string name;
        uint age;
    }

    // State variables
    uint storedData;
    address owner;
    mapping(address => uint) balances;
    uint startingBalance = 1_000_000_000_000_000_000; // Underscores are commonly used in Solidity to improve readability of large numbers. Much easier to read than 1000000000000000000.

    // Events
    event Change(string message, uint newVal);

    // Errors
    error NotEnoughBalance(uint requested, uint available);

    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    /* *** Functions *** */

    // Constructor
    constructor(uint initVal) {
        storedData = initVal;
    }

    // Receive function
    receive() external payable {
        // ...
    }

    // Fallback function
    fallback() external payable {
        // ...
    }

    // External
    function externalFunc() external {
        // ...
    }

    function externalViewFunc() external view { // Within a grouping of functions (public, external, internal, private), put view and pure functions last
        // ...
    }

    // A function with a full NatSpec comment
    // It is recommended that Solidity contracts are fully annotated using NatSpec for all public interfaces (everything in the ABI).
    // All tags in NatSpec are optional. Use what makes sense for your contract.

    /// @notice Describe what the function does
    /// @dev Add any extra details for developers here
    /// @param a Describe a parameter
    /// @param b Describe a parameter
    /// @return What does it return? (e.g. "The sum of a and b")
    function publicFuncWithNatSpec(uint a, uint b) external pure returns (uint) {
        return a + b;
    }
    
    function externalPureFunc() external pure {
        // ...
    }

    // Public
    function publicFunc() public {
        // ...
        emit Change("Changed!", value); // Triggering event
    }


    // Internal
    function internalFunc() internal {
        // ...
    }

    // Private
    function privateFunc() private {
        // ...
    }
}