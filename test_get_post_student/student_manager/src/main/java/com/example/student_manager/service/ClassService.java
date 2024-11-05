package com.example.student_manager.service;

import com.example.student_manager.model.Classes;
import com.example.student_manager.repository.impl.ClassRepository;
import com.example.student_manager.repository.IClassRepository;

import java.util.List;

public class ClassService implements IClassService{
    private IClassRepository classRepository = new ClassRepository();

    @Override
    public List<Classes> findAll() {
        return classRepository.findAll();
    }
}
