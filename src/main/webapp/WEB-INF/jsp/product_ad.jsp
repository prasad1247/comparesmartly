<%-- 
    Document   : product_ad
    Created on : Aug 26, 2016, 10:08:59 PM
    Author     : Asus
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.sc.download.DBManager"%>
<%@page import="in.sc.bean.ReviewBean"%>
<%@page import="in.sc.bean.ProductBean"%>
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
        <h1>Hello World!</h1>
    </body>
</html>
