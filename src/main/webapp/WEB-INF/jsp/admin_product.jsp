<%-- 
    Document   : admin_product
    Created on : Aug 6, 2016, 3:44:36 PM
    Author     : PRASAD
--%>

<%@page import="in.sc.admin.ApplicationUtils"%>
<%@page import="in.sc.bean.ReviewBean"%>
<%@page import="java.util.LinkedList"%>
<%@page import="in.sc.bean.ProductBean"%>
<%@page import="in.sc.download.DBManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <link href="${pageContext.request.contextPath}/res/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/res/css/modern-business.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="${pageContext.request.contextPath}/res/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <style>
            .row-eq-height{
                margin-top:10px;
                padding: 20px;
                outline: 2px solid #ccc;
                outline-offset: -10px;
                -moz-outline-radius: 10px;
                -webkit-outline-radius: 10px;
            }
        </style>
    </head>
    <%
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        LinkedList<ProductBean> pList = new LinkedList();
        HashMap bMap = new HashMap();
        try {
            con = DBManager.getConnetion();
            sql.append(" select sp.PRODUCT_ID,P_name,b_name,p_desc,ppm.points_src,points_url,points1,points2,points3,points4,points5 from product_details_sp sp inner join product_feature_map_sp fsp on sp.PRODUCT_ID=fsp.product_id "
                    + " left outer join product_points_map ppm on sp.PRODUCT_ID=ppm.product_id "
                    + " inner join brand_details b on sp.BRAND_ID=b.BRAND_ID ");
            stmt = con.prepareStatement(sql.toString());
            rs = stmt.executeQuery();
            while (rs.next()) {
                ProductBean pb = new ProductBean();
                ReviewBean rb = new ReviewBean();
                pb.setProductId(rs.getInt("PRODUCT_ID"));
                pb.setProductName(rs.getString("P_name"));
                pb.setBrandName(rs.getString("b_name"));
                pb.setPdesc(rs.getString("p_desc"));
                rb.setPoints1(rs.getInt("points1"));
                rb.setPoints2(rs.getInt("points2"));
                rb.setPoints3(rs.getInt("points3"));
                rb.setPoints4(rs.getInt("points4"));
                rb.setPoints5(rs.getInt("points5"));
                rb.setPointsSrc(rs.getString("points_src"));
                rb.setPointsUrl(rs.getString("points_url"));
                pb.setRbean(rb);
                pList.add(pb);
            }
            sql = new StringBuilder();
            sql.append("select points_id,points_name from cat_points");
            stmt = con.prepareStatement(sql.toString());
            rs = stmt.executeQuery();
            while (rs.next()) {
                bMap.put(rs.getInt("points_id"), rs.getString("points_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }


    %>
    <body>
        <div class="container">
            <%                if (pList.size() > 0) {
                    for (ProductBean pb : pList) {
                        ReviewBean rb = pb.getRbean();
            %>
            <div class="row row-eq-height" id="row-<%=pb.getProductId()%>">
                <div class="col-lg-3"><%=pb.getProductName()%></div>
                <div class="col-lg-1"><%=pb.getBrandName()%></div>
                <div class="col-lg-1"> 
                    <div class="form-group">
                        <label for="points1"><%=bMap.get(1)%></label>
                        <input type="text" class="form-control" value="<%=ApplicationUtils.printIfBlank(rb.getPoints1())%>" id="<%=pb.getProductId()%>-points1" name="<%=pb.getProductId()%>-points1">
                    </div>
                </div>
                <div class="col-lg-1"> 
                    <div class="form-group">
                        <label for="points2"><%=bMap.get(2)%></label>
                        <input type="text" class="form-control" value="<%=ApplicationUtils.printIfBlank(rb.getPoints2())%>" id="<%=pb.getProductId()%>-points2" name="<%=pb.getProductId()%>-points2">
                    </div>
                </div>
                <div class="col-lg-1"> 
                    <div class="form-group">
                        <label for="points3"><%=bMap.get(3)%></label>
                        <input type="text" class="form-control" value="<%=ApplicationUtils.printIfBlank(rb.getPoints3())%>" id="<%=pb.getProductId()%>-points3" name="<%=pb.getProductId()%>-points3">
                    </div>
                </div>
                <div class="col-lg-1"> 
                    <div class="form-group">
                        <label for="points4"><%=bMap.get(4)%></label>
                        <input type="text" class="form-control" value="<%=ApplicationUtils.printIfBlank(rb.getPoints4())%>" id="<%=pb.getProductId()%>-points4" name="<%=pb.getProductId()%>-points4">
                    </div>
                </div>
                <div class="col-lg-1"> 
                    <div class="form-group">
                        <label for="points5"><%=bMap.get(5)%></label>
                        <input type="text" class="form-control" value="<%=ApplicationUtils.printIfBlank(rb.getPoints5())%>" id="<%=pb.getProductId()%>-points5" name="<%=pb.getProductId()%>-points5">
                    </div>
                </div>
                <div class="col-lg-1"> 
                    <div class="form-group">
                        <label for="src">Points Source</label>
                        <input type="text" class="form-control" value="<%=ApplicationUtils.printIfBlank(rb.getPointsSrc())%>" id="<%=pb.getProductId()%>-src" name="<%=pb.getProductId()%>-src">
                    </div>
                </div>
                <div class="col-lg-1"> 
                    <div class="form-group">
                        <label for="srcUrl">Source URL</label>
                        <input type="text" class="form-control" value="<%=ApplicationUtils.printIfBlank(rb.getPointsUrl())%>" id="<%=pb.getProductId()%>-srcUrl" name="<%=pb.getProductId()%>-srcUrl">
                    </div>
                </div>
                <button type="submit" class="btn btn-default" onclick="submitPoints(<%=pb.getProductId()%>)">Submit</button>
                <div id="div-<%=pb.getProductId()%>"></div>
            </div>
            <% }
                }
            %>

        </div>
        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/res/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
        <script>
                    function submitPoints(productId) {
                        var points1 = $("#" + productId + "-points1").val();
                        var points2 = $("#" + productId + "-points2").val();
                        var points3 = $("#" + productId + "-points3").val();
                        var points4 = $("#" + productId + "-points4").val();
                        var points5 = $("#" + productId + "-points5").val();
                        var src = $("#" + productId + "-src").val();
                        var srcUrl = $("#" + productId + "-srcUrl").val();
                        $.ajax({
                            type: "POST",
                            url: "post_points",
                            data: {
                                product: productId,
                                p1: points1,
                                p2: points2,
                                p3: points3,
                                p4: points4,
                                points5: points5,
                                s: src,
                                sUrl: srcUrl,
                            },
                            success: function (msg) {
                                $("#div-" + productId).html(msg);
                                $('html, body').animate({scrollTop: $('#row-' + productId).offset().top}, 'slow', function () {
                                    $('#row-' + productId).remove();
                                });
                            },
                            error: function () {
                                alert("failure");
                            }
                        });
                    }
        </script>
    </body>
</html>
