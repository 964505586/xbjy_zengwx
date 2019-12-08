package com.dfbz.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class EmailUtil {

    public static void sendEmail(String emailName, Integer code) throws GeneralSecurityException, MessagingException {
        String from = "964505586@qq.com"; // 设置发件人
        String host = "smtp.qq.com"; // 设置邮件发送的服务器
        Properties properties = System.getProperties(); // 获取系统属性
        MailSSLSocketFactory mailSSLSocketFactory = new MailSSLSocketFactory(); // SSL加密
        mailSSLSocketFactory.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.ssl.socketFacketFactory", mailSSLSocketFactory);
        properties.setProperty("mail.smtp.host", host); // 设置系统属性
        properties.put("mail.smtp.auth", "true");
        // 获取发送邮件会话、获取第三方登录获取码
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, "dwxlzkejdnecbfed"); // 第三方登录授权码
            }
        });
        Message message = new MimeMessage(session);
        //防止邮件被当成垃圾邮件处理，披上Outlook的马甲
        message.addHeader("X-Mailer", "Microsoft Outlook Express 6.00.2900.2869");
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailName));
        message.setSubject("验证码");  //邮件标题
        BodyPart bodyPart = new MimeBodyPart();
        bodyPart.setText("修改密码验证码：" + String.valueOf(code));    //消息体
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(bodyPart);
        //附件
//            bodyPart = new MimeBodyPart();
//            String fileName = "C:\\Users\\wang\\Desktop\\xbjy.sql";
//            DataSource dataSource = new FileDataSource(fileName);
//            bodyPart.setDataHandler(new DataHandler(dataSource));
//            bodyPart.setFileName("文件显示的名称");
//            multipart.addBodyPart(bodyPart);
        message.setContent(multipart);
        //发送邮件
        Transport.send(message);
//            System.out.println("发送邮件成功！");
    }
}
