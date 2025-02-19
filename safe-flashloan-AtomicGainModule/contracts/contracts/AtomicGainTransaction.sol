/*
    
   ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██    ██████  ███████ ██    ██
  ██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██      ██    ██
  ██      ██    ██ ██    ██ █████   ██████  ██    ██ ██    ██ █████      ██   ██ █████   ██    ██
  ██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██       ██  ██
   ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██ ██ ██████  ███████   ████
  
  Find any smart contract, and build your project faster: https://www.cookbook.dev
  Twitter: https://twitter.com/cookbook_dev
  Discord: https://discord.gg/cookbookdev
  
  Find this contract on Cookbook: https://www.cookbook.dev/contracts/safe-flashloan-AtomicGainModule?utm=code
  */
  
  // SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./LoanModule.sol";
import "./Interfaces/AtomicGainReceiver.sol";

// Not the best name.

/// @title AtomicGainModule
/// @dev A simple Module to do trades etc. on behalf of a GnosisSafe, all transactions pass as long as we have equal to
///      or more of the assets lent at the end of the transaction.
/// @author Dialectic
contract AtomicGainModule is LoanModule {
    string public override NAME = "Atomic Gain Module";
    string public override VERSION = "1.0.0";

    function execute(
        GnosisSafe safe,
        address[] calldata assets,
        uint256[] calldata amounts,
        address to,
        bytes calldata data
    ) external override {
        require(amounts.length == assets.length, "Length does not match");

        uint256[] memory balances = new uint256[](amounts.length);
        for (uint256 i = 0; i < assets.length; i++) {
            balances[i] = ERC20(assets[i]).balanceOf(address(safe));
            transfer(safe, msg.sender, assets[i], amounts[i]);
        }

        AtomicGainReceiver(to).flash(safe, assets, amounts, data);

        for (uint256 i = 0; i < assets.length; i++) {
            require(ERC20(assets[i]).balanceOf(address(safe)) >= balances[i]);
        }
    }
}
