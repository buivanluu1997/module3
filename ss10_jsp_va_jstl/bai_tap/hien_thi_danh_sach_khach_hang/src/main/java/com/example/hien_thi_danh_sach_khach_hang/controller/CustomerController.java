package com.example.hien_thi_danh_sach_khach_hang.controller;

import com.example.hien_thi_danh_sach_khach_hang.model.Customer;
import com.example.hien_thi_danh_sach_khach_hang.service.CustomerService;
import com.example.hien_thi_danh_sach_khach_hang.service.ICustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerController", value = "/customer")
public class CustomerController extends HttpServlet {
    private ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customers", customerService.findAll());
        req.getRequestDispatcher("/view/list_customer.jsp").forward(req, resp);
    }
}
