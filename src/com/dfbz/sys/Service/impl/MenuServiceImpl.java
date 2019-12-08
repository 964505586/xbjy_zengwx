package com.dfbz.sys.Service.impl;

import com.dfbz.sys.Service.MenuService;
import com.dfbz.sys.dao.MenuDao;
import com.dfbz.sys.entity.Menu;
import java.util.List;

// 查询菜单
public class MenuServiceImpl implements MenuService {

    private MenuDao menuDao = new MenuDao();

    // 查询所有菜单
    @Override
    public List<Menu> listAll() {
        return menuDao.listAll();
    }
}
