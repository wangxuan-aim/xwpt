<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/1/5
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<label class="layui-form-label">标题</label>
<div class="layui-input-block">
    <input type="text" name="title" id="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
</div>
<br><hr>
<div id="div1">
</div>
<div><button type="button" class="layui-btn layui-btn-lg" onclick="save()" style="margin-top: 30px;margin-left: 45%;width: 200px">保存</button></div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/wangEditor.min.js"></script>
<script>
    var editor = null;
    $(function () {
        if(editor==null){
            const E = window.wangEditor;
            editor = new E(document.getElementById('div1'))
            editor.config.uploadImgShowBase64 = true;
            editor.config.height = 400
            editor.create();
        }}
        )
    function save() {
        var title = $("#title").val();
        var describes = editor.txt.html();

    }
</script>
</body>
</html>
