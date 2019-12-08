package com.dfbz.sys.Service;

import com.dfbz.sys.entity.Page;
import com.dfbz.sys.entity.User;
import java.util.List;

public interface UserService {

    List<User> list(String account, Page page);

    Integer getCount(String account);

    void deleteById(Integer id);

    void add(User user);
    User getUserById(Integer id);
    void update(User user);
    List<User> checkLogin(User user);
}
