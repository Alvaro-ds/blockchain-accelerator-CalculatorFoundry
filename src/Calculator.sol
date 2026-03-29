// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract Calculator {

    uint256 public resultado;

    constructor(uint256 firstResultado_) {
        resultado = firstResultado_;
    }


    // Functions

    // 1. Addition
    function addition(uint256 firstNumber_, uint256 secondNumber_) external returns(uint256 resultado_) {
        resultado_ = firstNumber_ + secondNumber_;
        
    }

    // 2. Subtraction

    // 3. Multiplier

    // 4. Division
}
