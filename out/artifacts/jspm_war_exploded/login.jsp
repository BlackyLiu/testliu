<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>网络基金商城系统-后台登录</title>

    <!-- Bootstrap core CSS -->
    <link href="htstyle/css/bootstrap.min.css" rel="stylesheet">
    <link href="htstyle/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="htstyle/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="htstyle/css/style.css" rel="stylesheet">

</head>

  <body class="login-body">

    <div class="container">

      <form class="form-signin" action="login?ac=adminlogin&a=a" method="post">
        <h2 class="form-signin-heading">网络基金商城系统</h2>
        <div class="login-wrap">
            <input type="text" name="username" class="form-control" placeholder="账号" autofocus>
            <input type="password" name="pwd" class="form-control" placeholder="密码">
            <div class="form-group">
                <input type="text" name="pagerandom" placeholder="验证码" class="form-control border-0 shadow form-control-lg text-violet"
                       style="width: 180px;display: inline-block"/>
                <img alt="刷新验证码" title="点击刷新验证码"
                     onClick="this.src='image.jsp?time='+new Date().getTime();"
                     src="image.jsp"
                     style="cursor:pointer; padding-top:10px;width: 60px;height: 22px;float: right">
            </div>
            <select name="cx" class="form-control" style="padding: 5px 10px;margin-bottom: 20px">
                <option value="管理员">管理员</option>            </select>
            <button class="btn btn-lg btn-login btn-block m-bot15" type="submit">登录系统</button>
        </div>
      </form>
    </div>


  </body>
</html>
