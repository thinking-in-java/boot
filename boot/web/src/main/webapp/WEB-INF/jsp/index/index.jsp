<%--
  Created by IntelliJ IDEA.
  User: 96436
  Date: 2020/5/27
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>客户管理-BootCRM</title>

    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="${App_Path}/static/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- MetisMenu CSS -->
    <link href="${App_Path}/static/css/metisMenu.min.css" rel="stylesheet"/>
    <!-- DataTables CSS -->
    <link href="${App_Path}/static/css/dataTables.bootstrap.css" rel="stylesheet"/>
    <!-- Custom CSS -->
    <link href="${App_Path}/static/css/sb-admin-2.css" rel="stylesheet"/>
    <!-- Custom Fonts -->
    <link href="${App_Path}/static/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${App_Path}/static/css/boot-crm.css" rel="stylesheet" type="text/css"/>

    <!-- 引入js文件 -->
    <!-- jQuery -->
    <script src="${App_Path}/static/js/jquery-1.11.3.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${App_Path}/static/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="${App_Path}/static/js/metisMenu.min.js"></script>
    <!-- DataTables JavaScript -->
    <script src="${App_Path}/static/js/jquery.dataTables.min.js"></script>
    <script src="${App_Path}/static/js/dataTables.bootstrap.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="${App_Path}/static/js/sb-admin-2.js"></script>
    <script src="${App_Path}/static/layer/layer.js"></script>

    <!--表单校验-->
    <script src="${App_Path}/static/js/parsley.js"></script>
    <script src="${App_Path}/static/js/zh_cn.js"></script>
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="index">BOOT客户管理系统 v3.5</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- 邮件通知 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-envelope fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li>
                        <a href="#">
                            <div>
                                <strong>黄老板</strong> <span class="pull-right text-muted">
								<em>昨天</em>
							</span>
                            </div>
                            <div>今天晚上开会，讨论一下下个月工作的事...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>查看全部消息</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 邮件通知 end -->
            <!-- 任务通知 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-tasks fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-tasks">
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>任务 1</strong>
                                    <span class="pull-right text-muted">完成40%</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-success"
                                         role="progressbar" aria-valuenow="40" aria-valuemin="0"
                                         aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">完成40%</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>任务 2</strong>
                                    <span class="pull-right text-muted">完成20%</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-info" role="progressbar"
                                         aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
                                         style="width: 20%">
                                        <span class="sr-only">完成20%</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>查看所有任务</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 任务通知 end -->
            <!-- 消息通知 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> 新回复
                                <span class="pull-right text-muted small">4分钟之前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> 新消息
                                <span class="pull-right text-muted small">4分钟之前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-tasks fa-fw"></i> 新任务
                                <span class="pull-right text-muted small">4分钟之前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-upload fa-fw"></i> 服务器重启
                                <span class="pull-right text-muted small">4分钟之前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>查看所有提醒</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 消息通知 end -->
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i>
                        <shiro:user>
                            欢迎用户[<shiro:principal property="userName"/>]登录
                        </shiro:user>
                    </a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="${App_Path}/logout">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul>
        <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="查询内容...">
                            <span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
                        </div>
                    </li>
                    <li>
                        <a href="${App_Path}/user/index" class="active">
                            <i class="fa fa-edit fa-fw"></i> 客户管理
                        </a>
                    </li>
                    <li>
                        <a href="${App_Path}/user/orders">
                            <i class="fa fa-dashboard fa-fw"></i> 订单管理
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左侧显示列表部分 end-->
    </nav>
    <!-- 客户列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">客户管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" id="searchForm">
                    <div class="form-group">
                        <label for="customerName">客户名称</label>
                        <input type="text" class="form-control" id="customerName"
                               placeholder="input something" name="custName"/>
                    </div>
                    <div class="form-group">
                        <label for="customerFrom">客户来源</label>
                        <select class="form-control" id="customerFrom" name="custSource">
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="custIndustry">所属行业</label>
                        <select class="form-control" id="custIndustry" name="custIndustry"></select>
                    </div>
                    <div class="form-group">
                        <label for="custLevel">客户级别</label>
                        <select class="form-control" id="custLevel" name="custLevel"></select>
                    </div>
                    <button type="button" class="btn btn-primary" id="searchCusts">查询</button>
                </form>
            </div>
        </div>

        <a href="#" class="btn btn-primary" data-toggle="modal"
           data-target="#newCustomerDialog" id="custs_add_modal_btn">新建</a>
        <a href="#" class="btn btn-danger" data-toggle="modal"
           data-target="#newCustomerDialog" id="custs_delete_modal_btn">批量删除</a>

        <%--显示表格数据--%>
        <div class="row">
            <div class="col-md-12">
                <div class="panel-heading">客户信息列表</div>
                <table class="table table-hover" id="custs_table">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="check_all"/></th>
                        <th>编号</th>
                        <th>客户名称</th>
                        <th>客户来源</th>
                        <th>客户所属行业</th>
                        <th>客户级别</th>
                        <th>固定电话</th>
                        <th>手机</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 显示分页信息 -->
        <div class="row">
            <!--分页文字信息  -->
            <div class="col-md-6" id="page_info_area"></div>
            <!-- 分页条信息 -->
            <div class="col-md-6" id="page_nav_area">
            </div>
        </div>
    </div>
    <!-- 客户列表查询部分  end-->
