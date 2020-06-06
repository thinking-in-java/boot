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
                <div>
                    <input type="text" id="username" class="form-control" placeholder="用户名" name="userCode"
                           data-parsley-pattern="/^[a-z0-9_-]{3,16}$/"
                           data-parsley-pattern-message="请输入正确用户名"
                           data-parsley-required-message="用户名不能为空"
                           required/>
                </div>
                <div>
                    <input type="password" id="password" class="form-control" placeholder="密码" name="userPassword"

                           data-parsley-pattern-message="请输入正确密码"
                           data-parsley-required-message="密码不能为空"
                           required/>
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
<script src="${App_Path}/static/layer/layer.js"></script>

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
                if (response.code == 100) {
                    layer.msg(response.msg, {icon: 1, time: 1000, offset: '0px'});
                    window.location.href = '${App_Path}/user/index';
                } else {
                    layer.alert(response.msg+","+response.extend.msg, {icon: 5, offset: '0px'});
                    //重置表单数据
                    $("#data-form")[0].reset();
                }
            }
        });
    });
</script>
</body>
</html>
