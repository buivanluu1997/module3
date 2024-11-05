package com.example.quan_li_ban_hang.service;

import com.example.quan_li_ban_hang.model.Customer;
import com.example.quan_li_ban_hang.model.CustomerOrderDTO;
import com.example.quan_li_ban_hang.repository.ICustomerRepository;
import com.example.quan_li_ban_hang.repository.CustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public void addCustomer(Customer customer) {
        customerRepository.addCustomer(customer);
    }

    @Override
    public void deleteCustomer(int id) {
        customerRepository.deleteCustomer(id);
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerRepository.updateCustomer(customer);
    }

    @Override
    public List<CustomerOrderDTO> findAllCustomerOrders() {
        return customerRepository.findAllCustomerOrders();
    }
}
