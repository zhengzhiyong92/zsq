package com.cykj.mapper;

import com.cykj.bean.Admin;
import java.util.List;
import java.util.Map;

public interface AdminMapper {
    void addUser(Admin admin);
    void deleteUserById(Admin admin);
    void updateUser(Admin admin);
    List<Admin> findAll(Admin admin);
    int pagecount();
    List<Admin> tabledisplay(Map map);
}
