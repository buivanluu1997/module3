package com.example.quan_ly_san_pham.repository;

import com.example.quan_ly_san_pham.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private List<Product> products;
    public ProductRepository() {
        products = new ArrayList<Product>();
        products.add(new Product(2, "IPhone 15 promax", 1500, 15));
        products.add(new Product(3, "SamSung Galaxy 21", 1200, 9));
        products.add(new Product(1, "Nokia Lumia 552", 800, 5));
        products.add(new Product(5, "IPhone 16 promax", 2000, 11));
        products.add(new Product(7, "Xiaomi", 1000, 7));
    }


    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void saveProduct(Product product) {
        products.add(product);
    }

    @Override
    public void delete(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                products.remove(product);
                break;
            }
        }
    }

    @Override
    public Product findId(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }
}
