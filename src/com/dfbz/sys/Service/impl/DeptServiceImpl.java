package com.dfbz.sys.Service.impl;

import com.dfbz.sys.Service.DeptService;
import com.dfbz.sys.dao.DeptDao;
import com.dfbz.sys.dao.UserDao;
import com.dfbz.sys.entity.Dept;
import com.dfbz.sys.entity.Page;
import com.dfbz.sys.entity.User;
import com.dfbz.utils.DateUtil;

import java.util.List;

public class DeptServiceImpl implements DeptService {

    private DeptDao deptDao = new DeptDao();

    public List<Dept> list(String deptname, Page page) {
        return deptDao.list(deptname, page);
    }

    @Override
    public List<Dept> listAll() {
        return deptDao.listAll();
    }

    @Override
//    public List<User> listAll(String account, Page page) {
//        return deptDao.listAll(account, page);
//    }

    public Integer getCount(String account) {
        return deptDao.getCount(account);
    }

    public void deleteById(Integer id) {
        deptDao.deleteById(id);
    }

    @Override
    public void add(Dept dept) {

    }

    public void add(User user) {
        deptDao.add(user);
    }

    public User getUserById(Integer id) {
        return deptDao.getUserById(id);
    }

    @Override
    public void update(Dept dept) {

    }

    @Override
    public List<Dept> checkLogin(Dept dept) {
        return null;
    }

    public void update (User user) {
        deptDao.update(user);
    }

    public List<User> checkLogin(User user) {
        return deptDao.checkLogin(user);
    }
}
