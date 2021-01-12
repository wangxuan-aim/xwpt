<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">任务列表</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <table id="task" lay-filter="test"></table>

            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                <a class="layui-btn layui-btn-xs" lay-event="fetch">接取</a>
            </script>
        </div>
    </div>
</div>
<script>
    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        var tableIns = table.render({
            elem: '#task'
            ,height: 700
            ,url: '<%=request.getContextPath()%>/task/findtoNotFetch' //数据接口
            , where: {types: ""}
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'demand', title: '需求', sort: true, fixed: 'left'}
                ,{field: 'critetime', title: '开始时间',}
                ,{field: 'endtime', title: '结束时间', sort: true}
                ,{field: 'remuneration', title: '报酬',sort: true}
                ,{field: 'types', title: '任务类型',sort: true}
                ,{fixed: 'right',  align:'center', toolbar: '#barDemo'}
            ]],parseData: function(res){ //res 即为原始返回的数据
                for(var i=0;i<res.length;i++){
                    if(res[i].types == "1"){
                        res[i].types = "代取"
                    }
                    if(res[i].types == "2"){
                        res[i].types = "跑腿"
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

        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                layer.msg('查看操作');
            } else if(layEvent === 'fetch'){
                if(<%=request.getSession().getAttribute("xwptU")%>){
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
                }else {
                    layer.alert("请先登录");
                    return;
                }

            } else if(layEvent === 'detail'){
                layer.msg('查看');
            }
        });
    });
</script>