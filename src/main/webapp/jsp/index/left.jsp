<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="layui-card" style="height: 800px">
    <div class="layui-card-header">失物招领信息</div>
    <div class="layui-card-body">
        <table id="demo" lay-filter="test"></table>
    </div>
    <script>
        layui.use('table', function(){
            var table = layui.table;

            //第一个实例
            var tableIns = table.render({
                elem: '#demo'
                ,height: 700
                ,url: '<%=request.getContextPath()%>/LostFound/pickAndLostList' //数据接口
                ,page: true //开启分页
                ,cols: [[ //表头
                    {field: 'title', title: '标题', sort: true, fixed: 'left'}
                    ,{field: 'type', title: '类型',}
                    ,{field: 'creatdate', title: '创建时间',}
                ]],parseData: function(res){ //res 即为原始返回的数据

                    return {
                        "code": 0, //解析接口状态
                        "msg": "", //解析提示文本
                        "count": res.length, //解析数据长度
                        "data": res //解析数据列表
                    };
                }
            });

        });
    </script>
</div>