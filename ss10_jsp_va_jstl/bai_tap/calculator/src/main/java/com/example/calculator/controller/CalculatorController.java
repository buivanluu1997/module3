package com.example.calculator.controller;

import com.example.calculator.model.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorController extends HttpServlet {
    private Calculator calculator = new Calculator();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String first = req.getParameter("firstOperand");
        String second = req.getParameter("secondOperand");
        String operator = req.getParameter("operator");
        String message = "";

        try {
            double firstOperand = Double.parseDouble(first);
            double secondOperand = Double.parseDouble(second);
            char operatorChar = operator.charAt(0);
            double result = calculator.calculator(firstOperand, secondOperand, operatorChar);
            message = "Kết quả là: " + firstOperand +" " + operator + " " + secondOperand + " = " + result;
        } catch (ArithmeticException e) {
            message = "Lỗi: " + e.getMessage();
        } catch (NumberFormatException e) {
            message = "Lỗi: Đầu vào không hợp lệ vì không phải là số";
        }

        req.setAttribute("message", message);
        req.getRequestDispatcher("calculator.jsp").forward(req, resp);
    }
}
