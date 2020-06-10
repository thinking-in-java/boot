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


<!-- 创建注册模态框 -->
<div class="modal fade" id="register" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">注册管理员</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_customer_form" onsubmit="return false" data-parsley-validate>
                    <div class="form-group">
                        <label for="new_SysUserName" class="col-sm-2 control-label">
                            管理员账号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_SysUserName" placeholder="请输入账号"
                                   required data-parsley-required-message="账号不能为空"
                                   data-parsley-remote
                                   data-parsley-remote-options='{"type":"GET","dataType":"json"}'
                                   data-parsley-remote-validator="SysUserName"    
                                   data-parsley-remote-message="账号已经存在!"
                                   name="userCode"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="password1" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password1" placeholder="密码"
                                   data-parsley-required="true"
                                   data-parsley-trigger="focusout"
                                   data-parsley-required-message="密码不可为空"
                                   data-parsley-minlength="6"
                                   data-parsley-minlength-message="密码位数不可少于6位"
                                  />
                        </div>
                    </div>
                    <div class="form-group">
                    <label for="password2" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password2" placeholder="密码"
                               data-parsley-required="true"
                               data-parsley-trigger="focusout"
                               data-parsley-required-message="确认密码不可为空"
                               data-parsley-equalto="#password1"
                               data-parsley-equalto-message="两次密码输入不一致"
                               name="userPassword"/>
                    </div>
                </div>

                    <div class="form-group">
                        <label for="new_zipcode" class="col-sm-2 control-label">用户昵称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_zipcode" placeholder="用户昵称"
                                   name="userName"
                                   data-parsley-trigger="change" data-parsley-required-message="昵称不能为空"
                                    required
                            />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="new_mobile" class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_mobile" placeholder="手机号"
                                   name="phone"
                                   data-parsley-trigger="change" data-parsley-required-message="手机号不能为空"
                                   data-parsley-pattern="^1(3|4|5|7|8)\d{9}$"
                                   data-parsley-pattern-message="请输入正确的手机号" required
                            />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="new_mobile" class="col-sm-2 control-label">验证码</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="validate" placeholder="验证码"
                                   name="validateCode"
                                   data-parsley-required="true"
                                   data-parsley-trigger="focusout"
                                   data-parsley-required-message="验证码不能为空"
                                   data-parsley-minlength="6"
                                   data-parsley-minlength-message="验证码不能少于6位"
                            />
                        </div>
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-primary sendVerifyCode">获取短信验证码</button>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="custs_create">注册</button>
            </div>
        </div>
    </div>
</div>


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
                    <a class="btn btn-default register" href="javascript:;">注册</a>
                </div>

                <div class="clearfix"></div>

                <div class="separator">
                    <div class="clearfix"></div>
                    <br/>

                    <div>
                        <h1><i class="fa fa-paw"></i>Boot客户 后台管理系统</h1>
                        <p> Copyright©2002-2020 All Rights Reserved.</p>
                        <p align="center" >
                            James Ben版权所有<span>|</span>
                            <a href="http://www.beian.miit.gov.cn" target="_blank" style="text-decoration:none;color:black">蜀ICP备20005824号-1</a></p>
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
    $('.submit').bind('click', function () {


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
                    layer.alert(response.msg + "," + response.extend.msg, {icon: 5, offset: '0px'});
                    //重置表单数据
                    $("#data-form")[0].reset();
                }
            }
        });
    });

    /*注册模态框*/
    $(".register").click(function () {

        /* 弹出模态框*/
        $("#register").modal({
            /*背景删除*/
            backdrop: "static"
        });
    });


    /*短信验证码模块*/
    $(function () {
        //短信验证码倒计时
        var countdownHandler = function () {
            var $button = $(".sendVerifyCode");
            var number = 60;
            var countdown = function () {
                if (number == 0) {
                    $button.attr("disabled", false);
                    $button.html("发送验证码");
                    number = 60;
                    return;
                } else {
                    $button.attr("disabled", true);
                    $button.html(number + "秒 重新发送");
                    number--;
                }
                setTimeout(countdown, 1000);
            }
            setTimeout(countdown, 1000);
        }
        //发送短信验证码
        $(".sendVerifyCode").on("click", function () {
            var $mobile = $("input[name=phone]");
            var data = {};
            data.mobile = $.trim($mobile.val());
            if (data.mobile == '') {
                alert('请输入手机号码');
                return;
            }
            var reg = /^1\d{10}$/;
            if (!reg.test(data.mobile)) {
                alert('请输入合法的手机号码');
                return;
            }

            $.ajax({
                url: '${App_Path}/user/getCode',
                async: true,
                type: "POST",
                dataType: "text",
                data: data,
                success: function (result) {
                    var json = JSON.parse(result);
                    if (json.msg == 'success') {
                        layer.msg("验证码正在发送,请注意查收!", {time: 2000, icon: 6, shift: 6}, function () {
                        });
                        countdownHandler();
                        return;
                    }

                }
            });
        })
        //提交
        $("#custs_create").on("click", function () {
            $.ajax({
                url: '${App_Path}/user/register',
                type: "post",
                data: $("#register form").serialize(),
                success: function (data) {
                    if (data.msg == 'success') {
                        layer.msg("恭喜您,注册成功", {time: 2000, icon: 6, shift: 6}, function () {
                        });
                        $("#register").modal('hide');
                        return;
                    }else{
                        layer.msg("注册失败,请重新注册!", {time: 2000, icon: 5, shift: 6}, function () {
                        });
                        $("#register").modal('hide');
                        return;
                    }
                }
            });
        })
    });



    //发送ajax校验账号是否可用
    $("#new_SysUserName").mouseout(function () {
        $('#new_SysUserName').parsley().validate();
    });

    // $('#new_customer_form').parsley().validate();//调用parsley表单验证插件(页面加载时就验证 是否必填和输入格式)
    window.Parsley.addAsyncValidator('SysUserName', function (xhr) {
        var d = xhr.responseText;
        //json解析
        var json = JSON.parse(d);

        if (json.code ==200) {
            return true;
        }
        return false;
    }, '${App_Path}/user/GetUserCode');

</script>


</body>
</html>
