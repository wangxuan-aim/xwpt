<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="layui-nav layui-row">
    <div class="layui-nav-item ">
        <a style="font-size: 30px" href="<%=request.getContextPath()%>/">xwpt</a>
    </div>
    <li class="layui-nav-item"><a href="">主页</a></li>
    <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/jsp/index_user.jsp?type=myFetchList">任务中心</a></li>
    <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/jsp/index_user.jsp?type=LostList">失物招领</a></li>

    <li class="layui-nav-item" lay-unselect=""  style="float: right">
        <a href="">任务类型</a>
        <dl class="layui-nav-child" id="needs">
        </dl>
    </li>

    <li class="layui-nav-item" id="sign" style="float: right"><a href="<%=request.getContextPath()%>/jsp/sign.jsp" >注册</a></li>
    <li class="layui-nav-item" id="login" style="float: right"><a href="<%=request.getContextPath()%>/jsp/login.jsp" >登录</a></li>
    <li class="layui-nav-item" lay-unselect="" id="user" style="float: right">
        <a href="javascript:;"><%=request.getSession().getAttribute("xwptU")%></a>
        <dl class="layui-nav-child">
            <dd><a href="<%=request.getContextPath()%>/jsp/index_user.jsp">个人中心</a></dd>
            <dd><a href="<%=request.getContextPath()%>/jsp/index_user.jsp?type=addTask">发布任务</a></dd>
            <dd><a href="<%=request.getContextPath()%>/jsp/index_user.jsp?type=myCreatTask">任务管理</a></dd>
            <dd><a href="<%=request.getContextPath()%>/jsp/index_user.jsp?type=user">个人信息</a></dd>
            <dd><a href="javascript:;" onclick="logout()">注销</a></dd>
        </dl>
    </li>
</ul>
<script>
    $(function () {
        if(<%=request.getSession().getAttribute("xwptU")%>){
            $("#login").replaceWith('');
            $("#sign").replaceWith('');
        }else {
            $("#user").replaceWith('');
        }

        $.ajax({
            url:'<%=request.getContextPath()%>/typeNeed/findAll',
            methods:'get',
            data:"",
            success:function (data) {
                var appends = "";
                for(var i=0;i<data.length;i++){
                    appends += "<dd><a href=\"javascript:;\" onclick='findNeed("+data[i].type+")'>"+data[i].name+"</a></dd>";
                }
                $("#needs").append(appends);
            },
            error:function (data) {
                alert(data.msg);
            }
        })
    })
    layui.use('element', function(){
        var element = layui.element;

        //一些事件监听
        element.on('title', function(data){
            console.log(data);
        });
    });
    function logout() {
        $.ajax({
            url:'<%=request.getContextPath()%>/logOut',
            methods:'post',
            data:"",
            success:function (data) {
                if(data.code == 500){
                    window.location.href = "<%=request.getContextPath()%>/jsp/index.jsp";
                }
                else if(data.code == 200){
                    alert(data.msg);
                    window.location.href = "<%=request.getContextPath()%>/jsp/index.jsp";
                }
            },
            error:function (data) {
                alert(data.msg);
            }
        })
    }
    function findNeed(type) {
        $.ajax({
            url:'<%=request.getContextPath()%>/task/findNeedtoType',
            methods:'get',
            data:type,
            success:function (data) {
                if(data.code == 500){
                    window.location.href = "<%=request.getContextPath()%>/jsp/index.jsp";
                }
                else if(data.code == 200){
                    alert(data);
                    window.location.href = "<%=request.getContextPath()%>/jsp/index.jsp";
                }
            },
            error:function (data) {
                alert(data.msg);
            }
        })
    }
</script>