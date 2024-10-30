package com.example.quan_li_user.repository;

import com.example.quan_li_user.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> findAll();

    void add(User user);

    void delete(int id);

    void update(User user);

    List<User> searchCountry(String keyword);

    List<User> arrangeName();
}
