<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码!</title>
</head>
<body>
<form action="">
    账号：<input type="text" name="account" id="account" placeholder="请输入需要修改的账号!"><br><br>
    密码：<input type="password" name="password" id="password" placeholder="请输修改后入密码!"><br><br>
    邮箱：<input type="text" name="email" id="email" placeholder="请输入邮箱地址!">
    <input type="button" id="btn-send" value="获取验证码!"><span id="time"></span><br><br>
    验证码：<input type="text" name="code" placeholder="请输入收到的验证码!"><br><br>
    <input type="submit" value="修改">
</form>
</body>
<script>
    var time;
    var dsq;
    $(function () {

        $("#btn-send").click(function () {
            time = 60;
            dsq = window.setInterval("changeTime()", 1000);
            $("#btn-send").attr("disabled", "disabled");
            var email = $("#email").val()
            $.ajax({
                url: "/sys/email/send",
                data: {email: email},
                dataType: "text",
                success: function (data) {
                    alert(data)
                }
            })
        });
    });

    function changeTime() {
        time--;
        $("#time").text(time);
        if (time == 0) {
            $("#time").text("");
            window.clearInterval(dsq);
            $("#btn-send").attr("disabled", null);
        }
    }
</script>
</html>
