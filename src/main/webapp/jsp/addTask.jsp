<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="background-color: #fbfbfb">
    <div class="layui-form-item" style="margin-top: 30px">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" id="demand" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>

        <label class="layui-form-label">报酬</label>
        <div class="layui-input-block">
            <input type="text" name="title" id="remuneration" required style="width: 40%"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
        <br>
        <hr>
        <div style="margin-left: 70px">
            <a>开始时间：<input id="critetime" type="datetime-local" /></a>
            <a>结束时间：<input id="endtime" type="datetime-local" /></a>
            <a>需求类型：
                <select name="types" id="demandtype" lay-verify="required">

                </select>
            </a>

        </div>
        <hr>
    </div>
   <div id="div1">
   </div>
    <hr>
    <p style="text-align: center">
    类型:<a>已完成：<input type="radio" name="type" value="2" title="已完成"></a>
    <a>未完成:<input type="radio" name="type" value="1" title="未完成" checked></a>
    <div><button type="button" class="layui-btn layui-btn-lg" onclick="save()" style="margin-top: 30px;margin-left: 45%;width: 200px">保存</button></div>
    </p>
    <input type="hidden" id="textare">
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/wangEditor.min.js"></script>
<script type="text/javascript">
    var editor = null;
    $(function () {
        if(editor==null){
            const E = window.wangEditor;
            editor = new E(document.getElementById('div1'))
            editor.config.uploadImgShowBase64 = true;
            editor.config.height = 400
            editor.create();
        }
        var i = getTaskid();
        if(i!=null&&i!=undefined){
            $.ajax({
                url:'<%=request.getContextPath()%>/task/findTaskByID',
                methods:'get',
                data:{'uid': i },
                success:function(data){
                    $("#demand").val(data.demand);
                    $("#remuneration").val(data.remuneration);
                    $("#critetime").val(data.critetime);
                    $("#endtime").val(data.endtime);
                    $("#textare").val(data.describes);
                    editor.txt.html($("#textare").val());
                }
            })
        }
        $.ajax({
            url:'<%=request.getContextPath()%>/typeNeed/findAll',
            methods:'get',
            data:"",
            success:function (data) {
                var appends = "";
                for(var i=0;i<data.length;i++){
                    appends += "<option value="+data[i].type+">"+data[i].name+"</option>";
                }
                $("#demandtype").append(appends);
            },
            error:function (data) {
                alert(data.msg);
            }
        })
    })
    function save() {
        var describes = editor.txt.html();
        var demand = $("#demand").val();
        var remuneration = $("#remuneration").val();
        var critetime = $("#critetime").val();
        var endtime = $("#endtime").val();
        var demandtype = $("#demandtype").val();
        var types = $("input[type=radio]:checked").val()
        if(demand == ""){
            alert("需求不能为空")
            return false;
        }
        if(remuneration == ""){
            alert("报酬不能为空")
            return false;
        }
        if(critetime == ""){
            alert("开始时间不能为空")
            return false;
        }
        if(endtime == ""){
            alert("结束时间不能为空")
            return false;
        }
        var i = getTaskid();
        if(i!=null&&i!=undefined){

        }
        var url = "";
        var task = "";
        var i = getTaskid();
        if(i!=null&&i!=undefined&&i!=""){
            url = "<%=request.getContextPath()%>/task/updateTask"
            task = {
                uid:i,
                describes:describes,
                demand:demand,
                remuneration:remuneration,
                critetime:critetime,
                endtime:endtime,
                demandtype:demandtype,
                types:types
            }
        }else {
            url = "<%=request.getContextPath()%>/task/addTask"
            task = {
                describes:describes,
                demand:demand,
                remuneration:remuneration,
                critetime:critetime,
                endtime:endtime,
                demandtype:demandtype,
                types:types
            }
        }

        $.ajax({
            type:"post",
            url:url, //需要获取的bai页面du内容zhidao
            data:task,
            success:function(data){
                alert(data.msg);
                console.log(data)
            }
        });
    }
</script>