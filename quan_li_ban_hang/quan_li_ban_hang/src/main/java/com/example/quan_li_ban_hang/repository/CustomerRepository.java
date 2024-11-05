package com.example.quan_li_ban_hang.repository;

import com.example.quan_li_ban_hang.model.Customer;
import com.example.quan_li_ban_hang.model.CustomerOrderDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL_CUSTOMER = "SELECT * FROM khach_hang";
    private static final String INSERT_CUSTOMER = "insert into khach_hang(ten_khach_hang,tuoi_khach_hang) values (?,?)";
    private static final String DELETE_CUSTOMER = "delete from khach_hang where khach_hang_id = ?";
    private static final String UPDATE_CUSTOMER = "update khach_hang set ten_khach_hang = ?, tuoi_khach_hang = ? where khach_hang_id = ?";
    private static final String SELECT_ALL_CUSTOMER_ODER = "select kh.*, dh.ngay_mua_hang\n" +
            "from khach_hang kh\n" +
            "join don_hang dh on kh.khach_hang_id = dh.khach_hang_id;";
    @Override
    public List<Customer> findAll() {
        List<Customer> khachHangList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("khach_hang_id");
                String name = resultSet.getString("ten_khach_hang");
                int age = resultSet.getInt("tuoi_khach_hang");

                Customer khachHang = new Customer(id, name, age);
                khachHangList.add(khachHang);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return khachHangList;
    }

    @Override
    public void addCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setInt(2, customer.getAge());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void deleteCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setInt(2, customer.getAge());
            preparedStatement.setInt(3, customer.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<CustomerOrderDTO> findAllCustomerOrders() {
        List<CustomerOrderDTO> customerOrderDTOList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_ODER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("khach_hang_id");
                String name = resultSet.getString("ten_khach_hang");
                int age = resultSet.getInt("tuoi_khach_hang");
                String date = resultSet.getString("dh.ngay_mua_hang");
                customerOrderDTOList.add(new CustomerOrderDTO(id, name, age, date));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return customerOrderDTOList;
    }
}
