<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/12/25
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div style='width:1000px;text-align: center'>
                <p style="margin-top: 160px">完善个人信息</p>
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">姓名:</label>
                <div class="layui-input-block">
                    <input type="text" name="uname" id="uname" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学号:</label>
                <div class="layui-input-block">
                    <input type="text" name="sno" id="sno" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年龄:</label>
                <div class="layui-input-block">
                    <input type="text" name="age" required id="age"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学院:</label>
                <div class="layui-input-block">
                    <input type="text" name="stu" id="stu" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="男" title="男" id="boy" checked>
                    <input type="radio" name="sex" value="女" title="女" id="girl">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" id="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>


    <script>

        layui.use('form', function(){
            var form = layui.form;

            //监听提交
            form.on('submit(formDemo)', function(data){
                $.ajax({
                    methods:'post',
                    url:"<%=request.getContextPath()%>/user/updateToUser", //需要获取的bai页面du内容zhidao
                    data:{uname:$("#uname").val(),
                        sno:$("#sno").val(),
                        age:$("#age").val(),
                        stu:$("#stu").val(),
                        sex:$("input[type=radio]:checked").val()

                    },
                    success:function(data){
                        alert(data.msg);
                        console.log(data)
                    }
                });
                // layer.msg(JSON.stringify(data.field));
                return false;
            });
        });

        $(function () {
            $("#reset").click();
            $.ajax({
                url:'<%=request.getContextPath()%>/user/findByUser',
                methods:'post',
                success:function (data) {
                    if(data!=null){
                        $("#uname").val(data.uname);
                        $("#sno").val(data.sno);
                        $("#age").val(data.age);
                        $("#stu").val(data.stu);
                        if(data.sex =="女"){
                            $('#boy').attr('checked',false)
                            $('#girl').attr('checked','true')
                        }
                        console.log("1")
                    }else {

                    }
                },
                error:function (data) {
                    alert(data.msg);
                }
            })
        })
    </script>
</body>
</html>