</div>


<!-- 创建客户模态框 -->
<div class="modal fade" id="custs_add" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建客户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_customer_form" onsubmit="return false" data-parsley-validate>
                    <div class="form-group">
                        <label for="new_customerName" class="col-sm-2 control-label">
                            客户名称
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_customerName" placeholder="客户名称"
                                   required data-parsley-required-message="客户名称不能为空"
                                   data-parsley-remote
                                   data-parsley-remote-options='{"type":"GET","dataType":"json"}'
                                   data-parsley-remote-validator="checkCustName"    
                                   data-parsley-remote-message="该客户已经存在!"
                                   name="custName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="new_customerFrom" name="custSource" required="required"
                                    data-parsley-required-message="请选择客户来源">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="new_custIndustry" name="custIndustry" required="required"
                                    data-parsley-required-message="请选择客户所属行业">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="new_custLevel" name="custLevel" required="required"
                                    data-parsley-required-message="请选择客户级别">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_linkMan" class="col-sm-2 control-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_linkMan" placeholder="联系人"
                                   name="custLinkman"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_phone" class="col-sm-2 control-label">固定电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_phone" placeholder="固定电话" name="custPhone"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_mobile" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_mobile" placeholder="移动电话"
                                   name="custMobile"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_zipcode" class="col-sm-2 control-label">邮政编码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_zipcode" placeholder="邮政编码"
                                   name="custZipcode"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_address" class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_address" placeholder="联系地址"
                                   name="custAddress"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="custs_create">创建客户</button>
            </div>
        </div>
    </div>
</div>


<!-- 修改客户模态框 -->
<div class="modal fade" id="custs_update" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">跟新客户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_customer_form">
                    <div class="form-group">
                        <label for="new_customerName" class="col-sm-2 control-label">
                            客户名称
                        </label>
                        <div class="col-sm-10">
                            <p class="form-control-static" name="custName" id="update_customerName"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="update_customerFrom" name="custSource">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="update_custIndustry" name="custIndustry">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="update_custLevel" name="custLevel">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_linkMan" class="col-sm-2 control-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="update_linkMan" placeholder="联系人"
                                   name="custLinkman"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_phone" class="col-sm-2 control-label">固定电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="update_phone" placeholder="固定电话"
                                   name="custPhone"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_mobile" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="update_mobile" placeholder="移动电话"
                                   name="custMobile"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_zipcode" class="col-sm-2 control-label">邮政编码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="update_zipcode" placeholder="邮政编码"
                                   name="custZipcode"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_address" class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="update_address" placeholder="联系地址"
                                   name="custAddress"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="custs_update_custs">跟新</button>
            </div>
        </div>
    </div>
</div>


