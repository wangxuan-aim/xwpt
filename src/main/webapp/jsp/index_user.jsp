<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="index/head.jsp"%>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"> <a style="font-size: 30px;color: #fbfbfb" href="<%=request.getContextPath()%>/">xwpt</a></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/">主页</a></li>
            <li class="layui-nav-item"><a href="">任务中心</a></li>
            <li class="layui-nav-item"><a href="">失物招领</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item" id="sign" style="float: right"><a href="<%=request.getContextPath()%>/jsp/sign.jsp" >注册</a></li>
            <li class="layui-nav-item" id="login" style="float: right"><a href="<%=request.getContextPath()%>/jsp/login.jsp" >登录</a></li>

            <li class="layui-nav-item">
                <a href="javascript:;">
                    <%=request.getSession().getAttribute("xwptU")%>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="<%=request.getContextPath()%>/jsp/index_user.jsp?type=addTask">发布需求</a></dd>
                    <dd><a href="<%=request.getContextPath()%>/jsp/index_user.jsp?type=myCreatTask">任务管理</a></dd>
                    <dd><a href="<%=request.getContextPath()%>/jsp/index_user.jsp?type=user">个人信息</a></dd>
                    <dd><a href="javascript:;" onclick="logout()">注销</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-unselect=""  style="float: right">
                <a href="">需求类型</a>
                <dl class="layui-nav-child" id="needs">
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">个人中心</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick='loadHtmls("user")'>个人信息修改</a></dd>
                        <dd><a href="javascript:;" onclick='loadHtmls("updatePassword")'>修改密码</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">任务中心</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick='loadHtmls("taskList")'>全部任务</a></dd>
                        <dd><a href="javascript:;" onclick='loadHtmls("myCreatTask")'>我创建的任务</a></dd>
                        <dd><a href="javascript:;" onclick='loadHtmls("myEndTask")'>我完成的任务</a></dd>
                        <dd><a href="javascript:;"onclick='loadHtmls("myFetchList")'>我接取的任务</a></dd>
                        <dd><a href="javascript:;" onclick='loadHtmls("addTask")'>发布新任务</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">失物招领</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick='loadHtmls("lostFound")'>我捡到了</a></dd>
                        <dd><a href="javascript:;" onclick='loadHtmls("lostFound")'>我遗失了</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="margin-top: 5px;margin-left: 5px">

            <div class="layui-tab-content" id="tab1">

            </div>
        </div>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script>
    var taskid = "";
    $(function () {
        var urls = '<%= request.getParameter("type")%>';
        if(urls!=null){
            $.ajax({
                type:"get",
                url:"<%=request.getContextPath()%>/jsp/"+urls+".jsp", //需要获取的bai页面du内容zhidao
                async:true,
                success:function(data){
                    $('#tab1').append('<div class="layui-tab-item layui-show" id="'+urls+'_id"></div>')

                    var ids = '#'+urls+"_id";
                    $(ids).html(data) //将获取到的zhuan内容放到当前页面的.contentBox中
                }
            });
        }
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
    var html1 = "";
    var taskid = ""
    function getTaskid(){
        return this.taskid;
    }
    function loadHtmls(data,data1){
        if(html1 == data){
            return false;
        }else {
            $.ajax({
                type:"get",
                url:"<%=request.getContextPath()%>/jsp/"+data+".jsp", //需要获取的bai页面du内容zhidao
                async:true,
                success:function(datas){
                    $('#tab1').empty()
                    $('#tab1').append('<div class="layui-tab-item layui-show" id="'+data+'_id"></div>')

                    var ids = '#'+data+"_id";
                    $(ids).html(datas) //将获取到的zhuan内容放到当前页面的.contentBox中
                    html1 = data;
                }
            });
        }
            taskid = data1;

    }
    layui.use('element', function(){
        var element = layui.element;

        //一些事件监听
        element.on('title', function(data){
            console.log(data);
        });
    });
</script>
</body>
</html>
