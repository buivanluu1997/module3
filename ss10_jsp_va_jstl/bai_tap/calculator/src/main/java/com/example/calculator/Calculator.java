package com.example.calculator;

public class Calculator {
    public double calculator(double firstOperand, double secondOperand, char operator) {
        switch (operator){
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*':
                return firstOperand * secondOperand;
            case '/':
                if (secondOperand != 0) {
                    return firstOperand / secondOperand;
                } else {
                    throw new ArithmeticException("Chia cho số 0");
                }
            default:
                throw new ArithmeticException("Hoạt động không hợp lệ");
        }
    }
}
