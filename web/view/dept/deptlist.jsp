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
<%@ include file="../../comm/home_left.jsp"%>
<div style="border: red 1px solid; float: right; width: 78%; height: 80%;">
    <form action="/sys/dept/list">
        部门名称：<input type="text" value="${deptname}" name="deptname">
        开始时间：<input type="date" name="">
        结束时间：<input type="date" name="">&nbsp;&nbsp;
        <input type="submit" value="查询" class="btn btn-primary">
    </form>
    <a href="/view/dept/deptadd.jsp" class="btn btn-success">添加</a><br><br>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>序号</th>
            <th>部门名称</th>
            <th>创建时间</th>
            <th>创建人</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="dept" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${dept.name}</td>
                <td>${dept.createTime}</td>
                <td>${dept.createBy}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/sys/dept/list?deptname=${deptname}&pageCurrent=1">首页</a>
    <a href="/sys/dept/list?deptname=${deptname}&pageCurrent=${page.pageCurrent == 1 ? 1 : page.pageCurrent-1}">上一页</a>
    当前页码：${page.pageCurrent} 总页数：${page.pageCount}
    <a href="/sys/dept/list?deptname=${deptname}&pageCurrent=${page.pageCurrent>=page.pageCount ? page.pageCount : (page.pageCurrent+1) }">下一页</a>
    <a href="/sys/dept/list?deptname=${deptname}&pageCurrent=page.pageCount">尾页</a>&nbsp;&nbsp;总记录数: ${page.count}
</div>
</body>
</html>
