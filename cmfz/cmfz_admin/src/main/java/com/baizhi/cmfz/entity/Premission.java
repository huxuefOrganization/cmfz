package com.baizhi.cmfz.entity;

public class Premission {

    private String id;
    private String name;

    public Premission(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public Premission() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
