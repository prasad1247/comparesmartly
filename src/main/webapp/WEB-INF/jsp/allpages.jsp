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
        LinkedList<ProductBean> catList = new LinkedList();
        HashMap bMap = new HashMap();
        try {
            con = DBManager.getConnetion();
            sql.append(" select * from brand_details b,cat_brand_map cb where b.brand_id=cb.brand_id and cb.cat_id=137 and cb_desc is null limit 2,2");
            stmt = con.prepareStatement(sql.toString());
            rs = stmt.executeQuery();
            while (rs.next()) {
                ProductBean pb = new ProductBean();
                pb.setBrandId(rs.getInt("brand_id"));
                pb.setBrandName(rs.getString("b.b_name"));
                pb.setBrandCatDesc(rs.getString("cb_desc"));
                pList.add(pb);
            }
            sql = new StringBuilder();
            sql.append(" select * from cat_lists where cat_id=137 ");
            stmt = con.prepareStatement(sql.toString());
            rs = stmt.executeQuery();
            while (rs.next()) {
                ProductBean pb = new ProductBean();
                pb.setUrl(rs.getString("list_url"));
                pb.setProductName(rs.getString("list_name"));
                pb.setPdesc(rs.getString("list_desc"));
                pb.setProductId(rs.getInt("cl_id"));
                catList.add(pb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }


    %>
    <body>
        <div class="container-fluid">
            <%                if (pList.size() > 0) {
                    for (ProductBean pb : pList) {
                        ReviewBean rb = pb.getRbean();
            %>
            <div class="row row-eq-height" id="row-<%=pb.getProductId()%>">
                <div class="col-lg-4"><%="phones/best-" + pb.getBrandName() + "-phones-in-india"%></div>
                <div class="col-lg-8">               
                    <form action="" method="post" name="mainC<%=pb.getBrandId()%>" id="mainC<%=pb.getBrandId()%>">
                        <input type="hidden" name="cat_id" id="cat_id" value="137">
                        <input type="hidden" name="brandName" id="brandName" value="<%=pb.getBrandName()%>">
                        <input type="hidden" name="cl_id" id="cl_id" value="<%=0%>">
                        <input type="hidden" name="product_id" id="product_id" value="<%=0%>">
                        <input type="hidden" name="type" id="type" value="list">
                        <textarea class="desc" id="htmldesc" name="htmldesc" onclick="opendivform('mainC<%=pb.getBrandId()%>')"><%=pb.getBrandCatDesc()%></textarea>
                        <button type="button" class="btn btn-default" onclick="save('mainC<%=pb.getBrandId()%>')">SET</button> 
                      <!--  <input type="button" class="btn btn-primary" value="close" onclick="closeTinyMce('mainC<%=pb.getBrandId()%>')" >-->
                    </form>

                </div> 
            </div>
            <% }
                }
            %>
            <%                if (catList.size() > 0) {
                    for (ProductBean pb : catList) {

            %>
            <div class="row row-eq-height" id="row-<%=pb.getProductId()%>">
                <div class="col-lg-4"><a href="phones/<%=pb.getUrl()%>"><%=pb.getProductName()%></a></div>
                <div class="col-lg-8">               
                    <form action="" method="post" name="mainC<%=pb.getProductId()%>" id="mainC<%=pb.getProductId()%>">
                        <input type="hidden" name="cat_id" id="cat_id" value="137">
                        <input type="hidden" name="brandName" id="brandName" value="">
                        <input type="hidden" name="cl_id" id="cl_id" value="<%=pb.getProductId()%>">
                        <input type="hidden" name="product_id" id="product_id" value="<%=0%>">
                        <input type="hidden" name="type" id="type" value="list">
                        <textarea class="desc" id="htmldesc" name="htmldesc" onclick="opendivform('mainC<%=pb.getProductId()%>')"><%=pb.getPdesc()%></textarea>
                        <button type="button" class="btn btn-default" onclick="save('mainC<%=pb.getProductId()%>')">SET</button> 
                    <!--    <input type="button" class="btn btn-primary" value="close" onclick="closeTinyMce('mainC<%=pb.getProductId()%>')" > -->
                    </form>

                </div> 
            </div>
            <% }
                }
            %>

            <div class="row row-eq-height">
                <div class="col-lg-6">
                    <form action="${pageContext.request.contextPath}/createList" method="post" name="insrtCat" id="insrtCat">
                        <div class="row">   
                            <div class="col-lg-6">
                                <div class="form-group">   <label for="min_price">cat_id</label>      <input type="text" class="form-control" name="cat_id" id="cat_id" > 
                                </div></div>
                            <div class="col-lg-6">
                                <div class="form-group">   <label for="list_type">list_type</label>      <input type="text" class="form-control" name="list_type" id="list_type" > 
                                </div></div>
                        </div>
                        <div class="row">   
                            <div class="col-lg-6">
                                <div class="form-group">     <label for="list_url">list_url</label>    <input type="text" class="form-control" name="list_url" id="list_url" > 
                                </div></div>
                            <div class="col-lg-6">
                                <div class="form-group">    <label for="list_name">list_name</label>     <input type="text" class="form-control" name="list_name" id="list_name" > 
                                </div></div>
                        </div>
                        <div class="row">   
                            <div class="col-lg-4">
                                <div class="form-group">     <label for="min_price">min_price</label>    <input type="text" class="form-control" class="form-control" name="min_price" id="min_price" > 
                                </div></div>
                            <div class="col-lg-4">
                                <div class="form-group">    <label for="max_price">max_price</label>     <input type="text" class="form-control" name="max_price" id="max_price" > 
                                </div></div>
                            <div class="col-lg-4">
                                <div class="form-group">    <label for="brand_ids">brand_ids</label>     <input type="text" class="form-control" name="brand_ids" id="brand_ids" > 
                                </div></div>
                        </div>
                        <div class="row">   
                            <div class="col-lg-6">
                                <div class="form-group">  <label for="whereclause">whereclause</label>   <small>4G : AND (f9 <>'NO' AND f9 <>'')</small>    <input type="text" class="form-control" name="whereclause" id="whereclause" length="200"> 
                                </div></div>
                            <div class="col-lg-6">
                                <div class="form-group">  <label for="orderclause">orderclause</label> <small>Camera : cast(f16 as decimal(10,2)) desc</small>      <input type="text" class="form-control" name="orderclause" id="orderclause" length="200"> 
                                </div></div>
                        </div>

                        <button type="submit" class="btn btn-primary" >Create List</button> 
                    </form>
                </div>  
                <div class="col-lg-6">
                    <p> Reference Where Clause</p>
                    <%
                        try {
                            con = DBManager.getConnetion();
                            sql = new StringBuilder();
                            sql.append(" select feature_group,feature_name,filter_name,f.filter_vals from filtervals f,category_feature_map cfm"
                                    + " where cfm.src_id=4 and cfm.feature_id=f.cfm_id"
                                    + " group by feature_group,feature_name ");
                            stmt = con.prepareStatement(sql.toString());
                            rs = stmt.executeQuery();
                            out.print("<table class=\"table table-bordered\">");
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getString("feature_group") + "</td><td>" + rs.getString("feature_name") + "</td><td>" + rs.getString("filter_name") + "</td><td>" + rs.getString("filter_vals") + "</td>");
                                out.print("</tr>");
                            }
                            out.print("</table>");
                        } catch (Exception e) {

                        } finally {
                            DBManager.closeConnection(con, rs, stmt);
                        }

                    %>
                </div>  
            </div>   

        </div>
        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/res/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
        <script src='//cdn.tinymce.com/4/tinymce.min.js'></script>
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
        <script type="text/javascript">
            function opendivform(formName) {
                tinymce.init({
                    selector: '#' + formName + ' #htmldesc',
                    height: 200,
                    theme: 'modern',
                    plugins: [
                        'advlist autolink lists link image charmap print preview hr anchor pagebreak',
                        'searchreplace wordcount visualblocks visualchars code fullscreen',
                        'insertdatetime media nonbreaking save table contextmenu directionality',
                        'emoticons template paste textcolor colorpicker textpattern imagetools'
                    ],
                    toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
                    toolbar2: 'print preview media | forecolor backcolor emoticons',
                    image_advtab: true,
                    templates: [
                        {title: 'Test template 1', content: 'Test 1'},
                        {title: 'Test template 2', content: 'Test 2'}
                    ],
                    content_css: [
                        '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
                        '//www.tinymce.com/css/codepen.min.css'
                    ]
                });
            }
            function save(formName) {
                var content = tinyMCE.activeEditor.getContent();
                $('#' + formName + ' textarea[name=htmldesc]').val(content);
                $.post('${pageContext.request.contextPath}/savedesc', $('#' + formName).serialize(), function (data) {
                    $('#' + formName + ' textarea[name=htmldesc]').val(content);
                    ;
                });
                tinyMCE.execCommand('mceRemoveEditor', true, 'htmldesc');
                $('#' + formName + ' textarea[name=htmldesc]').show();
                ;
            }
            function closeTinyMce(formName) {
                // tinyMCE.activeEditor.windowManager.close();
                //  tinymce.EditorManager.execCommand('mceRemoveEditor',true,tinyMCE.activeEditor);
                tinyMCE.execCommand('mceRemoveEditor', true, 'htmldesc');
                $('#' + formName + ' textarea[name=htmldesc]').show();
                ;
            }
        </script>
    </body>
</html>
