package com.example.quan_ly_san_pham.controller;

import com.example.quan_ly_san_pham.model.Product;
import com.example.quan_ly_san_pham.service.IProductService;
import com.example.quan_ly_san_pham.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addProductForm(req,resp);
                break;
            case "find-id":
                findIdProductForm(req,resp);
                break;
            default:
                showListProduct(req, resp);
        }
    }

    private void findIdProductForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("view/product/find-id.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void addProductForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("view/product/create.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListProduct(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("products", productService.findAll());
        try {
            req.getRequestDispatcher("/view/product/list.jsp").forward(req, resp);
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
        switch (action) {
            case "create":
                addProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            case "find-id":
                findIdProduct(req, resp);
                break;
        }
    }

    private void findIdProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));

        Product product = productService.findId(id);
        if (product == null) {
            req.setAttribute("errorMessage", "Sản phẩm không tồn tại với ID: " + id);
            try {
                req.getRequestDispatcher("view/product/error.jsp").forward(req,resp);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            req.setAttribute("product", product);
            try {
                req.getRequestDispatcher("view/product/find-id.jsp").forward(req,resp);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("productId"));
        productService.delete(id);

        try {
            resp.sendRedirect("/product");
        } catch (IOException e) {
                throw new RuntimeException(e);
        }
    }

    private void addProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("productId"));
        String name = req.getParameter("productName");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        Product product = new Product(id, name, price, quantity);
        productService.saveProduct(product);

        try {
            resp.sendRedirect("/product");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
