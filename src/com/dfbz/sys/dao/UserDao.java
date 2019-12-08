package com.dfbz.sys.dao;

import com.dfbz.sys.entity.Page;
import com.dfbz.sys.entity.User;
import com.dfbz.utils.DBUtil;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserDao {

    private static JdbcTemplate jdbcTemplate = new JdbcTemplate(new DBUtil().getDataSource());

    public List<User> listAll(String account, Page page) {
        String sql = "SELECT " +
                "d.NAME deptName," +
                "u.id id," +
                "u.account account," +
                "u.NAME name," +
                "u.age age," +
                "u.sex sex," +
                "u.birth_date birthDate," +
                "u.create_time createTime " +
                "FROM " +
                "sys_user u " +
                "LEFT JOIN sys_dept d ON u.dept_id = d.id " +
                "where u.account like ? limit ?,?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class), "%" + account + "%", (page.getPageCurrent() - 1) * page.getPageSize(), page.getPageSize());
    }

    public Integer getCount (String account) {
        String sql = "select count(*) from sys_user where account like ?";
        return jdbcTemplate.queryForObject(sql, Integer.class, "%" + account + "%");
    }

    public void deleteById (Integer id) {
        String sql = "delete from sys_user where id = ?";
        jdbcTemplate.update(sql, id);
    }

    public void add (User user) {
        String sql = "insert into sys_user(id, dept_id, account, password, name, age, sex, email, birth_date, create_time) values (null,?,?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql,user.getDeptId(), user.getAccount(), user.getPassword(), user.getName(), user.getAge(),
                user.getSex(), user.getEmail(), user.getBirthDate(), user.getCreateTime());
    }

    public User getUserById (Integer id) {
        String sql = "select * from sys_user where id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), id);
    }

    public void update (User user) {
        String sql = "update sys_user set dept_id=?, account=?, name=?, age=?, sex=?, email=?, birth_date=? where id = ?";
        jdbcTemplate.update(sql, user.getDeptId(), user.getAccount(), user.getName(), user.getAge(), user.getSex(), user.getEmail(), user.getBirthDate(), user.getId());
    }

    public List<User> checkLogin(User user) {
        System.out.println(123);
        String sql = "select * from sys_user where account= ? and password = ? ";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class), user.getAccount(), user.getPassword());
    }
}
