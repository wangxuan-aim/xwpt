<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/12/31
  Time: 1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a>未完成:<input type="radio" name="type" value="1" title="未完成" checked></a>
<a>已接取未完成:<input type="radio" name="type" value="2" title="已接取未完成"></a>
<a>已完成：<input type="radio" name="type" value="3" title="已完成"></a>
<table id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>

    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        var tableIns = table.render({
            elem: '#demo'
            ,height: 700
            ,url: '<%=request.getContextPath()%>/task/mycreat' //数据接口
            ,where: {types: $("input[type=radio]:checked").val()}
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'demand', title: '需求', sort: true, fixed: 'left'}
                ,{field: 'critetime', title: '开始时间',}
                ,{field: 'endtime', title: '结束时间', sort: true}
                ,{field: 'demandtype', title: '需求类型',}
                ,{field: 'types', title: '任务状态', sort: true}
                ,{field: 'remuneration', title: '报酬',sort: true}
                ,{fixed: 'right', width:300, align:'center', toolbar: '#barDemo'}
            ]],parseData: function(res){ //res 即为原始返回的数据
                for(var i=0;i<res.length;i++){
                    if(res[i].types == "1"){
                        res[i].types = "未接取"
                    }
                    if(res[i].types == "2"){
                        res[i].types = "已接取未完成"
                    }
                    if(res[i].types == "3"){
                        res[i].types = "已完成"
                    }
                }
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": res.length, //解析数据长度
                    "data": res //解析数据列表
                };
            }
        });

        $("input[type=radio]").click(function () {
            tableIns.reload({
                where: {types: $("input[type=radio]:checked").val()}
            });
        });
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                layer.msg('查看操作');
            }else if(layEvent === "edit"){
                loadHtmls('addTask',data.uid);
            }else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url:'<%=request.getContextPath()%>/task/deleteByUId',
                        type:'post',
                        data:{uid:data.uid},
                        success:function (data1) {
                            layer.msg(data1.msg, {icon: 1} );
                        },
                        error:function (data2) {
                            layer.msg(data2.msg);
                        }
                    })
                })
            } else if(layEvent === 'loadfectchname'){
                layer.msg('编辑操作');
            }
        });
    });
</script>
</body>
</html>
