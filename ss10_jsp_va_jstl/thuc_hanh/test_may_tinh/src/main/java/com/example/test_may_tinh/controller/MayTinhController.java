package com.example.test_may_tinh.controller;

import com.example.test_may_tinh.model.MayTinh;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MayTinhController", value = "/maytinh")
public class MayTinhController extends HttpServlet {
    private MayTinh mayTinh = new MayTinh();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String so1 = req.getParameter("num1");
        String so2 = req.getParameter("num2");
        String phepTinh = req.getParameter("phepTinh");
        String mess;

        try {
            double num1 = Double.parseDouble(so1);
            double num2 = Double.parseDouble(so2);
            double ketQua = mayTinh.mayTinh(num1, num2, phepTinh);
            mess = num1 + " " + phepTinh + " " + num2 + " = " + ketQua;
        } catch (ArithmeticException e) {
            mess = e.getMessage();
        } catch (NumberFormatException e) {
            mess = "Lỗi: Nhập vào không phải là số";
        }

        req.setAttribute("mess", mess);
        req.getRequestDispatcher("/maytinh1.jsp").forward(req, resp);
    }
}
