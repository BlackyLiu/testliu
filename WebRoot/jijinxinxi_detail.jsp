<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">

<% HashMap map = Query.make("jijinxinxi").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                基金编号            </td>
            <td><%= map.get("jijinbianhao") %></td>
            
                                    <td width="180">
                基金名称            </td>
            <td><%= map.get("jijinmingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                基金代码            </td>
            <td><%= map.get("jijindaima") %></td>
            
                                    <td width="180">
                基金类型            </td>
            <td><% 
 HashMap mapjijinfenlei6 = new CommDAO().find("SELECT fenleimingcheng FROM jijinfenlei where id='"+map.get("jijinleixing")+"'"); 
 %><%= mapjijinfenlei6.get("fenleimingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                图片            </td>
            <td><img src="<%= map.get("tupian") %>" style="width: 350px"/></td>
            
                                    <td width="180">
                风险类型            </td>
            <td><%= map.get("fengxianleixing") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                资产规模            </td>
            <td><%= map.get("zichanguimo") %></td>
            
                                    <td width="180">
                成立日期            </td>
            <td><%= map.get("chengliriqi") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                基金价格            </td>
            <td><%= map.get("jijinjiage") %></td>
            
                                    <td width="180">
                净值估算            </td>
            <td><%= map.get("jingzhigusuan") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                日涨幅度            </td>
            <td><%= map.get("rizhangfudu") %></td>
            
                                    <td width="180">
                年长幅度            </td>
            <td><%= map.get("nianzhangfudu") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                发布人            </td>
            <td><%= map.get("faburen") %></td>
            
                                    <td width="180">
                详情            </td>
            <td><%= map.get("xiangqing") %></td>
                    </tr>
        <tr>
            
                    </tr>
    </table>
</div>


<div class="button-list">
    <div class="">
        <button onclick="history.go(-1);"
                style="background: #07de19; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">返回
        </button>
        <button onclick="window.print()"
                style="background: #4961de; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">打印本页
        </button>
    </div>
</div>
</div>
<%@ include file="foot.jsp" %>
