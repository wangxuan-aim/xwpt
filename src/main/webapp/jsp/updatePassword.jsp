<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/12/29
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style='width:1000px;text-align: center'>
    <p style="margin-top: 160px">修改密码</p>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">密码:</label>
            <div class="layui-input-block">
                <input type="text" name="password" id="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码:</label>
            <div class="layui-input-block">
                <input type="text" name="password1" id="password1" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>

    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            if(data.field.password == data.field.password1){
                $.ajax({
                    methods:'post',
                    url:"<%=request.getContextPath()%>/user/updateToUser", //需要获取的bai页面du内容zhidao
                    data:data.field,
                    success:function(data){
                        alert(data.msg);
                        console.log(data)
                    }
                });
            }
            else
                alert("密码输入不一致")
            // layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</html>
