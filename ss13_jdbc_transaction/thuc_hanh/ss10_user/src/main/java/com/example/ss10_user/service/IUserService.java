package com.example.ss10_user.service;

import com.example.ss10_user.model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();

    User findById(int id);

    void add(User user);
    void deleteById(int id);

    void update(User user);

    void transaction();
}
