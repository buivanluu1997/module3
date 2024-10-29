package com.example.student.repository;

import com.example.student.model.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private List<Student> students;
    public StudentRepository() {
        students = new ArrayList<Student>();
        students.add(new Student(1, "Nguyen Thi Hanh", 17, "12A1"));
        students.add(new Student(2, "Hoang Trung Kien", 17, "12A3"));
        students.add(new Student(3, "Ho Ngoc Khoa", 17, "12A2"));
        students.add(new Student(4, "Tran Hanh Nhi", 16, "11A1"));
    }


    @Override
    public List<Student> findAll() {
        return students;
    }

    @Override
    public void addStudent(Student student) {
        students.add(student);
    }
}
