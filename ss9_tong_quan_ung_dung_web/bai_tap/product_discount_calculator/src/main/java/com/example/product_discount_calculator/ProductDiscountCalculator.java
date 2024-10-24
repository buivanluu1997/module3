package com.example.product_discount_calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculator", value = "/calculate-discount")
public class ProductDiscountCalculator extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productDescription = req.getParameter("productDescription");
        double listPrice = Float.parseFloat(req.getParameter("listPrice"));
        double discountPercent = Float.parseFloat(req.getParameter("discountPercent"));

        double discountAmount = (listPrice * discountPercent * 0.01);
        double discountPrice = listPrice - discountAmount;

        req.setAttribute("productDescription", productDescription);
        req.setAttribute("listPrice", listPrice);
        req.setAttribute("discountPercent", discountPercent);
        req.setAttribute("discountAmount", discountAmount);
        req.setAttribute("discountPrice", discountPrice);

        req.getRequestDispatcher("display-discount.jsp").forward(req, resp);
    }
}
