package com.example.student_manager.repository.impl;

import com.example.student_manager.model.StudentDTO;
import com.example.student_manager.repository.BaseRepository;
import com.example.student_manager.repository.IStudentDTORepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDTORepository implements IStudentDTORepository {
    private static final String SELECT_STUDENT_CLASS = "select s.id, s.name, s.age, c.name as class_name " +
            "from student s " +
            "join class c on s.class_id = c.id;";

    @Override
    public List<StudentDTO> findAllStudentDTO() {
        List<StudentDTO> studentDTOList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_CLASS);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int studentId = resultSet.getInt("id");
                String StudentName = resultSet.getString("name");
                int age = resultSet.getInt("age");
                String className = resultSet.getString("class_name");

                StudentDTO studentDTO = new StudentDTO(studentId, StudentName, age, className);
                studentDTOList.add(studentDTO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return studentDTOList;
    }
}
