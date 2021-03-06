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
<table id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="fetch">接取</a>
</script>

<script>
    layui.use('table', function(){
        var table = layui.table;
        var category=window.location.search;
        debugger
        //第一个实例
        var tableIns = table.render({
            elem: '#demo'
            ,height: 700
            ,url: '<%=request.getContextPath()%>/task/findtoNotFetch' //数据接口
            ,page: true //开启分页
            , where: {types: ""}
            ,cols: [[ //表头
                {field: 'demand', title: '需求', sort: true, fixed: 'left'}
                ,{field: 'critetime', title: '开始时间',}
                ,{field: 'endtime', title: '结束时间', sort: true}
                ,{field: 'remuneration', title: '报酬',sort: true}
                ,{fixed: 'right',  align:'center', toolbar: '#barDemo'}
            ]],parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": res.length, //解析数据长度
                    "data": res //解析数据列表
                };
            }
        });

        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                window.open('<%=request.getContextPath()%>/jsp/preview.jsp?uid='+data.uid+"&types=1");
                // layer.msg('查看操作');
            } else if(layEvent === 'fetch'){
                layer.confirm('确定接取吗', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url:'<%=request.getContextPath()%>/task/fetchTouser',
                        type:'post',
                        data:{uid:data.uid},
                        success:function (data1) {
                            layer.msg(data1.msg)
                        },
                        error:function (data2) {
                            layer.msg(data2.msg);
                        }
                    })
                })
            } else if(layEvent === 'detail'){
                layer.msg('查看');
            }
        });
    });
</script>
</body>
</html>
