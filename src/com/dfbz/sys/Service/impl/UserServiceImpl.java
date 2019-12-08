package com.dfbz.sys.Service.impl;

import com.dfbz.sys.Service.UserService;
import com.dfbz.sys.dao.UserDao;
import com.dfbz.sys.entity.Page;
import com.dfbz.sys.entity.User;

import java.util.List;

// 查询菜单
public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDao();

    // 查询所有菜单
    @Override
    public List<User> list(String account, Page page) {
        return userDao.listAll(account, page);
    }

    public Integer getCount(String account) {
        return userDao.getCount(account);
    }

    public void deleteById(Integer id) {
        userDao.deleteById(id);
    }

    public void add(User user) {
        userDao.add(user);
    }

    public User getUserById(Integer id) {
        return userDao.getUserById(id);
    }

    public void update (User user) {
        userDao.update(user);
    }

    public List<User> checkLogin(User user) {
        return userDao.checkLogin(user);
    }
}
