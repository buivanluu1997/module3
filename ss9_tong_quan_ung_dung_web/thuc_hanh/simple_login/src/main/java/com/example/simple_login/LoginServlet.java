package com.example.simple_login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String ketQua = "";
        if ("admin".equals(username) && "admin".equals(password)) {
            ketQua = " Welcome to " + username + " to website";
        } else {
            ketQua = " Login error ";
        }
        req.setAttribute("ketQua", ketQua);
        req.getRequestDispatcher("/result.jsp").forward(req, resp);
    }
}
