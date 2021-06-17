<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>



<div class="" style="" >

    

<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">
    
                        <div class="col-sm-12 col-md-12">
    
                

    

<div class="section-dianzi">
        <div class="section_title">
            <h2>
                <span>基金大厅</span>
            </h2>
        </div>
        <div class="section_content">
            

    

<div class="list-table">
        <% ArrayList<HashMap> jijinxinxilist14 = Query.make("jijinxinxi").limit(20).order("id desc").select(); %>
        

        <table width="100%" border="1" class="table table-list table-bordered table-hover">
            <thead>
            <tr align="center">
                                <th> 基金编号 </th>
<th> 基金名称 </th>
<th> 基金代码 </th>
<th> 基金类型 </th>
<th> 图片 </th>
<th> 风险类型 </th>
<th> 资产规模 </th>
<th> 成立日期 </th>
<th> 基金价格 </th>
<th> 净值估算 </th>
<th> 日涨幅度 </th>
<th> 年长幅度 </th>
<th> 发布人 </th>
                                                    <th width="80" align="center" bgcolor="CCFFFF">操作</th>
                            </tr>
            </thead>
            <tbody>

            <% 
                int i= 0;
                for(HashMap r:jijinxinxilist14){
                i++;
                 %>
            <tr>
                                <td> <%= r.get("jijinbianhao") %> </td>
<td> <%= r.get("jijinmingcheng") %> </td>
<td> <%= r.get("jijindaima") %> </td>
<td> <% 
 HashMap mapjijinfenlei16 = new CommDAO().find("SELECT fenleimingcheng FROM jijinfenlei where id='"+r.get("jijinleixing")+"'"); 
 %><%= mapjijinfenlei16.get("fenleimingcheng") %> </td>
<td> <% if( "".equals( r.get("tupian") ) ){ %>-<% } else { %><img width="100" src="<%= r.get("tupian") %>"/><% } %> </td>
<td> <%= r.get("fengxianleixing") %> </td>
<td> <%= r.get("zichanguimo") %> </td>
<td> <%= r.get("chengliriqi") %> </td>
<td> <%= r.get("jijinjiage") %> </td>
<td> <%= r.get("jingzhigusuan") %> </td>
<td> <%= r.get("rizhangfudu") %> </td>
<td> <%= r.get("nianzhangfudu") %> </td>
<td> <%= r.get("faburen") %> </td>

                
                                    <td align="center">
                        <a href="jijinxinxidetail.jsp?id=<%= r.get("id") %>">
                            详细
                        </a>
                    </td>
                            </tr>
            <% } %>

            </tbody>
        </table>
    </div>


    

        </div>
    </div>



            
</div>
                                    
                                            
</div>
    
<!-- container定宽，并剧中结束 --></div>



</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>