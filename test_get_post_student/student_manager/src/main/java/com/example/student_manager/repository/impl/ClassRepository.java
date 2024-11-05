package com.example.student_manager.repository.impl;

import com.example.student_manager.model.Classes;
import com.example.student_manager.repository.BaseRepository;
import com.example.student_manager.repository.IClassRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassRepository implements IClassRepository {
    private static final String SELECT_ALL_CLASS = "select * from class";
    @Override
    public List<Classes> findAll() {
        List<Classes> classesList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CLASS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");

                Classes classes = new Classes(id, name);
                classesList.add(classes);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return classesList;
    }
}
