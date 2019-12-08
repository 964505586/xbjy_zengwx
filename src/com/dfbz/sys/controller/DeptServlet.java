package com.dfbz.sys.controller;

import com.alibaba.fastjson.JSON;
import com.dfbz.sys.Service.impl.DeptServiceImpl;
import com.dfbz.sys.Service.impl.UserServiceImpl;
import com.dfbz.sys.entity.Dept;
import com.dfbz.sys.entity.Page;
import com.dfbz.sys.entity.User;
import com.dfbz.utils.DateUtil;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/sys/dept/*")
public class DeptServlet extends BaseServlet{

    private DeptServiceImpl deptService = new DeptServiceImpl();
    private UserServiceImpl userService = new UserServiceImpl();

    public void listAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Dept> depts = deptService.listAll();
        String s = JSON.toJSONString(depts);
        response.getWriter().append(s);
    }

    public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(123);
        String deptname = request.getParameter("deptname");
        String pagecurrent = request.getParameter("pageCurrent");
        deptname = deptname == null ? "" : deptname;
        Integer pageCurrent = pagecurrent == null ?  1 : Integer.valueOf(pagecurrent);
        Integer count = deptService.getCount(deptname);
        Page page = new Page(count, pageCurrent);
        List<Dept> depts = deptService.list(deptname, page);
        request.setAttribute("page", page);
        request.setAttribute("list", depts);
        request.setAttribute("deptname", deptname);
        request.getRequestDispatcher("/view/dept/deptlist.jsp").forward(request, response);
    }

    public void deleteById(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        // 判断id是否为空
        userService.deleteById(Integer.valueOf(id));
        response.sendRedirect("/sys/user/list");
    }

    public void add(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException {
        Map<String, String[]> parameterMap = request.getParameterMap();
        User user = new User();
        BeanUtils.populate(user, parameterMap);
        user.setCreateTime(DateUtil.getDate());
        userService.add(user);
        response.sendRedirect("/sys/user/list");
    }

    public void toUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String id = request.getParameter("id");
        User userById = userService.getUserById(Integer.valueOf(id));
        request.setAttribute("user", userById);
        request.getRequestDispatcher("/view/user/userupdate.jsp").forward(request, response);
    }

    public void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Map<String, String[]> parameterMap = request.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user, parameterMap);
            userService.update(user);
            response.sendRedirect("/sys/user/list");
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }
}
