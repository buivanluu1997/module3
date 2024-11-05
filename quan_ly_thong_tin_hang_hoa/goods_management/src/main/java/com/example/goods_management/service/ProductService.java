package com.example.goods_management.service;

import com.example.goods_management.model.Category;
import com.example.goods_management.model.Product;
import com.example.goods_management.model.ProductDTO;
import com.example.goods_management.repository.IProductRepository;
import com.example.goods_management.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<ProductDTO> findAll() {
        return productRepository.findAll();
    }

    @Override
    public List<Category> findCategory() {
        return productRepository.findCategory();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public void update(Product product) {
        productRepository.update(product);
    }

    @Override
    public List<ProductDTO> searchName(String name) {
        return productRepository.searchName(name);
    }
}
