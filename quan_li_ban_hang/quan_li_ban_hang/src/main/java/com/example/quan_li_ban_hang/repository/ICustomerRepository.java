package com.example.quan_li_ban_hang.repository;

import com.example.quan_li_ban_hang.model.Customer;
import com.example.quan_li_ban_hang.model.CustomerOrderDTO;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    void addCustomer(Customer customer);

    void deleteCustomer(int id);

    void updateCustomer(Customer customer);

    List<CustomerOrderDTO> findAllCustomerOrders();
}
