package com.example.student.repository;

import com.example.student.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();

    void addStudent(Student student);
}
