package com.example.ss10_user.service;

import com.example.ss10_user.model.User;
import com.example.ss10_user.repository.IUserRepository;
import com.example.ss10_user.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public void add(User user) {
        userRepository.add(user);
    }

    @Override
    public void deleteById(int id) {
        userRepository.deleteById(id);
    }

    @Override
    public void update(User user) {
        userRepository.update(user);
    }

    @Override
    public void transaction() {
        userRepository.transaction();
    }
}
