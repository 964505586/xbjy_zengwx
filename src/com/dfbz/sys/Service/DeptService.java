package com.dfbz.sys.Service;

import com.dfbz.sys.entity.Dept;
import com.dfbz.sys.entity.Page;
import com.dfbz.sys.entity.User;

import java.util.List;

public interface DeptService {

    List<Dept> list(String deptname, Page page);
    List<Dept> listAll();
    Integer getCount(String account);
    void deleteById(Integer id);
    void add(Dept dept);
    User getUserById(Integer dept);
    void update(Dept dept);
    List<Dept> checkLogin(Dept dept);
}
