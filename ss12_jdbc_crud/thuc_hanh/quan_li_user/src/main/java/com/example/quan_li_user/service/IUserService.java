package com.example.quan_li_user.service;

import com.example.quan_li_user.model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();

    void add(User user);

    void delete(int id);

    void update(User user);

    List<User> searchCountry(String keyword);

    List<User> arrangeName();
}
