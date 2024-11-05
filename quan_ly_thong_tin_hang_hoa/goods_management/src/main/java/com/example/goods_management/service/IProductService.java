package com.example.goods_management.service;

import com.example.goods_management.model.Category;
import com.example.goods_management.model.Product;
import com.example.goods_management.model.ProductDTO;

import java.util.List;

public interface IProductService {
    List<ProductDTO> findAll();

    List<Category> findCategory();

    void add(Product product);

    void delete(int id);

    void update(Product product);

    List<ProductDTO> searchName(String name);
}
