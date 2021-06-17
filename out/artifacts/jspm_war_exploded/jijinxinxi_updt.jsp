<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>

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
    HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "jijinxinxi");
    %>








<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            编辑基金信息:
        </div>
        <div class="panel-body">
            <form action="jijinxinxi.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金编号<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写基金编号" remote="factory/checkno.jsp?checktype=update&id=<%= mmm.get("id") %>&table=jijinxinxi&col=jijinbianhao" data-msg-remote="内容重复了" id="jijinbianhao" name="jijinbianhao" value="<%= Info.html(mmm.get("jijinbianhao")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金名称</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:250px;" id="jijinmingcheng" name="jijinmingcheng" value="<%= Info.html(mmm.get("jijinmingcheng")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金代码</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" id="jijindaima" name="jijindaima" value="<%= Info.html(mmm.get("jijindaima")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金类型</label>
        <div class="col-sm-8">
            
                                                    <select class="form-control class_jijinleixing12" data-value="<%= Info.html(mmm.get("jijinleixing")) %>" id="jijinleixing" name="jijinleixing" style="width:250px">
<% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM jijinfenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
<% } %>

</select>
<script>
$(".class_jijinleixing12").val($(".class_jijinleixing12").attr("data-value"))</script>
                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">图片</label>
        <div class="col-sm-8">
            
                                                    <div class="input-group" style="width:250px">
    <input type="text" class="form-control" id="tupian" name="tupian" value="<%= Info.html(mmm.get("tupian")) %>"/>

    <span class="input-group-btn"><button type="button" class="btn btn-default" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=tupian'})">
    上传图片
</button></span>
</div>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">风险类型</label>
        <div class="col-sm-8">
            
                                                    <select class="form-control class_fengxianleixing13" data-value="<%= Info.html(mmm.get("fengxianleixing")) %>" id="fengxianleixing" name="fengxianleixing" style="width:250px">
<option value="低风险">低风险</option>
<option value="中低风险">中低风险</option>
<option value="中高风险">中高风险</option>
<option value="高风险">高风险</option>

</select>
<script>
$(".class_fengxianleixing13").val($(".class_fengxianleixing13").attr("data-value"))</script>
                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">资产规模</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" id="zichanguimo" name="zichanguimo" value="<%= Info.html(mmm.get("zichanguimo")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">成立日期</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" style="width:120px;" id="chengliriqi" name="chengliriqi" readonly="readonly" value="<%= Info.html(mmm.get("chengliriqi")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">基金价格</label>
        <div class="col-sm-8">
            
                                                    <input type="number" class="form-control" style="width:150px;" step="0.01" number="true" data-msg-number="输入一个有效数字" id="jijinjiage" name="jijinjiage" value="<%= Info.html(mmm.get("jijinjiage")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">净值估算</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" id="jingzhigusuan" name="jingzhigusuan" value="<%= Info.html(mmm.get("jingzhigusuan")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">日涨幅度</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" id="rizhangfudu" name="rizhangfudu" value="<%= Info.html(mmm.get("rizhangfudu")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">年长幅度</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" id="nianzhangfudu" name="nianzhangfudu" value="<%= Info.html(mmm.get("nianzhangfudu")) %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">发布人</label>
        <div class="col-sm-8">
            
                                                    <input type="text" class="form-control" style="width:150px;" readonly="readonly" id="faburen" name="faburen" value="<%= mmm.get("faburen") %>"/>                                            
        </div>
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">详情</label>
        <div class="col-sm-8">
            
                                                    <textarea id="xiangqing" name="xiangqing" style="max-width: 750px;width:100%; height: 300px;"><%= Info.html(mmm.get("xiangqing")) %></textarea><script>
            (function(){
                var um = UM.getEditor('xiangqing');
            })();
            </script>                                            
        </div>
    </div>
</div>
                                <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            
                                            <input name="id" value="<%= mmm.get("id") %>" type="hidden"/>
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
