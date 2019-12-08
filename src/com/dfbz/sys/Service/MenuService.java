package com.dfbz.sys.Service;

import com.dfbz.sys.dao.MenuDao;
import com.dfbz.sys.entity.Menu;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import java.util.List;

public interface MenuService {

    List<Menu> listAll();
}
