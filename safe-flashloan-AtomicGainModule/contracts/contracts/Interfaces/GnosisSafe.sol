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

interface GnosisSafe {
    enum Operation {
        CALL,
        DELEGATECALL
    }

    function execTransactionFromModule(
        address to,
        uint256 value,
        bytes memory data,
        Operation operation
    ) external returns (bool);

    function execTransactionFromModuleReturnData(
        address to,
        uint256 value,
        bytes memory data,
        Operation operation
    ) external returns (bool, bytes memory);
}
