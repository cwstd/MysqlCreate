<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2021/9/13
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="<%=basePath %>"/>
    <meta charset="UTF-8">
    <title>Basic Panel - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="static/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/themes/color.css">
    <link rel="stylesheet" type="text/css" href="static/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="static/themes/demo.css">
    <script type="text/javascript" src="static/jquery.min.js"></script>
    <script type="text/javascript" src="static/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        $(function (){
            $("#login").click(function (){
                $("#loginForm").submit();
            })
        })
    </script>
</head>
<body>
<%--创建面板组件--%>
<div style="margin: auto;margin-top:120px;width: 402px;">
    <div class="easyui-panel" style="width:400px;padding:50px 60px" title="欢迎登录数据库">
        <form id="loginForm" method="post" action="logincontroller/login">
            <div style="margin-bottom:20px">
                <input name="host" class="easyui-textbox" label="主机名"  value="127.0.0.1" iconWidth="28" style="width:100%;height:34px;padding:10px;">
            </div>
            <div style="margin-bottom:20px">
                <input name="port" class="easyui-textbox" label="端口号" value="3306" iconWidth="28" style="width:150px;height:34px;padding:10px">
            </div>
            <div style="margin-bottom:20px">
                <input  name="user" class="easyui-textbox" label="用户名"  iconWidth="28" style="width:100%;height:34px;padding:10px">
            </div>
            <div style="margin-bottom:20px">
                <input id="pass" name="password" class="easyui-passwordbox" label="密码"  iconWidth="28" style="width:100%;height:34px;padding:10px">
            </div>
            <div style="margin:20px 0">
                <a href="javascript:void(0)" id="login" class="easyui-linkbutton c3" style="width:120px">登录</a> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <input class="easyui-checkbox" name="fruit" value="记住密码" labelPosition="after" label="记住密码:">
            </div>
            <div style="margin:20px 0">
                <c:if test="${sessionScope.msg=='loginFail'}">
                    <font color="red" size="2px">登陆数据库失败!</font>
                </c:if>
                <c:remove var="msg" scope="session"></c:remove>
            </div>
        </form>
    </div>
    <div id="viewer"></div>
</div>


<script type="text/javascript">
    $('#pass').passwordbox({
        inputEvents: $.extend({}, $.fn.passwordbox.defaults.inputEvents, {
            keypress: function(e){
                var char = String.fromCharCode(e.which);
                $('#viewer').html(char).fadeIn(200, function(){
                    $(this).fadeOut();
                });
            }
        })
    })
</script>
<style>
    #viewer{
        position: relative;
        padding: 0 60px;
        top: -70px;
        font-size: 54px;
        line-height: 60px;
    }
</style>
</body>
</html>
