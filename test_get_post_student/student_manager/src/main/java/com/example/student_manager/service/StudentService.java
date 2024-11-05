package com.example.student_manager.service;

import com.example.student_manager.model.Student;
import com.example.student_manager.repository.IStudentRepository;
import com.example.student_manager.repository.impl.StudentRepository;

import java.util.List;

public class StudentService implements IStudentService {
    private IStudentRepository studentRepository = new StudentRepository();

    @Override
    public List<Student> finAll() {
        return studentRepository.finAll();
    }

    @Override
    public void add(Student student) {
        studentRepository.add(student);
    }

    @Override
    public void delete(int id) {
        studentRepository.delete(id);
    }

    @Override
    public void update(Student student) {
        studentRepository.update(student);
    }
}
