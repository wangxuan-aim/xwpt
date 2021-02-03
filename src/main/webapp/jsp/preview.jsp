
<%@include file="index/head.jsp"%>
<%@include file="index/title.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width: 25%;float: left;border-color: #dddddd;border: 3px;margin-top: 30px;margin-left: 30px">

</div>
</body>
<script>
    var urls = '<%= request.getParameter("type")%>';
    var uid = '<%= request.getParameter("uid")%>'
    console.log(urls)
    console.log(uid)
</script>
</html>
