package com.dfbz.sys.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.dfbz.sys.Service.impl.MenuServiceImpl;
import com.dfbz.sys.entity.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @ClassName: MenuServlet
 * @Description:
 * @author: zwx
 * @Date: 2019/11/29 22:59
 * @version: V1.0
 */

@WebServlet("/sys/menu")
public class MenuServlet extends HttpServlet {

    private MenuServiceImpl msc = new MenuServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Menu> list = msc.listAll();
        List<Menu> listParent = new ArrayList<>();
        List<Menu> listSon = new ArrayList<>();
        for (Menu menu : list) {
            if ("1".equals(menu.getType())) {
                listParent.add(menu);
            }
            if ("2".equals(menu.getType())) {
                listSon.add(menu);
            }
        }
        HashMap<String, List<Menu>> map = new HashMap<>();
        map.put("parent", listParent);
        map.put("son", listSon);
        String s = JSON.toJSONString(map);
        PrintWriter writer = resp.getWriter();
        writer.append(s);
    }
}
