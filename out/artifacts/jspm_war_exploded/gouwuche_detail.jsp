<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px">
                            
<% HashMap map = Query.make("gouwuche").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
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
 HashMap mapjijinfenlei12 = new CommDAO().find("SELECT fenleimingcheng FROM jijinfenlei where id='"+map.get("jijinleixing")+"'"); 
 %><%= mapjijinfenlei12.get("fenleimingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                风险类型            </td>
            <td><%= map.get("fengxianleixing") %></td>
            
                                    <td width="180">
                基金价格            </td>
            <td><%= map.get("jijinjiage") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                买入支数            </td>
            <td><%= map.get("mairuzhishu") %></td>
            
                                    <td width="180">
                小计            </td>
            <td><%= map.get("xiaoji") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                购买人            </td>
            <td><%= map.get("goumairen") %></td>
            
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
