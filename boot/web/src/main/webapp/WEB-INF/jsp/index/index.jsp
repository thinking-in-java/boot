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
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="${App_Path}/customer/list.action">BOOT客户管理系统 v2.0</a>
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
                                <strong>张经理</strong> <span class="pull-right text-muted">
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
                        用户：${USER_SESSION.userName}
                    </a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="${pageContext.request.contextPath }/logout.action">
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
                        <a href="${pageContext.request.contextPath }/customer/list.action" class="active">
                            <i class="fa fa-edit fa-fw"></i> 客户管理
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-dashboard fa-fw"></i> 客户拜访
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
                               value="${custName }" name="custName"/>
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
           data-target="#newCustomerDialog" onclick="clearCustomer()">新建</a>

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
<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"></div>
<!-- 修改客户模态框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"></div>
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
<!-- 编写js代码 -->
<script type="text/javascript">
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
                var optionNull = $("<option></option>").append("请选择").attr("value","");
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
                // build_page_info(result);
                //3、解析显示分页条数据
                //  build_page_nav(result);
            }
        });
    }

    //处理显示数据到表单
    function build_custs_table(result) {
        //清空table表格
        $("#custs_table tbody").empty();
        var custs = result.extend.pageInfo.list;
        $.each(custs, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var custId = $("<td></td>").append(item.custId);
            var custName = $("<td></td>").append(item.custName);
            var custSource = $("<td></td>").append(item.custSource);
            var custIndustry = $("<td></td>").append(item.custIndustry);
            var custLevel = $("<td></td>").append(item.custLevel);
            var custPhone = $("<td></td>").append(item.custPhone);
            var custMobile = $("<td></td>").append(item.custMobile);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id", item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id", item.empId);
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

    /*条件查询*/
    //点击更新就跟新信息
    $("#searchCusts").click(function () {
        //发送ajax请求 保存信息
        $.ajax({
            url: "${App_Path}/customer/customers" ,
            type: "GET",
            data: $("#searchForm").serialize(),
            success: function (result) {
                //关闭模态框
                $("#emp_change").modal('hide');
                //回到本页面
                to_page(currentPage);
            }
        });

    });

    /* //清空新建客户窗口中的数据
     function clearCustomer() {
         $("#new_customerName").val("");
         $("#new_customerFrom").val("")
         $("#new_custIndustry").val("")
         $("#new_custLevel").val("")
         $("#new_linkMan").val("");
         $("#new_phone").val("");
         $("#new_mobile").val("");
         $("#new_zipcode").val("");
         $("#new_address").val("");
     }
     // 创建客户
     function createCustomer() {
         $.post("${App_Path}/customer/create.action",
            $("#new_customer_form").serialize(),function(data){
                if(data =="OK"){
                    alert("客户创建成功！");
                    window.location.reload();
                }else{
                    alert("客户创建失败！");
                    window.location.reload();
                }
            });
    }
    // 通过id获取修改的客户信息
    function editCustomer(id) {
        $.ajax({
            type:"get",
            url:"${App_Path}/customer/getCustomerById.action",
            data:{"id":id},
            success:function(data) {

                $("#edit_custUserId").val(data.custId);
                $("#edit_customerName").val(data.custName);
                $("#edit_customerFrom").val(data.custSource)
                $("#edit_custIndustry").val(data.custIndustry)
                $("#edit_custLevel").val(data.custLevel)
                $("#edit_linkMan").val(data.custLinkman);
                $("#edit_phone").val(data.custPhone);
                $("#edit_mobile").val(data.custMobile);
                $("#edit_zipcode").val(data.custZipcode);
                $("#edit_address").val(data.custAddress);

            }
        });
    }
    // 执行修改客户操作
    function updateCustomer() {
        $.post("${App_Path}/customer/update.action",$("#edit_customer_form").serialize(),function(data){
            if(data =="OK"){
                alert("客户信息更新成功！");
                window.location.reload();
            }else{
                alert("客户信息更新失败！");
                window.location.reload();
            }
        });
    }
    // 删除客户
    function deleteCustomer(id) {
        if(confirm('确实要删除该客户吗?')) {
            $.post("customer/delete.action",{"id":id},
                function(data){
                    if(data =="OK"){
                        alert("客户删除成功！");
                        window.location.reload();
                    }else{
                        alert("删除客户失败！");
                        window.location.reload();
                    }
                });
        }
    }*/
</script>
</body>
</html>
