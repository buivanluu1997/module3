package com.example.hien_thi_danh_sach_khach_hang.service;

import com.example.hien_thi_danh_sach_khach_hang.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
}
