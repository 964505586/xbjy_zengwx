package com.dfbz.sys.controller;

import com.alibaba.fastjson.JSON;
import com.dfbz.sys.Service.impl.UserServiceImpl;
import com.dfbz.sys.entity.User;
import com.dfbz.utils.ImgCodeUtil;
import com.dfbz.utils.MDUtil;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * @author admin
 * @version 1.0.1
 * @company 东方标准
 * @date 2019/12/4 11:06
 * @description
 */
@WebServlet("/sys/login/*")
public class LoginServlet extends BaseServlet {

    private UserServiceImpl service = new UserServiceImpl();

    /***
     * @decription 验证账号和密码
     * @author admin
     * @date 2019/12/4 14:48
     * @params [user]
     * @return com.dfbz.sys.entity.User
     */
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String picCode = request.getParameter("picCode");
        String remember = request.getParameter("remember");
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("code");
//        if (obj == null || !obj.toString().equalsIgnoreCase(picCode)) {
//            //验证码不正确
//            response.sendRedirect("/index.jsp");
//            return;
//        }

        User user = new User();
        user.setAccount(account);
        user.setPassword(MDUtil.md5(password)); // 密文
        List<User> list = service.checkLogin(user);
        //账号或密码不正确或系统存在相同的账号和密码
        if (list == null || list.size() == 0 || list.size() > 1) {
            //登录失败，跳转到登录界面
            response.sendRedirect("/index.jsp");
            return;
        } else {
            //验证通过
            //  在线人数
            ServletContext servletContext = getServletContext();    // 获得上下文对象
            Object o = servletContext.getAttribute("count");    // 取出上下文中的在线人数
            Object u = session.getAttribute("user"); // 获得session的账户信息
            int count = 1;
            if (o != null ) {
                if (u == null) {
                    count = Integer.valueOf(o.toString()) + 1;
                } else {
                    count = Integer.valueOf(o.toString());
                }
            }
            servletContext.setAttribute("count", count);
            session.setAttribute("user", list.get(0));  // 将账户信息存入session

            //如果勾选7天免登录，则把登陆信息放入cookie，cookie中不能直接存对象，所以只能存入字符串
            if ("1".equals(remember)) {
                //cookie中的密码存入明文密码 方便填入密码框
                list.get(0).setPassword(password);
                //cookie中不能直接存对象及特殊字符（" , :）
                String s = JSON.toJSONString(list.get(0));
                String encode = URLEncoder.encode(s, "utf-8");
                Cookie cookie = new Cookie("user", encode);
                cookie.setMaxAge(7 * 24 * 60 * 60);     // 7天有效期  单位: 秒
                cookie.setPath("/");    // 任何请求都能获取cookie
                response.addCookie(cookie);
            }

            request.getRequestDispatcher("/comm/home.jsp").forward(request, response);
            return;
        }
    }

    /***
     * @decription 获取图片验证码
     * @author admin
     * @date 2019/12/4 16:51
     * @params [request, response]
     * @return void
     */
    public void getPic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ImgCodeUtil imgCodeUtil = new ImgCodeUtil();
        //获取验证码图片
        BufferedImage image = imgCodeUtil.getImage();

        ////获取验证码文本内容
        String code = imgCodeUtil.getText();

        //把图片验证码存入session
        HttpSession session = request.getSession();
        session.setAttribute("code", code);
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        // 将图像输出到Servlet输出流中。
        ServletOutputStream sos = response.getOutputStream();
        ImageIO.write(image, "jpeg", sos);
        sos.flush();  // 刷新
        sos.close();
    }
}
