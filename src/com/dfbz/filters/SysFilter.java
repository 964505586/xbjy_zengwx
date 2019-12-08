package com.dfbz.filters;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.dfbz.sys.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLDecoder;

@WebFilter("/*")
public class SysFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        HttpSession session = req.getSession();
        Object user = session.getAttribute("user");
        String requestURI = req.getRequestURI();
        if (requestURI.endsWith("index.jsp")) {
            Cookie[] cookies = req.getCookies();
            for (int i = 0; i < cookies.length; i++) {
                if ("user".equals(cookies[i].getName())) {
                    String value = cookies[i].getValue();
                    String decode = URLDecoder.decode(value, "utf-8");
                    User user1 = JSON.parseObject(decode, new TypeReference<User>() {});
                    session.setAttribute("user", user1);
//                    resp.sendRedirect("/comm/home.jsp");
                }
            }

        }else if (requestURI.endsWith("/sys/login/login") || requestURI.endsWith("/sys/login/getPic") || requestURI.endsWith("/view/user/forget.jsp") || requestURI.endsWith("/sys/email/send")) {
        } else if (user == null) {  // 非法登录
            resp.sendRedirect("/index.jsp");
            return;
        }

        filterChain.doFilter(servletRequest, servletResponse);
    }
}
