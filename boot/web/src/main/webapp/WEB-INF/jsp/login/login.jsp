<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
    <title>Boot 客户管理系统 - 系统登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="${App_Path}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${App_Path}/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${App_Path}/static/css/nprogress.css" rel="stylesheet">
    <link href="${App_Path}/static/css/animate.min.css" rel="stylesheet">
    <link href="${App_Path}/static/css/custom.min.css" rel="stylesheet">
</head>

<body class="login">
<div class="login_wrapper">
    <div class="animate form login_form">
        <section class="login_content">
            <form id="data-form" onsubmit="return false" data-parsley-validate>
                <h1>Boot 系统登录</h1>

                <%--<shiro:guest>--%>
                <%--&lt;%&ndash;用户在没有登录或RememberMe时&ndash;%&gt;--%>
                <%--我还没有登录--%>
                <%--</shiro:guest>--%>
                <%--<shiro:user>--%>
                <%--我已经登录了--%>
                <%--</shiro:user>--%>

                <%--<shiro:authenticated>--%>
                <%--已经认证通过--%>
                <%--</shiro:authenticated>--%>

                <%--<shiro:notAuthenticated>--%>
                <%--未认证--%>
                <%--</shiro:notAuthenticated>--%>

                <div>
                    <input type="text" class="form-control" placeholder="用户名" name="userCode" required/>
                </div>
                <div>
                    <input type="password" class="form-control" placeholder="密码" name="userPassword" required/>
                </div>
                <div>
                    <a class="btn btn-default submit" href="javascript:;">登录</a>
                </div>

                <div class="clearfix"></div>

                <div class="separator">
                    <div class="clearfix"></div>
                    <br/>

                    <div>
                        <h1><i class="fa fa-paw"></i>Boot客户 后台管理系统</h1>
                        <p>©2020 All Rights Reserved.</p>
                    </div>
                </div>
            </form>
        </section>
    </div>
</div>
<script src="${App_Path}/static/js/jquery-1.11.3.min.js"></script>
<script src="${App_Path}/static/js/bootstrap.min.js"></script>
<script src="${App_Path}/static/js/layer.js"></script>

<!--表单校验-->
<script src="${App_Path}/static/js/parsley.js"></script>
<script src="${App_Path}/static/js/zh_cn.js"></script>

<script>
    $('.submit').bind('click',function () {
        $('#data-form').submit();
    });

    $('#data-form').parsley().on('form:submit', function () {
        $.ajax({
            url: '${App_Path}/user/login',
            type: 'post',
            data: $("#data-form").serialize(),
            dataType: 'json',
            success: function (response) {
                console.log(response)
                if (response.code == 100) {
                    layer.msg(response.msg, {icon: 1, time: 1000, offset: '0px'});
                    window.location.href = '${App_Path}/user/index';
                } else {
                    layer.alert(response.msg, {icon: 5, offset: '0px'});
                }
            }
        });
    });
</script>
</body>
</html>
