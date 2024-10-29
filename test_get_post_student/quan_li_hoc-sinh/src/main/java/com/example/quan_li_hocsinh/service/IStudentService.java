package com.example.student.service;

import com.example.student.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();

    void addStudent(Student student);
}
