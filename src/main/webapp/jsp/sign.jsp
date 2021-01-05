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
                <a class="brand-logo" href="<%=request.getContextPath()%>/"> signup form</a>
            </div>
            <div class="form-section">
                <h3>sign</h3>
                <div >
                    <div class="form-input">
                        <input type="text" id="username" placeholder="Username" required="" autofocus>
                    </div>

                    <div class="form-input">
                        <input type="password" id="password" placeholder="Password" required="">
                    </div>

                    <div class="form-input">
                        <input type="password" id="password2" placeholder="Password" required="">
                    </div>
                    <button class="btn btn-primary theme-button mt-4" onclick="onSignup()">Sign Up</button>
                </div><p class="signup">Already a customer? <a href="<%=request.getContextPath()%>/jsp/login.jsp" class="signuplink">Login now</a></p>
            </div>
        </div>
    </div>
    <!-- copyright -->
    <div class="copy-right">
        <p>&copy;版权所有,侵权必究</p>
    </div>
    <!-- //copyright -->
</div>
</body>
<script>
    function onSignup() {
        var datas = {
            username:$("#username").val(),
            password:$("#password").val(),
        }
        $.ajax({
            url:'<%=request.getContextPath()%>/sign',
            methods:'post',
            data:datas,
            success:function (data) {
                if(data.code == 500){
                    alert(data.msg);
                    $("#username").val("");
                    $("#password").val("");
                }
                else if(data.code == 200){
                    alert(data.msg);
                    window.location.href = "<%=request.getContextPath()%>/jsp/login.jsp";
                }
            },
            error:function (data) {
                alert(data.msg);
            }
        })
    }
</script>
</html>
