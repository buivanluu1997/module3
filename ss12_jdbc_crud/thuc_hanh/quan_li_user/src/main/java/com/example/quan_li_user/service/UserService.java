package com.example.quan_li_user.service;

import com.example.quan_li_user.model.User;
import com.example.quan_li_user.repository.IUserRepository;
import com.example.quan_li_user.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public void add(User user) {
        userRepository.add(user);
    }

    @Override
    public void delete(int id) {
        userRepository.delete(id);
    }

    @Override
    public void update(User user) {
        userRepository.update(user);
    }

    @Override
    public List<User> searchCountry(String keyword) {
        return userRepository.searchCountry(keyword);
    }

    @Override
    public List<User> arrangeName() {
        return userRepository.arrangeName();
    }
}
