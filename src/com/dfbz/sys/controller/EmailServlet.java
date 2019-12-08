package com.dfbz.sys.controller;

import com.dfbz.utils.EmailUtil;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.GeneralSecurityException;

@WebServlet("/sys/email/*")
public class EmailServlet extends BaseServlet {

    public void send(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        double random = Math.random();
        try {
            EmailUtil.sendEmail(email, (int) ((random + 1) * 1000));
            resp.getWriter().append("发送邮件成功");
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
