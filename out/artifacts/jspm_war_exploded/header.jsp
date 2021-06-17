<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>




    

<div class="header-box">
        <div class="header">
            <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                <div class="wrap-container">
                    <div class="rowContent clearfix">
                        <div class="logo">
                            <a href="/">网络基金商城系统</a>
                        </div>
                        <div class="header_menu">
                            <div class="header_posion">
                                <div class="header-tou">
                                    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
                                    <form class="form-inline" action="login?ac=login&a=a" method="post"><!-- form 标签开始 -->
    
                                        <div class="form-group">
    用户名：
    
                                            <input type="text" class="form-control" style="width: 100px" name="username"/>
                                        
</div>
                                        <div class="form-group">
    密码：
    
                                            <input type="password" class="form-control" style="width: 100px" name="pwd"/>
                                        
</div>
                                        <div class="form-group">
    权限：
    
                                            <select class="form-control" name="cx" style="width:120px;" id="cx">

                                                <option value="用户">用户</option>                                            
</select>
                                        
</div>
                                        <div class="form-group">
    验证码
    
                                            <div class="input-group" style="width: 150px">
    
                                                <input type="text" class="form-control" name="pagerandom"/>
                                                
                                            
    <span class="input-group-addon"><img src="image.jsp" style="width: 60px;height: 20px;max-width: none; max-height: none;" onclick="this.src='image.jsp?rand='+new Date().getTime()"/></span>
</div>
                                        
</div>
                                        <div class="form-group">
    
    
                                            <button type="submit" class="btn btn-primary">
    登录
</button>
                                                                                    
</div>
                                    
<!--form标签结束--></form>
                                    <% } else { %>
                                    用户名:<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>；
                                    您的权限: <%= request.getSession().getAttribute("cx") !=null ? request.getSession().getAttribute("cx") : "" %>
                                    <a class="btn btn-danger btn-sm" href="logout.jsp">
                                        退出
                                    </a>
                                    <a class="btn btn-success btn-sm" href="main.jsp">个人主页</a>
                                    <% } %>
                                    <a href="javascript:;" style="margin-right: 10px"> 
                                    </a>
                                </div>
                                <div class="row_menu">
                                    <div class="clearfix">
                                        <ul class="menu" id="js_menu">
                                            <li class="xinsuo_menu">
<a href="./">主页</a>
</li>
<li class="xinsuo_menu">
<a href="jijinxinxilist.jsp">基金</a>
<div class="childmenu">
<% 
 List<HashMap> mapjijinfenlei1 = new CommDAO().select("SELECT id,fenleimingcheng FROM jijinfenlei"); 
 %>
<%  for(HashMap m:mapjijinfenlei1){  %>
<a href="jijinxinxilist.jsp?jijinleixing=<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></a>
<% } %>
</div>
</li>
<li class="xinsuo_menu">
<a href="yonghuadd.jsp">注册</a>
</li>
<li class="xinsuo_menu">
<a href="login.jsp">后台</a>
</li>                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            
<!-- container定宽，并剧中结束 --></div>
            <script>
                $(function(){
                    $('#js_menu .xinsuo_menu').hover(function(){
                        $(this).find('.childmenu').show();
                        $(this).data('nones' , null);
                    } , function(){
                        var that = this;
                        $(this).data('nones' , true);
                        setTimeout(function(){
                            if($(that).data('nones')){
                                $(that).find('.childmenu').hide();
                            }
                        } , 300);
                    });
                });
            </script>
        </div>

    </div>



