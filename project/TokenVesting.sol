// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title TokenVesting
 * @notice Task 3: Token Vesting with 6-Month Cliff
 * @dev Implements block.timestamp for time tracking and linear release.
 */
contract TokenVesting {
    address public beneficiary; //
    uint256 public startTime;
    uint256 public totalAmount;
    uint256 public releasedAmount;

    // TEMPORARY FOR PROOF: Cliff is now 0, Vesting is 100 seconds
    uint256 public constant CLIFF_DURATION = 180  days; // 6 months
    uint256 public constant VESTING_DURATION = 720 days; // 24 months (2 years);

    /**
     * @notice Initializes the contract with a beneficiary and total fund amount.
     */
    constructor(address _beneficiary) payable {
        require(msg.value > 0, "Must fund the contract");
        beneficiary = _beneficiary;
        startTime = block.timestamp;
        totalAmount = msg.value;
    }

    /**
     * @notice Calculates claimable funds. 0 if before 6-month cliff.
     */
    function claimableAmount() public view returns (uint256) {
        // If current_time < start_time + 6 months, claimableAmount must be 0
        if (block.timestamp < startTime + CLIFF_DURATION) {
            return 0;
        }

        // Linear release for 24 months [cite: 59]
        if (block.timestamp >= startTime + VESTING_DURATION) {
            return totalAmount - releasedAmount;
        } else {
            uint256 timePassed = block.timestamp - startTime;
            uint256 vestedAmount = (totalAmount * timePassed) / VESTING_DURATION;
            return vestedAmount - releasedAmount;
        }
    }

    /**
     * @notice Employee withdraws currently vested portion.
     */
    function claim() public {
        require(msg.sender == beneficiary, "Only beneficiary can claim");
        
        uint256 amount = claimableAmount();
        require(amount > 0, "No funds available for claim yet");

        releasedAmount += amount;
        (bool success, ) = beneficiary.call{value: amount}("");
        require(success, "Transfer failed");
    }
}