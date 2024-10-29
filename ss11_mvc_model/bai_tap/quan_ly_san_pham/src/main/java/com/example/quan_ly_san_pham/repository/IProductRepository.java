package com.example.quan_ly_san_pham.repository;

import com.example.quan_ly_san_pham.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void saveProduct(Product product);

    void delete(int id);

    Product findId(int id);
}
