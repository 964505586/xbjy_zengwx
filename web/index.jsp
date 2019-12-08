<%@ page import="com.dfbz.sys.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: DFG
  Date: 2019/11/29
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <%
      HttpSession sess = request.getSession();
      Object obj = sess.getAttribute("user");
      User user;
      String account = null;
      String password = null;
      if (obj != null) {
          user = (User) obj;
          account = user.getAccount();
          password = user.getPassword();
      }
  %>
  <form action="/sys/login/login">
    账号：<input type="text" name="account" value="<%=account==null?"":account%>"><br><br>
    密码：<input type="password" name="password" value="<%=password==null?"":password%>"><br><br>
    <img src="/sys/login/getPic" alt="无法加载" id="img" onclick="getPic()">
    验证码：<input type="text" name="picCode" value="" ><br><br>
    七天内免登录：<input type="checkbox" value="1" name="remember"><br><br>
    <input type="submit" value="提交">
  </form>
  <a href="/view/user/forget.jsp">忘记密码!</a>
  </body>
  <script>
      function getPic() {
          $("#img").attr("src", $("#img").attr("src") + "?nocache="+new Date().getTime());
          // document.getElementById("img").src = document.getElementById("img").src + "?nocache=" + new Date().getTime();
      }
  </script>
</html>
