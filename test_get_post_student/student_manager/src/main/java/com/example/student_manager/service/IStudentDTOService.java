package com.example.student_manager.service;

import com.example.student_manager.model.StudentDTO;

import java.util.List;

public interface IStudentDTOService {
    List<StudentDTO> findAllStudentDTO();
}
