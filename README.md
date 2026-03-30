# FIRSTFOUNDRYREPO

`FIRSTFOUNDRYREPO` is my first project built with Foundry. It is a simple Solidity smart contract project created to practice contract development, automated testing, and project structure using the Foundry toolchain.

## Overview

The repository contains a `Calculator` smart contract that implements basic arithmetic operations:

- addition
- subtraction
- multiplication
- division

The contract also stores the latest computed value in `resultado`, assigns an `admin` address during deployment, and restricts the division function so only the admin can execute it.

This project is mainly focused on learning core Solidity and Foundry concepts through a small but complete example.

## Tech Stack

- Solidity `0.8.24`
- Foundry
- Forge Standard Library (`forge-std`)

## Project Structure

```text
.
|-- src/
|   `-- Calculator.sol
|-- test/
|   `-- CalculatorTest.t.sol
|-- lib/
|   `-- forge-std/
|-- foundry.toml
`-- README.md
```

## Smart Contract

The main contract is [src/Calculator.sol](C:/Users/dapiu/Documents/personal/blockchain accelerator/FOUNDRY/BLOQUE 6/FirstFoundryRepo/src/Calculator.sol).

### Features

- stores an initial result value through the constructor
- stores an admin address
- updates the latest result after each operation
- emits events for each arithmetic operation
- uses access control for division through `onlyAdmin`

## Tests

The test suite is located in [test/CalculatorTest.t.sol](C:/Users/dapiu/Documents/personal/blockchain accelerator/FOUNDRY/BLOQUE 6/FirstFoundryRepo/test/CalculatorTest.t.sol).

It currently covers:

- initial state validation
- addition, subtraction, and multiplication behavior
- overflow protection in multiplication
- admin-only access for division
- successful division execution by the admin
- fuzz testing for division inputs

## Foundry Configuration

The Foundry configuration is defined in [foundry.toml](C:/Users/dapiu/Documents/personal/blockchain accelerator/FOUNDRY/BLOQUE 6/FirstFoundryRepo/foundry.toml).

Current settings include:

- source directory: `src`
- output directory: `out`
- libraries directory: `lib`
- fuzz runs: `350`

## Getting Started

### Build

```bash
forge build
```

### Test

```bash
forge test --match-test nameTestFunction
```

### Format

```bash
forge fmt
```

## Learning Goals

This project helped me practice:

- writing Solidity smart contracts
- working with constructors and state variables
- using modifiers for access control
- emitting and understanding events
- writing unit tests with Foundry
- running fuzz tests
- organizing a smart contract repository

## Notes

- This repository does not currently include deployment scripts.
- The main purpose of the project is learning and experimenting with Foundry fundamentals.
