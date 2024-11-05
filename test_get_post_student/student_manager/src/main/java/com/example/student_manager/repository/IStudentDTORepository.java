package com.example.student_manager.repository;

import com.example.student_manager.model.StudentDTO;

import java.util.List;

public interface IStudentDTORepository {
    List<StudentDTO> findAllStudentDTO();
}
