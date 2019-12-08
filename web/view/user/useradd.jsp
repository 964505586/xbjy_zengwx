<%--
  Created by IntelliJ IDEA.
  User: DFG
  Date: 2019/12/2
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <form action="/sys/user/add" method="get" id="form-id">
        <div class="form-group">
            <label>部门：</label>
            <select name="deptId" id="deptId"></select>
        </div>
        <div class="form-group">
            <label>账号：</label>
            <input type="text" value="" name="account" id="account">
        </div>
        <div class="form-group">
            <label>姓名：</label>
            <input type="text" value="" name="name" id="name">
        </div>
        <div class="form-group">
            <label>年龄：</label>
            <input type="text" value="" name="age" id="age">
        </div>
        <div class="form-group">
            <label>性别：</label>
            <input type="radio" value="" name="sex" id="male" checked><label for="male">男</label>
            <input type="radio" value="" name="sex" id="female"><label for="female">女</label>
        </div>
        <div class="form-group">
            <label>邮箱：</label>
            <input type="redio" value="" name="email" id="email">
        </div>
        <div class="form-group">
            <label>出生日期：</label>
            <input type="redio" value="" name="birthDate" id="birthDate">
        </div>
        <div class="text-center">  <%--  居中  --%>
            <button type="submit" class="btn btn-primary">保存</button>
            <button type="reset" class="btn btn-default">重置</button>
            <a href="/sys/user/list"  class="btn btn-danger">返回</a>
        </div>
    </form>
</div>
</body>
</html>
