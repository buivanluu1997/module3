package com.example.goods_management.model;

public class Product {
    private int id;
    private String code;
    private String name;
    private String unit;
    private double price;
    private String harvestDay;
    private int categoryId;

    public Product() {
    }

    public Product(int id, String code, String name, String unit, double price, String harvestDay, int categoryId) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.unit = unit;
        this.price = price;
        this.harvestDay = harvestDay;
        this.categoryId = categoryId;
    }

    public Product(String code, String name, String unit, double price, String harvestDay, int categoryId) {
        this.code = code;
        this.name = name;
        this.unit = unit;
        this.price = price;
        this.harvestDay = harvestDay;
        this.categoryId = categoryId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getHarvestDay() {
        return harvestDay;
    }

    public void setHarvestDay(String harvestDay) {
        this.harvestDay = harvestDay;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
