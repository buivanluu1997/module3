package com.example.goods_management.repository;

import com.example.goods_management.model.Category;
import com.example.goods_management.model.Product;
import com.example.goods_management.model.ProductDTO;

import java.util.List;

public interface IProductRepository {
    List<ProductDTO> findAll();

    void add(Product product);

    void delete(int id);

    void update(Product product);

    List<Category> findCategory();

    List<ProductDTO> searchName(String name);
}
