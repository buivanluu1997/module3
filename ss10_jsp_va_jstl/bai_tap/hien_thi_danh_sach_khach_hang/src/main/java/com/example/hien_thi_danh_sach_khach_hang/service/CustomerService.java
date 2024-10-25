package com.example.hien_thi_danh_sach_khach_hang.service;

import com.example.hien_thi_danh_sach_khach_hang.model.Customer;
import com.example.hien_thi_danh_sach_khach_hang.repository.CustomerRepository;
import com.example.hien_thi_danh_sach_khach_hang.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }
}
