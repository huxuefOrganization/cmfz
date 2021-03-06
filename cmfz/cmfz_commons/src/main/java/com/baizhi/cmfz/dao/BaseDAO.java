package com.baizhi.cmfz.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDAO<T> {

    void insert(T t);

    void delete(String id);

    void update(T t);

    T findById(String id);

    T findByPhone(String phone);

    T findByName(String name);

    List<T> findAll();

    List<T> findBySplit(@Param("start") Integer start , @Param("rows") Integer rows);

    Long findTotle();
}
