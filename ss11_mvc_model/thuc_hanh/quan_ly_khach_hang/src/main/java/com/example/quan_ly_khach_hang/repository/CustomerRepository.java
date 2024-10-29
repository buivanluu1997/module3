package com.example.quan_ly_khach_hang.repository;

import com.example.quan_ly_khach_hang.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private List<Customer> customers;
    public CustomerRepository() {
        customers = new ArrayList<Customer>();
        customers.add(new Customer(1, "Hoang Huy", "huy@gmail.com", "Da Nang" ));
        customers.add(new Customer(2, "Quoc Hung", "hung23@gmail.com", "Hue" ));
        customers.add(new Customer(3, "Van Quoc", "quoc999@gmail.com", "Nha Trang" ));
        customers.add(new Customer(4, "Tuan Trung", "trung123@gmail.com", "Ha Noi" ));
        customers.add(new Customer(5, "Hai Hau", "hau@gmail.com", "Da Lat" ));
    }


    @Override
    public List<Customer> findAll() {
        return customers;
    }

    @Override
    public void save(Customer customer) {
        customers.add(customer);
    }


    @Override
    public void delete(int id) {
        for (Customer customer : customers) {
            if (customer.getId() == id) {
                customers.remove(customer);
                break;
            }
        }
    }
}
