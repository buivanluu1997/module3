package com.example.quan_li_user.controller;

import com.example.quan_li_user.model.User;
import com.example.quan_li_user.service.IUserService;
import com.example.quan_li_user.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserController", value = "/user")
public class UserController extends HttpServlet {
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addUserForm(req, resp);
                break;
            case "search-country":
                searchCountryForm(req, resp);
                break;
            case "arrange-name":
                arrangeName(req,resp);
                break;
            default:
                showListUser(req, resp);
        }
    }

    private void arrangeName(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("arrange", userService.arrangeName());
        try {
            req.getRequestDispatcher("/view/user/arrange-name.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void searchCountryForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("/view/user/search-country.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void addUserForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("view/user/create.jsp").forward(req, resp);
    }

    private void showListUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("userList", userService.findAll());
        req.getRequestDispatcher("view/user/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addUser(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            case "update":
                updateUser(req, resp);
                break;
            case "search-country":
                searchCountry(req, resp);
                break;
        }
    }

    private void searchCountry(HttpServletRequest req, HttpServletResponse resp) {
        String keyword = req.getParameter("searchCountry");

        req.setAttribute("result", userService.searchCountry(keyword));
        try {
            req.getRequestDispatcher("view/user/search-country.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");

        User user = new User(id, name, email, country);
        userService.update(user);

        try {
            resp.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("idUser"));
        userService.delete(id);

        try {
            resp.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");

        User user = new User(name, email, country);
        userService.add(user);

        try {
            resp.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
