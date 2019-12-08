<%--
  Created by IntelliJ IDEA.
  User: DFG
  Date: 2019/11/29
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    $(function () {
        // $.ajax({
        //     url: "/sys/menu",
        //     type: "get",
        //     data: "",
        //     dataType: "json",
        //     success: function (data) {
        //         var html = '';
        //         for (var i = 0; i < data.length; i++) {
        //             if (data[i].type == 1) { // 保留一级菜单
        //                 html = html + data[i].name + "<br>" + "<ul>";
        //                 for (var j = 0; j < data.length; j++) {
        //                     if (data[j].pId == 1 && data[j].type == 2) {
        //                         html = html + '<li><a href="' + data[j].menuUrl + '">' + data[j].name + '</a></li>';
        //                     }
        //                 }
        //                 html = html + '</ul>';
        //             }
        //         }
        //         $("#div_left").append(html)
        //     }
        // })
        $.ajax({
            url: "/sys/menu",
            type: "get",
            data: "",
            dataType: "json",
            success: function (data) {
                var parent = data.parent;
                var son = data.son;
                var html = "";
                for (var i = 0; i < parent.length; i++) {
                    html = html + parent[i].name;
                    html = html + '<ul>';
                    for (var j = 0; j < son.length; j++) {
                        if (parent[i].id == son[j].pId) {
                            html = html + '<li><a href="' + son[j].menuUrl + '">' + son[j].name + '</a></li>';
                        }
                    }
                    html = html + '</ul>';
                }
                $("#div_left").append(html);
            }
        });


    })
</script>
<body>
<%--系统模块(侧边栏)--%>
<div id="div_left" style="border: red 1px solid; float: left; width: 20%; height: 80%;"></div>
</body>
</html>
