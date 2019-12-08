package com.dfbz.sys.dao;

import com.dfbz.sys.entity.Dept;
import com.dfbz.sys.entity.Page;
import com.dfbz.sys.entity.User;
import com.dfbz.utils.DBUtil;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class DeptDao {

    private static JdbcTemplate jdbcTemplate = new JdbcTemplate(new DBUtil().getDataSource());

    public List<Dept> list(String deptname, Page page) {
        String sql = "select d.id id, d.name name, d.create_time createTime, d.create_by createBy, d.del_flag delFlag from sys_dept d where d.name like ? limit ?, ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Dept.class), "%" + deptname + "%", (page.getPageCurrent() - 1) * page.getPageSize(), page.getPageSize());
    }

    public List<Dept> listAll() {
        String sql = "select * from sys_dept";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Dept.class));
    }

    public Integer getCount (String deptname) {
        String sql = "select count(*) from sys_dept d where d.name like ?";
        return jdbcTemplate.queryForObject(sql, Integer.class, "%" + deptname + "%");
    }

    public void deleteById (Integer id) {
        String sql = "delete from sys_dept where id = ?";
        jdbcTemplate.update(sql, id);
    }

    public void add (User user) {
        String sql = "insert into sys_dept(id, dept_id, account, password, name, age, sex, email, birth_date, create_time) values (null,?,?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql,user.getDeptId(), user.getAccount(), user.getPassword(), user.getName(), user.getAge(),
                user.getSex(), user.getEmail(), user.getBirthDate(), user.getCreateTime());
    }

    public User getUserById (Integer id) {
        String sql = "select * from sys_dept where id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), id);
    }

    public void update (User user) {
        String sql = "update sys_dept set dept_id=?, account=?, name=?, age=?, sex=?, email=?, birth_date=? where id = ?";
        jdbcTemplate.update(sql, user.getDeptId(), user.getAccount(), user.getName(), user.getAge(), user.getSex(), user.getEmail(), user.getBirthDate(), user.getId());
    }

    public List<User> checkLogin(User user) {
        System.out.println(123);
        String sql = "select * from sys_dept where account= ? and password = ? ";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class), user.getAccount(), user.getPassword());
    }
}
