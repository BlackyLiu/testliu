<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


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


<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>


<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="section-dianzi">
                    <div class="section_title">
                        <h2>
                            <span>列表</span>
                        </h2>
                    </div>
                    <div class="section_content">

                        <div class="pa10 bg-warning">
                            <form class="form-inline" action="?"><!-- form 标签开始 -->

                                <div class="form-group">


                                    <i class="glyphicon glyphicon-search"></i>

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
                        <div class="list-table">


                            <table width="100%" border="1" class="table table-list table-bordered table-hover">
                                <thead>
                                <tr align="center">
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
                                    <th width="80" align="center" bgcolor="CCFFFF">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <%
                                    int i = 0;
                                    for (HashMap r : list) {
                                        i++;
                                %>
                                <tr>
                                    <td><%= r.get("jijinbianhao") %>
                                    </td>
                                    <td><%= r.get("jijinmingcheng") %>
                                    </td>
                                    <td><%= r.get("jijindaima") %>
                                    </td>
                                    <td><%
                                        HashMap mapjijinfenlei4 = new CommDAO().find("SELECT fenleimingcheng FROM jijinfenlei where id='" + r.get("jijinleixing") + "'");
                                    %><%= mapjijinfenlei4.get("fenleimingcheng") %>
                                    </td>
                                    <td><% if ("".equals(r.get("tupian"))) { %>-<% } else { %><img width="100"
                                                                                                   src="<%= r.get("tupian") %>"/><% } %>
                                    </td>
                                    <td><%= r.get("fengxianleixing") %>
                                    </td>
                                    <td><%= r.get("zichanguimo") %>
                                    </td>
                                    <td><%= r.get("chengliriqi") %>
                                    </td>
                                    <td><%= r.get("jijinjiage") %>
                                    </td>
                                    <td><%= r.get("jingzhigusuan") %>
                                    </td>
                                    <td><%= r.get("rizhangfudu") %>
                                    </td>
                                    <td><%= r.get("nianzhangfudu") %>
                                    </td>
                                    <td><%= r.get("faburen") %>
                                    </td>


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


                        ${page.info}


                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>