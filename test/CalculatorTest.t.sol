// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import "../src/Calculator.sol";
import "forge-std/Test.sol";

contract CalculatorTest is Test {

    Calculator calculator;
    uint256 public firstResultado = 100;
    address public admin = vm.addr(1);
    address public randomUser = vm.addr(2);

    function setUp() public {
        calculator = new Calculator(firstResultado, admin);
    }

    // Unit Testing
    function testCheckFirstResultado() public view{
        uint256 firstResultado_ = calculator.resultado();
        assert(firstResultado_ == firstResultado);
    }

    function testAddition() public{

        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 5;

        uint256 resultado_ = calculator.addition(firstNumber_, secondNumber_);

        assert(resultado_ == firstNumber_ + secondNumber_);
    }

    function testSubstraction() public{

        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 5;

        uint256 resultado_ = calculator.substraction(firstNumber_, secondNumber_);

        assert(resultado_ == firstNumber_ - secondNumber_);
    }

    function testMultiplier() public{

        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 5;

        uint256 resultado_ = calculator.multiplier(firstNumber_, secondNumber_);

        assert(resultado_ == firstNumber_ * secondNumber_);
    }

    function testCanNotMultiply2LargeNUmbers() public {

        uint256 firstNumber_ = 115792089237316195423570985008687907853269984665640564039457584007913129639934;
        uint256 secondNumber_ = 5;

        vm.expectRevert();
        calculator.multiplier(firstNumber_, secondNumber_);
    }

    function testIfNotAdminCallDivisionReverts() public {

        vm.startPrank(randomUser);

        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 2;
        vm.expectRevert();
        calculator.division(firstNumber_, secondNumber_);

        vm.stopPrank();
    }

    function testAdminCanCallDivisionCorrectly() public {

        vm.startPrank(admin);

        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 2;
        calculator.division(firstNumber_, secondNumber_);

        vm.stopPrank();
    }

    function testDefaultCanNotCallDivisionCorrectly() public {

        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 2;
        console.log(msg.sender);
        vm.expectRevert();
        calculator.division(firstNumber_, secondNumber_);
    }

    function testDefaultExecutesCorrectly() public{
        vm.startPrank(admin);
        
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 2;
        uint256 resultado_ = calculator.division(firstNumber_, secondNumber_);  
        assert(resultado_ == firstNumber_ / secondNumber_);

        vm.stopPrank();
    }

    function testCanNotDivideByZero() public {
        vm.startPrank(admin);
        
        uint256 firstNumber_ = 5;
        uint256 secondNumber_ = 0;

        vm.expectRevert();
        calculator.division(firstNumber_, secondNumber_);  
        
        vm.stopPrank();
    }

    // Unit testting = given inputs
    // Fuzzing Testing = random inputs

    // Fuzzing Test
    function testFuzzingDivision (uint256 firstNumber_, uint256 secondNumber_) public{
        vm.startPrank(admin);

        calculator.division(firstNumber_, secondNumber_);  
        
        vm.stopPrank();
    }


}