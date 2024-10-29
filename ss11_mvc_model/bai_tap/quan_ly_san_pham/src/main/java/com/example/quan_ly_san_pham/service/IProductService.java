package com.example.quan_ly_san_pham.service;

import com.example.quan_ly_san_pham.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void saveProduct(Product product);

    void delete(int id);

    Product findId(int id);
}
