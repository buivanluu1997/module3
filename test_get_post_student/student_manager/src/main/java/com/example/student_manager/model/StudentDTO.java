package com.example.student_manager.model;

public class StudentDTO {
    private int studentId;
    private String studentName;
    private int studentAge;
    private String className;

    public StudentDTO() {
    }

    public StudentDTO(int studentId, String studentName, int studentAge, String className) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentAge = studentAge;
        this.className = className;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getStudentAge() {
        return studentAge;
    }

    public void setStudentAge(int studentAge) {
        this.studentAge = studentAge;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}
