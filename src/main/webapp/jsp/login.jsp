<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="<%=request.getContextPath()%>/js/jQuery.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ login.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div class="w3l-signup">
    <div class="overlay">
        <div class="wrapper">
            <div class="logo">
                <a class="brand-logo" href="<%=request.getContextPath()%>/">login form</a>
            </div>
            <div class="form-section">
                <h3>login</h3>
                <div class="signin-form">
                    <div class="form-input">
                        <input type="text" id="username" placeholder="Username" required="" autofocus>
                    </div>
                    <div class="form-input">
                        <input type="password" id="password" placeholder="Password" required="">
                    </div>
                    <button class="btn btn-primary theme-button mt-4" onclick="onLogin()">Sign Up</button>
                </div><p class="signup"><a href="<%=request.getContextPath()%>/jsp/sign.jsp" class="signuplink">Sign now</a></p>
            </div>
        </div>
    </div>

    <!-- copyright -->
    <div class="copy-right">
        <p>&copy;版权所有,侵权必究 </p>
    </div>
    <!-- //copyright -->
</div>
<script>
    function onLogin() {
        var datas = {
            username:$("#username").val(),
            password:$("#password").val(),
        }
        $.ajax({
            url:'<%=request.getContextPath()%>/login',
            methods:'post',
            data:datas,
            success:function (data) {
                if(data.code == 500){
                    $("#password").val("");
                    alert(data.msg);
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
</script>
</body>
</html>
