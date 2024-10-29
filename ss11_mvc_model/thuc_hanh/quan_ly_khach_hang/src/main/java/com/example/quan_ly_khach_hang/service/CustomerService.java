package com.example.quan_ly_khach_hang.service;

import com.example.quan_ly_khach_hang.model.Customer;
import com.example.quan_ly_khach_hang.repository.CustomerRepository;
import com.example.quan_ly_khach_hang.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public void save(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public void delete(int id) {
        customerRepository.delete(id);
    }
}
