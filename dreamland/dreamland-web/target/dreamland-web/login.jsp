<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录页面</title>
    <!--引入BootStrap样式-->
    <link href="${ctx}/css/zui/css/zui.min.css" rel="stylesheet">
    <link href="${ctx}/css/zui/lib/uploader/zui.uploader.min.css" rel="stylesheet">
    <style>
        body {
            background: url("/images/wings.png") no-repeat center fixed;
        }

        .content {
            margin: 50px;
        }

        .login-box {
            background: white;
            box-shadow: 0 0 0 15px rgba(255, 255, 255, .1);
            border-radius: 5px;
            padding: 40px;
        }

        .login-form, .form-group {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="content">
    <!-- logo -->
    <%--<div class="row">--%>
        <%--<img src="images/2.gif">--%>
    <%--</div>--%>
    <!--表单-->
    <div class="row" style="margin-top: 50px">
        <div class="col-sm-6 col-sm-offset-3 col-md-4 col-sm-offset-4 login-box">
            <!--标签页，两种登录方式-->
            <ul class="nav nav-secondary nav-justified">
                <li id="a_login" class="active"><a data-toggle="tab" href="#account-login">账号登录</a></li>
                <li id="p_login"><a data-toggle="tab" href="#phone-login">手机快捷登录</a></li>
            </ul>
            <!-- 标签页内容，两种表单 -->
            <div class="tab-content">
                <!--普通登录-->
                <div class="tab-pane fade in active" id="account-login">
                    <form id="normal_form" name="form" role="form" class="login-form" action="${ctx}/doLogin" method="post">
                        <div class="form-group">
                            <label for="username" class="sr-only">用户名</label>
                            <input type="text" id="username" name="username" onblur="checkUserName();" value="${email}" class="form-control" placeholder="用户名">
                        </div>
                        <div class="form-group">
                            <label for="password" class="sr-only">密码</label>
                            <input type="password" id="password" name="password" onblur="checkPassword();" value="${password}" class="form-control" placeholder="密码">
                        </div>
                        <div class="form-group">
                            <label for="code" class="sr-only">验证码</label>
                            <input type="text" id="code"  name="code" class="form-control" placeholder="验证码" onblur="checkCode()" >
                        </div>

                        <div>
                            <img id="captchaImg" style="CURSOR: pointer" onclick="changeCaptcha()"
                                 title="看不清楚?请点击刷新验证码!" align='absmiddle' src="${ctx}/captchaServlet"
                                 height="18" width="55">
                            <a href="javascript:;"
                               onClick="changeCaptcha()" style="color: #666;">看不清楚</a> <span id="code_span" style="color: red"></span>
                        </div>
                        <div class="form-group">
                            <!-- 多选框 -->
                            <div class="checkbox">
                                <label>
                                    <br/>
                                    <c:if test="${state eq '1'}">
                                    <input type="checkbox" name="state" id="loginstate" value="1" checked = checked> 记住登录状态
                                    </c:if>
                                    <c:if test="${state eq '0'}">
                                        <input type="checkbox" name="state" value="0" id="loginstate"> 记住登录状态
                                    </c:if>
                                    <c:if test="${error eq 'fail'}">
                                        <span style="color: red" id="back_data">用户名或者密码错误</span>
                                    </c:if>
                                    <c:if test="${error eq 'active'}">
                                        <span style="color: red" id="back_active">您的账号未激活，请先激活！</span>
                                    </c:if>
                                    <span style="color: green" id="normal_span">${success}</span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="button" id="btn" class="btn btn-primary btn-block" onclick="normal_login();">登录</button>
                            <br/>
                            <div style="margin-left: 260px"> <a href = "register.jsp" >立即注册</a></div>
                        </div>
                    </form>
                </div>
                <!--手机登录-->
                <div class="tab-pane fade" id="phone-login">
                    <form role="form" class="login-form form-horizontal" id="phone_form" action="${ctx}/doLogin" method="post">
                        <div class="form-group">
                            <label for="username" class="sr-only">用户名</label>
                            <div class="col-xs-12">
                                <input type="text" id="phone" name="telephone" class="form-control" placeholder="手机号">
                                <input type="hidden" id="tab" name="tab"  value="pho-login">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="sr-only">密码</label>
                            <div class="col-xs-6">
                                <input type="text" id="verifyCode" name="code" class="form-control" placeholder="验证码">
                            </div>
                            <div class="col-xs-6">
                                <button class="btn btn-primary btn-block" id="go">获取验证码</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <!-- 多选框 -->
                            <div class="checkbox col-xs-12">
                                <label>
                                    <input type="checkbox" name="hobbies"> 记住登录状态

                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <button type="button" id="phone_btn" class="btn btn-primary btn-block">登录</button>
                                <br/>
                                <div style="margin-left: 260px"> <a href = "register.jsp" >立即注册</a></div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>`
</div>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/css/zui/js/zui.min.js"></script>
<script>
    //校验用户名
    function checkUserName() {
        $("#back_data").text("");
        $("#back_active").text("");
        var username = $("#username").val();
        username = username.replace(/^\s+|\s+$/g,"");
        if(username == ""){
            $("#normal_span").text("请输入用户名或密码！").css("color","red");
            return false;
        }else{
            $("#normal_span").text("").css("color","green");
            return true;
        }
    }
    //校验密码
    function checkPassword() {
        $("#back_data").text("");
        $("#back_active").text("");
        var password = $("#password").val();
        password = password.replace(/^\s+|\s+$/g, "");
        if (password == "") {
            $("#normal_span").text("请输入密码！").css("color", "red");
            return false;
        }
        if (password.length < 6) {
            $("#normal_span").text("密码长度少于6位，请重新输入！").css("color", "red");
            return false;
        }

        $("#normal_span").text("").css("color", "green");
        return true;
    }
    //更换验证码
    function changeCaptcha() {
        $("#captchaImg").attr('src', '${ctx}/captchaServlet?t=' + (new Date().getTime()));
    }

    //验证码校验
    var flag_c = false;
    function checkCode() {
        $("#back_data").text("");
        $("#back_active").text("");
        var code = $("#code").val();
        code = code.replace(/^\s+|\s+$/g,"");
        if(code == ""){
            $("#code_span").text("请输入验证码！").css("color","red");
            flag_c = false;
        }else{
            $.ajax({
                type: 'post',
                url: '/checkCode',
                data: {"code": code},
                dataType: 'json',
                success: function (data) {
                    var val = data['message'];
                    if (val == "success") {
                        $("#code_span").text("√").css("color","green");
                        $("#reg_span").text("");
                        flag_c = true;
                    }else {
                        $("#code_span").text("验证码错误！").css("color","red");
                        flag_c = false;
                    }
                }
            });

        }
        return flag_c;
    }

    //密码框回车事件
    $("#password").bind('keypress',function(event){


        if(event.keyCode == 13)

        {
            normal_login();
        }

    });

    //验证码框回车事件
    $("#code").bind('keypress',function(event){


        if(event.keyCode == 13)
        {
            normal_login();
        }

    });

    function normal_login() {
        if(checkUserName() && checkPassword() && checkCode()) {
            $("#normal_form").submit();
        }
    }
</script>
</body>
</html>
