<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/30
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="../../comm/head.jsp"%>
<div>
    <%@ include file="../../comm/home_left.jsp"%>
    <div style="border: red 1px solid; float: right; width: 78%; height: 80%;">
        <form action="/sys/user/list">
            账号：<input type="text" value="${account}" name="account">
            开始时间：<input type="date" name="">
            结束时间：<input type="date" name="">&nbsp;&nbsp;
            <input type="submit" value="查询" class="btn btn-primary">
        </form>
        <a href="/view/user/useradd.jsp" class="btn btn-success">添加</a><br><br>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>部门名称</th>
                    <th>账号</th>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>性别</th>
                    <th>出生日期</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="user" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${user.deptId}</td>
                        <td>${user.account}</td>
                        <td>${user.name}</td>
                        <td>${user.age}</td>
                        <td>
                            <c:choose>
                                <c:when test="${user.sex == 0}">男</c:when>
                                <c:when test="${user.sex == 1}">女</c:when>
                                <c:otherwise>其他</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <fmt:parseDate var="birthDate" value="${user.birthDate}" pattern="yyyy-MM-dd"></fmt:parseDate>
                            <fmt:formatDate value="${birthDate}" pattern="yyyy年MM月dd日"></fmt:formatDate>
                        </td>
                        <td>
                            <fmt:parseDate var="createTime" value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
                            <fmt:formatDate value="${createTime}" pattern="yyyy年MM月dd日 HH时mm分ss秒"></fmt:formatDate>
                        </td>
                        <td>
                            <a href="/sys/user/toUpdate?id=${user.id}" class="">修改</a>
                            <a href="/sys/user/deleteById?id=${user.id}" class="">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/sys/user/list?account=${account}&pageCurrent=1">首页</a>
        <a href="/sys/user/list?account=${account}&pageCurrent=${page.pageCurrent == 1 ? 1 : page.pageCurrent-1}">上一页</a>
        当前页码：${page.pageCurrent} 总页数：${page.pageCount}
        <a href="/sys/user/list?account=${account}&pageCurrent=${page.pageCurrent>=page.pageCount ? page.pageCount : (page.pageCurrent+1) }">下一页</a>
        <a href="/sys/user/list?account=${account}&pageCurrent=page.pageCount">尾页</a>&nbsp;&nbsp;总记录数: ${page.count}
    </div>
</div>
</body>
</html>
