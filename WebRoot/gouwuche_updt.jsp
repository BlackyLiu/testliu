<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">


    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <%
        return;
    } %>


<%
        // 获取需要编辑的数据
    String updtself="0"; // 设置更新
    HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "gouwuche");
    %>








<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            编辑购物车:
        </div>
        <div class="panel-body">
            <form action="gouwuche.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金编号</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("jijinbianhao") %><input type="hidden" id="jijinbianhao" name="jijinbianhao" value="<%= Info.html(mmm.get("jijinbianhao")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金名称</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("jijinmingcheng") %><input type="hidden" id="jijinmingcheng" name="jijinmingcheng" value="<%= Info.html(mmm.get("jijinmingcheng")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金代码</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("jijindaima") %><input type="hidden" id="jijindaima" name="jijindaima" value="<%= Info.html(mmm.get("jijindaima")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金类型</label>
        <div class="col-sm-8">
            
                                                    <% 
 HashMap mapjijinfenlei14 = new CommDAO().find("SELECT fenleimingcheng FROM jijinfenlei where id='"+mmm.get("jijinleixing")+"'"); 
 %><%= mapjijinfenlei14.get("fenleimingcheng") %><input type="hidden" id="jijinleixing" name="jijinleixing" value="<%= Info.html(mmm.get("jijinleixing")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">风险类型</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("fengxianleixing") %><input type="hidden" id="fengxianleixing" name="fengxianleixing" value="<%= Info.html(mmm.get("fengxianleixing")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金价格</label>
        <div class="col-sm-8">
            
                                                    <%= mmm.get("jijinjiage") %><input type="hidden" id="jijinjiage" name="jijinjiage" value="<%= Info.html(mmm.get("jijinjiage")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">买入支数</label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" number="true" data-msg-number="输入一个有效数字" id="mairuzhishu" name="mairuzhishu" value="<%= Info.html(mmm.get("mairuzhishu")) %>"/>                                            
        </div>
    </div>
</div>
                                                                            <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">购买人</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="goumairen" name="goumairen" value="<%= mmm.get("goumairen") %>"/>                                            
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                            <input name="id" value="<%= mmm.get("id") %>" type="hidden"/>
                                                <input name="jijinxinxiid" value="<%= mmm.get("jijinxinxiid") %>" type="hidden"/>
                                                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                        <input name="updtself" value="<%= updtself %>" type="hidden"/>
                                        
                    
                    <button type="submit" class="btn btn-primary" name="Submit">
    提交
</button>
                    <button type="reset" class="btn btn-default" name="Submit2">
    重置
</button>

                
        </div>
    </div>
</div>
            
<!--form标签结束--></form>
        </div>
    </div>

<!-- container定宽，并剧中结束 --></div>





<script>
    $(function () {
        $('#form1').validate();
    });
</script>



</div>
<%@ include file="foot.jsp" %>
