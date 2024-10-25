package com.example.hien_thi_danh_sach_khach_hang.repository;

import com.example.hien_thi_danh_sach_khach_hang.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private List<Customer> customers;
    public CustomerRepository() {
        customers = new ArrayList<Customer>();
        customers.add(new Customer(1,"Mai Văn Hoàng", "1983-08-20", "Hà Nội", "/img/hanoi.PNG"));
        customers.add(new Customer(2,"Nguyễn Văn Nam", "1983-08-21", "Bắc Giang","/img/bacgiang.PNG"));
        customers.add(new Customer(3,"Nguyễn Thái Hoà", "1983-08-22", "Nam Định","/img/namdinh.PNG"));
        customers.add(new Customer(4,"Trần Đăng Khoa", "1983-08-17", "Hà Tây","/img/hatay.PNG"));
        customers.add(new Customer(5,"Nguyễn Đình Thi", "1983-08-19", "Hà Nội","/img/hanoi2.PNG"));
    }

    @Override
    public List<Customer> findAll() {
        return customers;
    }
}
