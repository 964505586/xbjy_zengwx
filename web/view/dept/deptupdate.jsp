<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/3
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${path}/static/jquery-validation-1.9.0/jquery.validate.js"></script>
</head>
<body>
<%@ include file="../../comm/head.jsp"%>
<div>
    <%@ include file="../../comm/home_left.jsp"%>
    <div style="border: red 1px solid; float: right; width: 78%; height: 80%;">
        <form action="/sys/user/update" id="form-add">
            <input type="text" name="id" value="${user.id}" style="display: none">
            <div>
                <label>部门</label>
                <select name="deptId" id="dept"></select>
            </div>
            <div>
                <label>账号</label>
                <input type="text" value="${user.account}" name="account" id="account" placeholder="请输入账号">
            </div>
            <div>
                <label>姓名</label>
                <input type="text" value="${user.name}" name="name" id="name" required>  <%-- required: 必填项 --%>
            </div>
            <div>
                <label>年龄</label>
                <input type="text" name="age" id="age" value="${user.age}">
            </div>
            <div class="form-group">
                <label>性别</label>
                <input type="radio" id="male" name="sex" value="0" <c:if test="${user.sex==0}">checked</c:if>>
                    <label for="male">男</label>
                <input type="radio" id="female" name="sex" value="1" <c:if test="${user.sex==1}">checked</c:if>>
                    <label for="female">女</label>
            </div>
            <div>
                <label>邮箱</label>
                <input type="text" name="email" id="email" value="${user.email}" required>
            </div>
            <div>
                <label>出生日期</label>
                <input type="date" id="birthDate" name="birthDate" value="${user.birthDate}">
            </div>
            <div>
                <button type="submit">保存</button>
                <button type="reset">重置</button>
                <a href="/sys/user/list">返回</a>
            </div>
        </form>
    </div>
</div>
<option value=""></option>
<script>
    $(function () {
        var deptId = ${user.deptId}
        $.ajax({
            url: "/sys/dept/listAll",
            data: "",
            dataType: "json",
            success:function (data) {
                var html = "";
                for (var i = 0; i < data.length; i++) {
                    if (data[i].id == deptId) {
                        html = html + '<option selected value="' + data[i].id + '">' + data[i].name + '</option>';
                        continue;
                    }
                    html = html + '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                }
                $("#dept").append(html);
            }
        });
        // 表单验证
        $.validator.addMethod("checkAccount", function (value, element, params) {
            var reg = /^[0-9a-zA-Z]{5,10}$/;
            if (reg.test(value)) {
                return true;
            } else {
                return false;
            }
        });
        $("#form-add").validate({
            rules: {    /* rules：规则 */
                account: {  /* account：验证字段名 name值 */
                    checkAccount: ""    /* checkAccount：验证方法 */
                }
            },
            messages: {     /* messages：提示 */
                account: {
                    checkAccount: "请输入5-10位的账号!"
                }
            }
        })
    })
</script>
</body>
</html>
