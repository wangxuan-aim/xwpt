<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="GBK" %>
<%@include file="index/head.jsp"%>
<%@include file="index/title.jsp"%>
<html>
<head>
    <title>预览</title>
</head>
<body style="background-color: #dddddd;" >
<div style="margin-top: 30px;margin-left: 30px;margin-right:30px">
<div style="margin-top: 30px;margin-left: 300px;margin-right:300px;background-color: #fbfbfb;min-height: 700px" id="pre">

</div>
</div>
</body>
<script>
    var type = '<%= request.getParameter("type")%>';
    var uid = '<%= request.getParameter("uid")%>'
    var editor = null;
    var layer;

    $(function () {
        if(type==1){
            $.ajax({
                url:'<%=request.getContextPath()%>/task/findTaskByID',
                methods:'get',
                data:{'uid': uid },
                success:function(data){
                    $("#pre").append("<p style='font-size: 30px;text-align: center'>任务内容</p><hr /><br>")
                    $("#pre").append(data.describes)
                    if(data.types == "1"){
                        $("#pre").append("<hr /><p style='font-size: 50px;text-align: center'><button type=\"button\" class=\"layui-btn\" onclick='fetchs()'>接取任务</button></P>")
                    }
debugger
                }
            })
        }
        if(type==2){
            $("#pre").append("<p><h2>失物招领</h2></p>")
        }
        layui.use('layer', function(){
            layer = layui.layer;
        });
    })

    function fetchs() {
        $.ajax({
            url:'<%=request.getContextPath()%>/task/fetchTouser',
            type:'post',
            data:{uid:uid},
            success:function (data1) {
                layer.msg(data1.msg)
            },
            error:function (data2) {
                layer.msg(data2.msg);
            }
        })
    }
</script>
</html>