<!-- 编写js代码 -->
<script type="text/javascript">
    //保存总记录数
    var totalRecord;
    //当前页码
    var currentPage;

    //1、页面加载完成以后，直接去发送ajax请求查询到客户来源,所属行业,客户级别信息,回显到查询表单
    $(function () {
        //发出ajax请求得到查询到客户来源 写入模态框的下拉列表中
        getDict_type_name("#customerFrom");
        //发出ajax请求得到查询到所属行业 写入模态框的下拉列表中
        getCustIndustry("#custIndustry");
        //发出ajax请求得到查询到所属级别 写入模态框的下拉列表中
        getcustLevel("#custLevel");
        //去首页
        to_page(1);
    });

    //查询到客户来源
    function getDict_type_name(element) {
        $(element).empty()
        $.ajax({
            url: "${App_Path}/customer/customerFrom",
            type: "GET",
            success: function (result) {
                //显示查询到客户来源信息到模态框中
                var optionNull = $("<option></option>").append("请选择").attr("value", "");
                optionNull.appendTo($(element));
                $.each(result.extend.Form_type, function (index, item) {
                    var option = $("<option></option>").append(item.dictItemName).attr("value", item.dictId);
                    option.appendTo($(element));
                });
            }
        });
    }

    //查询所属行业
    function getCustIndustry(element) {
        $(element).empty()
        $.ajax({
            url: "${App_Path}/customer/custIndustry",
            type: "GET",
            success: function (result) {
                //显示查询到客户来源信息到模态框中
                var optionNull = $("<option></option>").append("请选择").attr("value", "");
                optionNull.appendTo($(element));
                $.each(result.extend.industry_type, function (index, item) {
                    var option = $("<option></option>").append(item.dictItemName).attr("value", item.dictId);
                    option.appendTo($(element));
                });
            }
        });
    }

    //查询客户级别信息
    function getcustLevel(element) {
        $(element).empty()
        $.ajax({
            url: "${App_Path}/customer/custLevel",
            type: "GET",
            success: function (result) {
                //显示查询到客户来源信息到模态框中
                var optionNull = $("<option></option>").append("请选择").attr("value", "");
                optionNull.appendTo($(element));
                $.each(result.extend.level_type, function (index, item) {
                    var option = $("<option></option>").append(item.dictItemName).attr("value", item.dictId);
                    option.appendTo($(element));
                });
            }
        });
    }

    /*跳转到某一页*/
    function to_page(pn) {
        $.ajax({
            url: "${App_Path}/customer/customers",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                //console.log(result);
                //1、解析并显示员工数据
                build_custs_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    //处理显示数据到表单
    function build_custs_table(result) {
        //清空table表格
        $("#custs_table tbody").empty();
        var custs = result.extend;
        $.each(custs.pageInfo.list, function (index, item1) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var custId = $("<td></td>").append(item1.custId);
            var custName = $("<td></td>").append(item1.custName);
            var custSource;
            var custIndustry;
            var custLevel;
            $.each(custs.Industry, function (index, item) {//判断客户行业是否匹配
                if (item1.custIndustry == item.dictId) {
                    custIndustry = $("<td></td>").append(item.dictItemName);
                }
            });
            $.each(custs.source, function (index, item) {//判断客户来源是否匹配
                if (item1.custSource == item.dictId) {
                    custSource = $("<td></td>").append(item.dictItemName);
                }
            });

            $.each(custs.level, function (index, item) {//判断客户级别
                if (item1.custLevel == item.dictId) {
                    custLevel = $("<td></td>").append(item.dictItemName);
                }
            });
            var custPhone = $("<td></td>").append(item1.custPhone);
            var custMobile = $("<td></td>").append(item1.custMobile);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id", item1.custId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id", item1.custId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>")
                .append(checkBoxTd)
                .append(custId)
                .append(custName)
                .append(custSource)
                .append(custIndustry)
                .append(custLevel)
                .append(custPhone)
                .append(custMobile)
                .append(btnTd)
                .appendTo("#custs_table tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第" + result.extend.pageInfo.pageNum + "页,总共" +
            result.extend.pageInfo.pages + "页,总共" +
            result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pages;
    }

    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result) {
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加点击翻页的事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }


        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }
        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }


    /*条件查询*/
    //点击更新就跟新信息
    $("#searchCusts").click(function () {
        //发送ajax请求 保存信息
        $.ajax({
            url: "${App_Path}/customer/customers",
            type: "GET",
            data: $("#searchForm").serialize(),
            success: function (result) {
                build_custs_table(result);
                //关闭模态框
                //  $("#emp_change").modal('hide');
                //回到本页面
                //to_page(currentPage);
                //发出ajax请求得到查询到客户来源 写入模态框的下拉列表中
                getDict_type_name("#customerFrom");
                //发出ajax请求得到查询到所属行业 写入模态框的下拉列表中
                getCustIndustry("#custIndustry");
                //发出ajax请求得到查询到所属级别 写入模态框的下拉列表中
                getcustLevel("#custLevel");
                //清除搜索框内容
                $("#customerName").val("");
            }
        });
    });

    /* 当点击新增按钮后弹出模态框回显数据*/
    $("#custs_add_modal_btn").click(function () {
        //清除表单数据  表单辞职
        $("#custs_add form")[0].reset();//重置表单元素
        //reset_form("#custs_add form");
        //发出ajax请求得到部门信息 写入模态框的下拉列表中
        //发出ajax请求得到查询到客户来源 写入模态框的下拉列表中
        getDict_type_name("#new_customerFrom");
        //发出ajax请求得到查询到所属行业 写入模态框的下拉列表中
        getCustIndustry("#new_custIndustry ");
        //发出ajax请求得到查询到所属级别 写入模态框的下拉列表中
        getcustLevel("#new_custLevel");

        /* 弹出模态框*/
        $("#custs_add").modal({
            /*背景删除*/
            backdrop: "static"
        });
    });

    //当点击保存按钮以后 提交信息
    $('#custs_create').bind('click', function () {
        $('#new_customer_form').submit();
    });

    //发送ajax全球校验用户名是否可用 new_customerName
    $("#new_customerName").change(function () {
        $('#new_customerName').parsley().validate();
    });
    //校验客户名称是否可用
    // $('#new_customer_form').parsley().validate();//调用parsley表单验证插件(页面加载时就验证 是否必填和输入格式)
    window.Parsley.addAsyncValidator('checkCustName', function (xhr) {
        var d = xhr.responseText;
        //json解析
        var json = JSON.parse(d);

        if (json.code == 200) {
            return true;
        }
        return false;
    }, '${App_Path}/customer/checkCustName');


    $("#new_customer_form").parsley().on('form:submit', function () {
        //获取用户名 校验 防止遗漏
        var cust_name = $("#new_customerName").val();
        if (cust_name == '') {
            return false;
        }
        //将模态框中的数据提交到服务器  发送ajax
        $.ajax({
            url: "${App_Path}/customer/customers",
            type: "POST",
            data: $("#custs_add form").serialize(),
            success: function (data) {
                if (data.code == 100) {//成功
                    //当员工保存成功,关闭比模态框
                    $("#custs_add").modal('hide')
                    //去往最后一页看是否添加成功
                    layer.msg(data.msg, {time: 2000, icon: 6, shift: 6}, function () {
                    });
                    to_page(currentPage);
                } else {//失败    显示失败信息
                    if(undefined!=data.extend.errors.custName){
                        //有那个字段就显示那个字段信息
                        layer.msg(data.msg+","+data.extend.errors.custName, {time: 2000, icon: 5, shift: 6}, function () {
                        });
                    }

                }
            }
        });
    });


    //编辑按钮绑定单击事件   使用live方法/on替代
    $(document).on("click", ".edit_btn", function () {
        var custsId = $(this).parents("tr").find("td:eq(1)").text();
        //1.查出员工信息
        getCustsInfo(custsId);
        //2.给跟新按钮添加自定义属性用于传id值
        $("#custs_update_custs").attr("edit-id", custsId);//给跟新按钮添加自定义属性,用于传递值
        /* 弹出模态框*/
        $("#custs_update").modal({
            /*背景删除*/
            backdrop: "static"
        });
    });

    //发送ajax获取某客户信息
    function getCustsInfo(id) {
        $.ajax({
            url: "${App_Path}/customer/customers/" + id,
            type: "GET",
            success: function (result) {
                var custs = result.extend;
                //写入客户姓名   不可变
                $("#update_customerName").text(result.extend.cust.custName);
                //写入客户来源
                $.each(custs.source, function (index, item) {//判断客户来源是否匹配
                    var option = $("<option></option>").append(item.dictItemName).attr("value", item.dictId);
                    option.appendTo($("#update_customerFrom"));
                    if (custs.cust.custSource == item.dictId) {
                        $("#update_customerFrom").val([item.dictId]);
                    }
                });
                //写入客户所属行业
                        $.each(custs.Industry, function (index, item) {//判断客户行业是否匹配
                    var option = $("<option></option>").append(item.dictItemName).attr("value", item.dictId);
                    option.appendTo($("#update_custIndustry"));

                    if (custs.cust.custIndustry == item.dictId) {
                        $("#update_custIndustry").val([item.dictId]);
                    }
                });
                //写入客户级别
                $.each(custs.level, function (index, item) {//判断客户级别
                    var option = $("<option></option>").append(item.dictItemName).attr("value", item.dictId);
                    option.appendTo($("#update_custLevel"));
                    if (custs.cust.custLevel == item.dictId) {
                        $("#update_custLevel").val([item.dictId]);
                    }
                });
                //写入客户联系人
                $("#update_linkMan").val(custs.cust.custLinkman);
                //写入客户固定电话
                $("#update_phone").val(custs.cust.custPhone);
                //写入客户移动电话
                $("#update_mobile").val(custs.cust.custMobile);
                //写入客户邮政编码
                $("#update_zipcode").val(custs.cust.custZipcode);
                //写入客户联系地址
                $("#update_address").val(custs.cust.custAddress);

            }
        });
    }

    //点击更新就跟新信息
    $("#custs_update_custs").click(function () {
        //发送ajax请求 更新客户信息
        $.ajax({
            url: "${App_Path}/customer/customers/" + $("#custs_update_custs").attr("edit-id"),
            type: "PUT",
            data: $("#update_customer_form").serialize(),
            success: function (result) {
                //关闭模态框
                $("#custs_update").modal('hide');
                //回到本页面
                layer.msg(result.msg, {time: 2000, icon: 6, shift: 6}, function () {
                    to_page(currentPage);
                });
            }
        });
    });

    //单个删除功能
    $(document).on("click", ".delete_btn", function () {
        //要删除的员工的姓名
        var custsName = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确认删除员工:[" + custsName + "]吗?")) {//确认删除 发送ajax删除即可
            $.ajax({
                url: "${App_Path}/customer/customers/" + $(this).attr("del-id"),
                type: "DELETE",
                success: function (result) {
                    layer.msg(result.msg, {time: 2000, icon: 6, shift: 6}, function () {
                        to_page(currentPage);
                    });
                }

            });

        }
    });


    //全选全部选功能
    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    });
    $(document).on("click", ".check_item", function () {
        //判断是否选择框选满了  选满了那么最上面的标题的选择框也选中
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });


    //点击全部删除,就批量删除
    $("#custs_delete_modal_btn").click(function () {
        var custsNames = "";
        var ids = "";
        $.each($(".check_item:checked"), function () {
            custsNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            //组装员工id
            ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        custsNames = custsNames.substring(0, custsNames.length - 1);
        ids = ids.substring(0, ids.length - 1);
        if (confirm("确认删除以下员工[" + custsNames + "]吗?")) {
            if (custsNames == '') {
                layer.msg("选项不能为空!!", {time: 2000, icon: 5, shift: 6}, function () {

                });
                return;
            }
            $.ajax({
                url: "${App_Path}/customer/customers/" + ids,
                type: "DELETE",
                success: function (result) {
                    layer.msg(result.msg, {time: 2000, icon: 6, shift: 6}, function () {
                        $("#check_all").prop("checked", '');
                        to_page(currentPage);
                    });
                }
            });

        }
    });

</script>


</body>
</html>
