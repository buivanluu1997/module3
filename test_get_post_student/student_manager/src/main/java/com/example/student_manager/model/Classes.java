package com.example.student_manager.model;

public class Classes {
    private int id;
    private String name;

    public Classes() {
    }

    public Classes(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Classes(String name) {
        this.name = name;
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
}
