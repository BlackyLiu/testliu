<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<%
if((String)request.getSession().getAttribute("username")==null || "".equals( request.getSession().getAttribute("username") ))
{
	out.print("<script>javascript:alert('对不起，您已超时或未登陆！');window.history.go(-1);</script>");
	return;
}
%><%@ include file="head.jsp" %><%@ include file="header.jsp" %><script src="js/jquery.validate.js"></script>







    
    <% if( null == request.getParameter("id") || "".equals( request.getParameter("id") ) ){ %>        <script>
            alert('非法操作');
            history.go(-1);
        </script>
    <% out.close(); %>
    <% } %>        <% HashMap readMap = Query.make("jijinxinxi").where("id", request.getParameter("id")).find(); %>





<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            添加购物车:
        </div>
        <div class="panel-body">
            <form action="gouwuche.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金编号</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("jijinbianhao") %><input type="hidden" id="jijinbianhao" name="jijinbianhao" value="<%= Info.html(readMap.get("jijinbianhao")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金名称</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("jijinmingcheng") %><input type="hidden" id="jijinmingcheng" name="jijinmingcheng" value="<%= Info.html(readMap.get("jijinmingcheng")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金代码</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("jijindaima") %><input type="hidden" id="jijindaima" name="jijindaima" value="<%= Info.html(readMap.get("jijindaima")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金类型</label>
        <div class="col-sm-8">
            
                                                    <% 
 HashMap mapjijinfenlei15 = new CommDAO().find("SELECT fenleimingcheng FROM jijinfenlei where id='"+readMap.get("jijinleixing")+"'"); 
 %><%= mapjijinfenlei15.get("fenleimingcheng") %><input type="hidden" id="jijinleixing" name="jijinleixing" value="<%= Info.html(readMap.get("jijinleixing")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">风险类型</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("fengxianleixing") %><input type="hidden" id="fengxianleixing" name="fengxianleixing" value="<%= Info.html(readMap.get("fengxianleixing")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金价格</label>
        <div class="col-sm-8">
            
                                                    <%= readMap.get("jijinjiage") %><input type="hidden" id="jijinjiage" name="jijinjiage" value="<%= Info.html(readMap.get("jijinjiage")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">买入支数</label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" number="true" data-msg-number="输入一个有效数字" id="mairuzhishu" name="mairuzhishu" value=""/>                                            
        </div>
    </div>
</div>
                                                                            <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">购买人</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="goumairen" name="goumairen" value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>                                            
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                                                <input type="hidden" name="jijinxinxiid" value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>
                        <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                    
                                                                                                                        <input type="hidden" name="iszf" value="否"/>
                                            
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




<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>