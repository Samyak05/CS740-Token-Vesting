// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title TokenVesting
 * @notice Task 3: Token Vesting with 6-Month Cliff
 * @dev Implements block.timestamp for time tracking and linear release.
 */
contract TokenVesting {
    address public beneficiary;
    uint256 public startTime;
    uint256 public totalAmount;
    uint256 public releasedAmount;

    // TEMPORARY FOR PROOF: Cliff is now 0, Vesting is 100 seconds
    uint256 public constant CLIFF_DURATION = 180 days; // 6 months
    uint256 public constant VESTING_DURATION = 720 days; // 24 months (2 years)

    constructor(address _beneficiary) payable {
        require(msg.value > 0, "Must fund the contract");
        beneficiary = _beneficiary;
        startTime = block.timestamp;
        totalAmount = msg.value;
    }

    function claimableAmount() public view returns (uint256) {
        if (block.timestamp < startTime + CLIFF_DURATION) {
            return 0;
        }

        if (block.timestamp >= startTime + VESTING_DURATION) {
            return totalAmount - releasedAmount;
        } else {
            uint256 timePassed = block.timestamp - startTime;
            uint256 vestedAmount = (totalAmount * timePassed) / VESTING_DURATION;
            return vestedAmount - releasedAmount;
        }
    }

    /**
     * @notice Claim a specific amount, or pass 0 to claim everything available.
     * @param _amount The amount in wei to claim. Use 0 to claim all available.
     */
    function claim(uint256 _amount) public {
        require(msg.sender == beneficiary, "Only beneficiary can claim");

        uint256 available = claimableAmount();
        require(available > 0, "No funds available for claim yet");

        // If 0 is passed, claim the full available amount
        uint256 amountToClaim = (_amount == 0) ? available : _amount;

        require(amountToClaim <= available, "Amount exceeds claimable balance");

        releasedAmount += amountToClaim;
        (bool success, ) = beneficiary.call{value: amountToClaim}("");
        require(success, "Transfer failed");
    }
}