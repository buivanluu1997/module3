package com.example.student_manager.controller;

import com.example.student_manager.model.Classes;
import com.example.student_manager.model.Student;
import com.example.student_manager.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentController", value = "/student")
public class StudentController extends HttpServlet {
    private IStudentService studentService = new StudentService();
    private IClassService classService = new ClassService();
    private IStudentDTOService studentDTOService = new StudentDTOService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "add":
                addForm(req, resp);
                break;
            case "student-dto":
                showListStudentDTO(req,resp);
                break;
            default:
                showList(req,resp);
        }
    }

    private void showListStudentDTO(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("studentDTOList", studentDTOService.findAllStudentDTO());
        try {
            req.getRequestDispatcher("view/student/student-dto.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void addForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setAttribute("classList", classService.findAll());
            req.getRequestDispatcher("view/student/add.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("students", studentService.finAll());
        req.setAttribute("classList", classService.findAll());
        try {
            req.getRequestDispatcher("view/student/list.jsp").forward(req,resp);
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
                addStudent(req,resp);
                break;
            case "delete":
                deleteStudent(req,resp);
                break;
            case "update":
                updateStudent(req,resp);
                break;
        }
    }

    private void updateStudent(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        int classId = Integer.parseInt(req.getParameter("classId"));
        Student student = new Student(id, name, age, classId);
        studentService.update(student);

        try {
            resp.sendRedirect("/student");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteStudent(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        studentService.delete(id);

        try {
            resp.sendRedirect("/student");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void addStudent(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        int classId = Integer.parseInt(req.getParameter("classId"));

        Student student = new Student(name, age, classId);
        studentService.add(student);

        try {
            resp.sendRedirect("/student");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
