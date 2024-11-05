package com.example.student_manager.service;

import com.example.student_manager.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> finAll();

    void add(Student student);

    void delete(int id);

    void update(Student student);
}
