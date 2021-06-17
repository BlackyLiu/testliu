<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>

<div style="padding: 10px">
    <%
        //------------------------------------------------
        String orderby = util.Request.get("order", "id");  // 获取搜索框中的排序字段、默认为发布时间
        String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序

        String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误


// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


        if (request.getParameter("jijinbianhao") != null && !"".equals(request.getParameter("jijinbianhao"))) {
            where += " AND jijinbianhao LIKE '%" + request.getParameter("jijinbianhao") + "%'";
        }
        if (request.getParameter("jijinmingcheng") != null && !"".equals(request.getParameter("jijinmingcheng"))) {
            where += " AND jijinmingcheng LIKE '%" + request.getParameter("jijinmingcheng") + "%'";
        }
        if (request.getParameter("jijindaima") != null && !"".equals(request.getParameter("jijindaima"))) {
            where += " AND jijindaima LIKE '%" + request.getParameter("jijindaima") + "%'";
        }
        if (request.getParameter("jijinleixing") != null && !"".equals(request.getParameter("jijinleixing"))) {
            where += " AND jijinleixing ='" + request.getParameter("jijinleixing") + "'";
        }
        if (request.getParameter("fengxianleixing") != null && !"".equals(request.getParameter("fengxianleixing"))) {
            where += " AND fengxianleixing ='" + request.getParameter("fengxianleixing") + "'";
        }

        List<HashMap> list = Query.make("jijinxinxi").where(where).order(orderby + " " + sort).page(15);

    %>


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            基金信息        </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" action="?"><!-- form 标签开始 -->

                    <div class="form-group">


                        <i class="glyphicon glyphicon-search"></i>

                    </div>


                    <div class="form-group">
                        基金编号

                        <input type="text" class="form-control" style="" name="jijinbianhao"
                               value="<%= request.getParameter("jijinbianhao") !=null ? request.getParameter("jijinbianhao") : "" %>"/>
                    </div>
                    <div class="form-group">
                        基金名称

                        <input type="text" class="form-control" style="" name="jijinmingcheng"
                               value="<%= request.getParameter("jijinmingcheng") !=null ? request.getParameter("jijinmingcheng") : "" %>"/>
                    </div>
                    <div class="form-group">
                        基金代码

                        <input type="text" class="form-control" style="" name="jijindaima"
                               value="<%= request.getParameter("jijindaima") !=null ? request.getParameter("jijindaima") : "" %>"/>
                    </div>
                    <div class="form-group">
                        基金类型

                        <select class="form-control class_jijinleixing6"
                                data-value="<%= request.getParameter("jijinleixing") !=null ? request.getParameter("jijinleixing") : "" %>"
                                id="jijinleixing" name="jijinleixing">
                            <option value="">请选择</option>
                            <%
                                List<HashMap> select = new CommDAO().select("SELECT * FROM jijinfenlei ORDER BY id desc");
                            %>
                            <% for (HashMap m : select) { %>
                            <option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %>
                            </option>
                            <% } %>

                        </select>
                        <script>
                            $(".class_jijinleixing6").val($(".class_jijinleixing6").attr("data-value"))</script>

                    </div>
                    <div class="form-group">
                        风险类型

                        <select class="form-control class_fengxianleixing7"
                                data-value="<%= request.getParameter("fengxianleixing") !=null ? request.getParameter("fengxianleixing") : "" %>"
                                id="fengxianleixing" name="fengxianleixing">
                            <option value="">请选择</option>
                            <option value="低风险">低风险</option>
                            <option value="中低风险">中低风险</option>
                            <option value="中高风险">中高风险</option>
                            <option value="高风险">高风险</option>

                        </select>
                        <script>
                            $(".class_fengxianleixing7").val($(".class_fengxianleixing7").attr("data-value"))</script>

                    </div>
                    <select class="form-control" name="order" id="orderby">

                        <option value="id">按发布时间</option>

                    </select>
                    <select class="form-control" name="sort" id="sort">

                        <option value="desc">倒序</option>
                        <option value="asc">升序</option>

                    </select>
                    <script>$("#orderby").val("<%= orderby %>");
                    $("#sort").val("<%= sort %>");</script>
                    <button type="submit" class="btn btn-default">
                        搜索
                    </button>


                    <!--form标签结束--></form>
            </div>


            <div class="">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th> 基金编号</th>
                        <th> 基金名称</th>
                        <th> 基金代码</th>
                        <th> 基金类型</th>
                        <th> 图片</th>
                        <th> 风险类型</th>
                        <th> 资产规模</th>
                        <th> 成立日期</th>
                        <th> 基金价格</th>
                        <th> 净值估算</th>
                        <th> 日涨幅度</th>
                        <th> 年长幅度</th>
                        <th> 发布人</th>
                        <th width="180" data-field="addtime">添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int i = 0;
                        for (HashMap map : list) {
                            i++;
                    %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label>
                                <%= i %>
                            </label>
                        </td>
                        <td><%= map.get("jijinbianhao") %>
                        </td>
                        <td><%= map.get("jijinmingcheng") %>
                        </td>
                        <td><%= map.get("jijindaima") %>
                        </td>
                        <td><%
                            HashMap mapjijinfenlei2 = new CommDAO().find("SELECT fenleimingcheng FROM jijinfenlei where id='" + map.get("jijinleixing") + "'");
                        %><%= mapjijinfenlei2.get("fenleimingcheng") %>
                        </td>
                        <td><% if ("".equals(map.get("tupian"))) { %>-<% } else { %><img width="100"
                                                                                         src="<%= map.get("tupian") %>"/><% } %>
                        </td>
                        <td><%= map.get("fengxianleixing") %>
                        </td>
                        <td><%= map.get("zichanguimo") %>
                        </td>
                        <td><%= map.get("chengliriqi") %>
                        </td>
                        <td><%= map.get("jijinjiage") %>
                        </td>
                        <td><%= map.get("jingzhigusuan") %>
                        </td>
                        <td><%= map.get("rizhangfudu") %>
                        </td>
                        <td><%= map.get("nianzhangfudu") %>
                        </td>
                        <td><%= map.get("faburen") %>
                        </td>
                        <td align="center"><%= map.get("addtime") %>
                        </td>
                        <td align="center">



                            <a href="jijinxinxi_detail.jsp?id=<%= map.get("id") %>
                                    详细
                                </a>" class="btn btn-xs btn-info">详情</a>
                            <a href="jijinxinxi_updt.jsp?id=<%= map.get("id") %>" class="btn btn-xs btn-success">编辑</a>
                            <a href="jijinxinxi.jsp?a=delete&id=<%= map.get("id") %>" class="btn btn-xs btn-danger"
                               onclick="return confirm('确定要删除？')">删除</a>
                            <!--qiatnalijne-->
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            ${page.info}
        </div>


    </div>


</div>
<%@ include file="foot.jsp" %>
