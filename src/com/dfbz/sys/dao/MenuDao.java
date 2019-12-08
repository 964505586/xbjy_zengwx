package com.dfbz.sys.dao;

import com.dfbz.sys.entity.Menu;
import com.dfbz.utils.DBUtil;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class MenuDao {

    private static JdbcTemplate jdbcTemplate = new JdbcTemplate(new DBUtil().getDataSource());

    public List<Menu> listAll() {
       String sql = "select * from sys_menu order by order_by";
       return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Menu.class));
    }
}
