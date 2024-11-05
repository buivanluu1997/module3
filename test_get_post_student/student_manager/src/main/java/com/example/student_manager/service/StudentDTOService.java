package com.example.student_manager.service;

import com.example.student_manager.model.StudentDTO;
import com.example.student_manager.repository.IStudentDTORepository;
import com.example.student_manager.repository.impl.StudentDTORepository;

import java.util.List;

public class StudentDTOService implements IStudentDTOService {
    private IStudentDTORepository studentDTORepository = new StudentDTORepository();
    @Override
    public List<StudentDTO> findAllStudentDTO() {
        return studentDTORepository.findAllStudentDTO();
    }
}
