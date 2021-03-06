<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2021/9/13
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="static/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/themes/color.css">
    <link rel="stylesheet" type="text/css" href="static/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="static/themes/demo.css">
    <script type="text/javascript" src="static/jquery.min.js"></script>
    <script type="text/javascript" src="static/jquery.easyui.min.js"></script>
    <base href="<%=basePath %>"/>
    <title>Title</title>
    <script type="text/javascript">
        $(function () {
            $("#tree").tree({
                onClick: function (node) {
                    console.log(node.map.url);
                    if(node.map.isparent=="1"){
                        return;
                    }else{
                        var flag=$("#tt").tabs('exists',node.text);
                        if(flag){
                            $("#tt").tabs('select',node.text)
                        }else{
                            $("#tt").tabs('add',{
                                title:node.text,
                                closable:true,
                                content:"<iframe src='"+node.map.url+"' width='99%' height='99%' style='border: none'></iframe>"
                            });
                        }
                    }

                }
            })
        })
    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',split:false" style="height:75px;">
    <div class="easyui-layout" data-options="fit:true">

        <div data-options="region:'center',border:false"
             style="text-align:center;background:url('static/images/bg.png')">
            <span style="color: white;font-size: 25px;position:relative;top:15px;">???&nbsp;???&nbsp;???&nbsp;???&nbsp;???&nbsp;???&nbsp;???&nbsp;???&nbsp;???&nbsp;???&nbsp;???</span>
        </div>

    </div>
</div>
<div data-options="region:'south',split:false" style="height:50px;"></div>
<div data-options="region:'west',title:'????????????',split:false,collapsible:false" style="width: 150px">
    <ul id="tree" class="easyui-tree" data-options="url:'menu/menuInfo'"></ul>
</div>
<div data-options="region:'center'" style="padding:5px;background:#eee;">
    <div id="tt" class="easyui-tabs" data-options="fit:true" style="width:500px;height:250px;">
        <div title="??????" style="padding:20px;display:none;"> tab1</div>
    </div>
</div>
</body>
</html>
