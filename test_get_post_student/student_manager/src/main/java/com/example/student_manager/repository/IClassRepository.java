package com.example.student_manager.repository;

import com.example.student_manager.model.Classes;

import java.util.List;

public interface IClassRepository {
    List<Classes> findAll();
}
