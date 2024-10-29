package com.example.student.controller;

import com.example.student.service.IStudentService;
import com.example.student.service.StudentService;

import javax.servlet.annotation.WebServlet;

@WebServlet(name = "StudentController", value = "student")
public class StudentController {
    private IStudentService studentService = new StudentService();

}
