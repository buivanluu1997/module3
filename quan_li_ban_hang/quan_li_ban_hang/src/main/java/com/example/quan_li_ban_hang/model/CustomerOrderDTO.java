package com.example.quan_li_ban_hang.model;

public class CustomerOrderDTO {
    private int id;
    private String name;
    private int age;
    private String date;

    public CustomerOrderDTO() {
    }

    public CustomerOrderDTO(int id, String name, int age, String date) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
