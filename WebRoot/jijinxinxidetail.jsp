<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%
%>
<% HashMap map = Query.make("jijinxinxi").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<script src="js/jquery.validate.js"></script>


<div class="" style="">


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">

            <div class="col-sm-12 col-md-12">


                <div class="section-dianzi">
                    <div class="section_title">
                        <h2>
                            <span>详情</span>
                        </h2>
                    </div>
                    <div class="section_content">


                        <div class="">
                            <div class="goods-info clearfix">
                                <div class="gallery-list">
                                    <div class="swiper-container gallery-top" id="shangpin-galler">
                                        <div class="swiper-wrapper">
                                        </div>
                                    </div>
                                    <div class="swiper-container gallery-thumbs" id="shangpin-thumb">
                                        <div class="swiper-wrapper">
                                        </div>
                                    </div>
                                </div>
                                <div class="goods-right-content">
                                    <h3 class="title"><%= map.get("jijinmingcheng") %>
                                    </h3>
                                    <div class="descount">
                                        <div>
                        <span class="name">
                            基金代码：
                        </span>
                                            <span class="val">
                            <%= map.get("jijindaima") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            基金类型：
                        </span>
                                            <span class="val">
                            <%
                                HashMap mapjijinfenlei7 = new CommDAO().find("SELECT fenleimingcheng FROM jijinfenlei where id='" + map.get("jijinleixing") + "'");
                            %><%= mapjijinfenlei7.get("fenleimingcheng") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            风险类型：
                        </span>
                                            <span class="val">
                            <%= map.get("fengxianleixing") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            资产规模：
                        </span>
                                            <span class="val">
                            <%= map.get("zichanguimo") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            成立日期：
                        </span>
                                            <span class="val">
                            <%= map.get("chengliriqi") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            基金价格：
                        </span>
                                            <span class="val">
                            <%= map.get("jijinjiage") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            净值估算：
                        </span>
                                            <span class="val">
                            <%= map.get("jingzhigusuan") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            日涨幅度：
                        </span>
                                            <span class="val">
                            <%= map.get("rizhangfudu") %>                        </span>
                                        </div>
                                        <div>
                        <span class="name">
                            年长幅度：
                        </span>
                                            <span class="val">
                            <%= map.get("nianzhangfudu") %>                        </span>
                                        </div>
                                    </div>

                                    <% HashMap readMap = Query.make("jijinxinxi").where("id", request.getParameter("id")).find(); %>
                                    <form class="form-inline" action="gouwuche.jsp?a=insert" id="form1" method="post">
                                        <!-- form 标签开始 -->


                                        <div style="display: none">
                                            <input type="hidden" name="iszf" value="否"/>

                                            <input type="hidden" id="jijinbianhao" name="jijinbianhao"
                                                   value="<%= Info.html(map.get("jijinbianhao")) %>"/>
                                            <input type="hidden" id="jijinmingcheng" name="jijinmingcheng"
                                                   value="<%= Info.html(map.get("jijinmingcheng")) %>"/>
                                            <input type="hidden" id="jijindaima" name="jijindaima"
                                                   value="<%= Info.html(map.get("jijindaima")) %>"/>
                                            <input type="hidden" id="jijinleixing" name="jijinleixing"
                                                   value="<%= Info.html(map.get("jijinleixing")) %>"/>
                                            <input type="hidden" id="fengxianleixing" name="fengxianleixing"
                                                   value="<%= Info.html(map.get("fengxianleixing")) %>"/>
                                            <input type="hidden" id="jijinjiage" name="jijinjiage"
                                                   value="<%= Info.html(map.get("jijinjiage")) %>"/>
                                            <input type="text" class="form-control" style="width:150px;"
                                                   readonly="readonly" id="goumairen" name="goumairen"
                                                   value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                                            <input type="hidden" name="jijinxinxiid" value="<%= map.get("id") %>"/>
                                            <input name="referer" id="referer" value="" type="hidden"/>
                                            <script>
                                                $('#referer').val(location.href);
                                            </script>
                                        </div>

                                        <div class="mt10">
                                            <div class="spec-list">
                                            </div>

                                            <div class="mt10">
                                                <div class="form-group mt10">
                                                    买入支数：

                                                    <input type="number" class="form-control" style="width:150px;"
                                                           number="true" data-msg-number="输入一个有效数字" id="mairuzhishu"
                                                           name="mairuzhishu" value=""/>
                                                </div>
                                            </div>
                                            <div class="mt10">
                                                <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
                                                <button type="button" class="btn btn-primary"
                                                        onclick="alert('你尚未登录，请登录后操作')">
                                                    加入购物车
                                                </button>
                                                <% } else { %>
                                                <button type="submit" class="btn btn-primary">
                                                    加入购物车
                                                </button>
                                                <% } %>

                                                <button type="button" class="btn btn-default"
                                                        onclick="location.href='jrsc.jsp?id=<%= map.get("id") %>&biao=jijinxinxi&ziduan=jijinmingcheng'">
                                                    收藏
                                                </button>
                                            </div>
                                        </div>

                                        <!--form标签结束--></form>
                                    <script>
                                        $(function () {
                                            $('#form1').validate();
                                        })
                                    </script>
                                </div>
                            </div>
                            <div class="goods-content">
                                <%= map.get("xiangqing") %>
                            </div>

                            <script>
                                (function () {
                                    var images = "<%= map.get("tupian") %>".split(",");
                                    if (images.length > 0) {
                                        for (var i = 0; i < images.length; i++) {
                                            var path = images[i]
                                            var src = '<div class="swiper-slide"><div class="img-box pb100"><div class="img" style="background-image: url(' + path + ')"></div></div></div>';
                                            $('#shangpin-galler .swiper-wrapper').append(src);
                                            $('#shangpin-thumb .swiper-wrapper').append(src);
                                        }

                                        var thumbsSwiper = new Swiper('#shangpin-thumb', {
                                            spaceBetween: 10,
                                            slidesPerView: 4,
                                            watchSlidesVisibility: true,//防止不可点击
                                        })
                                        var gallerySwiper = new Swiper('#shangpin-galler', {
                                            spaceBetween: 10,
                                            thumbs: {
                                                swiper: thumbsSwiper,
                                            }
                                        })
                                    }

                                })();

                            </script>

                        </div>


                    </div>
                </div>


            </div>


        </div>

        <!-- container定宽，并剧中结束 --></div>


</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>