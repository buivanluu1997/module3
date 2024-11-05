package com.example.student_manager.repository;

import com.example.student_manager.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> finAll();

    void add(Student student);

    void delete(int id);

    void update(Student student);
}
