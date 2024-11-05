package com.example.quan_li_ban_hang.controller;

import com.example.quan_li_ban_hang.model.Customer;
import com.example.quan_li_ban_hang.service.CustomerService;
import com.example.quan_li_ban_hang.service.ICustomerService;

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
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addForm(req,resp);
                break;
            case "customer-order":
                customerOderDTO(req,resp);
                break;
            default:
                showListCustomer(req,resp);
        }
    }

    private void customerOderDTO(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("customerOrderDTOs",customerService.findAllCustomerOrders());
        try {
            req.getRequestDispatcher("view/customer/customer-order.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void addForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("view/customer/add.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListCustomer(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("customers", customerService.findAll());
        try {
            req.getRequestDispatcher("view/customer/list.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "add":
                addCustomer(req,resp);
                break;
            case "delete":
                deleteCustomer(req,resp);
                break;
            case "edit":
                editCustomer(req,resp);
                break;

        }
    }

    private void editCustomer(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));

        Customer customer = new Customer(id,name,age);
        customerService.updateCustomer(customer);

        try {
            resp.sendRedirect("/customer");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteCustomer(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("idCustomer"));
        customerService.deleteCustomer(id);

        try {
            resp.sendRedirect("/customer");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void addCustomer(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        System.out.println(name);
        int age = Integer.parseInt(req.getParameter("age"));

        Customer customer = new Customer(name, age);
        customerService.addCustomer(customer);

        try {
            resp.sendRedirect("/customer");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
