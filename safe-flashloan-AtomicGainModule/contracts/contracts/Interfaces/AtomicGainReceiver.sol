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

import "./GnosisSafe.sol";

/// @title AtomicGainReceiver
/// @dev A simple contract that can execute anything on behalf of a GnosisSafe, as long as assets are transferred back.
/// @author Dialectic
interface AtomicGainReceiver {
    /// @dev Function to execute with borrowed assets.
    /// @param from The safe providing the assets.
    /// @param assets The assets lent.
    /// @param amounts The amounts lent.
    /// @param data The data passed on.
    function flash(
        GnosisSafe from,
        address[] calldata assets,
        uint256[] calldata amounts,
        bytes calldata data
    ) external;
}
