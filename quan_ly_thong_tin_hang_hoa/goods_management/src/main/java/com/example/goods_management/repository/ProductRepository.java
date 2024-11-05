package com.example.goods_management.repository;

import com.example.goods_management.model.Category;
import com.example.goods_management.model.Product;
import com.example.goods_management.model.ProductDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String SELECT_ALL_PRODUCT = "select p.id, p.product_code, p.name, p.unit, p.price, c.name as category_name, c.id as category_id, p.harvest_day\n" +
            "from products p\n" +
            "join categories c on p.category_id = c.id;";

    private static final String INSERT_INTO_PRODUCT = "insert into products(product_code,name,unit,price,harvest_day,category_id) values (?,?,?,?,?,?)";
    private static final String SELECT_CATEGORIES = "select c.id, c.name from categories c;";
    private static final String DELETE_PRODUCT = "delete from products where id = ?";
    private static final String UPDATE_PRODUCT = "update products set product_code=?, name=?, unit=?, price=?, harvest_day=?, category_id=? where id=?";
    private static final String SEARCH_PRODUCT = "select p.id, p.product_code, p.name, p.unit, p.price, c.name as category_name, c.id as category_id, p.harvest_day\n" +
            "from products p\n" +
            "join categories c on p.category_id = c.id\n" +
            "where p.name like ?;";
    @Override
    public List<ProductDTO> findAll() {
        List<ProductDTO> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String productCode = resultSet.getString("product_code");
                String name = resultSet.getString("name");
                String unit = resultSet.getString("unit");
                double price = resultSet.getDouble("price");
                String harvestDay = resultSet.getString("harvest_day");
                int categoryId = resultSet.getInt("category_id");
                String categoryName = resultSet.getString("category_name");

                ProductDTO productDTO = new ProductDTO(id, productCode, name, unit, price, harvestDay, categoryId, categoryName);
                list.add(productDTO);
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
        return list;
    }

    @Override
    public void add(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_PRODUCT);
            preparedStatement.setString(1, product.getCode());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setString(3, product.getUnit());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getHarvestDay());
            preparedStatement.setInt(6, product.getCategoryId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void update(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setString(1, product.getCode());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setString(3, product.getUnit());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getHarvestDay());
            preparedStatement.setInt(6, product.getCategoryId());
            preparedStatement.setInt(7, product.getId());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public List<Category> findCategory() {
        List<Category> categories = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORIES);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Category category = new Category(id, name);
                categories.add(category);
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
        return categories;
    }

    @Override
    public List<ProductDTO> searchName(String name) {
        List<ProductDTO> result = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_PRODUCT);
            preparedStatement.setString(1, '%' + name + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String code = resultSet.getString("product_code");
                String productName = resultSet.getString("name");
                String unit = resultSet.getString("unit");
                double price = resultSet.getDouble("price");
                String harvestDay = resultSet.getString("harvest_day");
                int categoryId = resultSet.getInt("category_id");
                String categoryName = resultSet.getString("category_name");

                ProductDTO productDTO = new ProductDTO(id, code, productName, unit, price, harvestDay, categoryId, categoryName);
                result.add(productDTO);
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
        return result;
    }
}
