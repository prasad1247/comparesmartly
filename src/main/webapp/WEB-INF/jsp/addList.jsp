<%-- 
    Document   : addList
    Created on : Dec 20, 2016, 10:57:53 PM
    Author     : Asus
--%>

<%@page import="in.sc.download.DBManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>
<%@page import="in.sc.bean.ProductBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <body>
        <div class="container">
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
                  
                </div>  
                <div class="col-lg-6">
                    <div class="row">   
                        <div class="col-lg-12">
                            <div class="form-group">  <label for="cat_names">cat_names</label>   
                                <textarea rows="10" class="form-control" name="cat_names" id="cat_names" length="200">
Best micromax phone under Rs.   cat_price  
<strong>Best phones under Rs.   cat_price  </strong>
Phones with best features under Rs.   cat_price
Smartphones having top specs under   cat_price
<strong>Best mobiles under   cat_price  </strong>
<strong>Top mobile phones below Rs.   cat_price  </strong>
Top mobile phones below   cat_price
Top phones under   cat_price1
Best micromax mobile price in range 10000 to 1500
<strong>micromax mobile between 10000 to 15000</strong>
<strong>micromax 10000 to 15000</strong>
<strong>Top micromax mobile between 10000 to 15000</strong>
Best Micromax mobile price 10000 to 15000
Top Micromax mobile phones price upto 15000
Best Micromax smartphones price 10000 to 15000

                                </textarea>
                            </div></div>
                        <div class="col-lg-12">
                            <div class="form-group">  <label for="cat_s_names">cat_s_names</label> 
                                <textarea rows="10" class="form-control" name="cat_s_names" id="cat_s_names" length="200"> 
                                <strong>Best Micromax phone in range 10000 to 15000</strong>
Top Micromax phones between 10000 to 15000
<strong>Top Micromax mobile price 10000 to 15000</strong>
<strong>Best Micromax smartphone in 10000 to 15000 range</strong>
<strong>Micromax smartphone in price between 10000 to 15000</strong>
<strong>Best Micromax smartphone under 15000 Rs.</strong>
<strong>Best phone under Rs.   cat_price  </strong>
smartphone with best features under Rs.   cat_price
<strong>Top smartphone under   cat_price  </strong>
<strong>Best smartphone below   cat_price  </strong>
<strong>Top mobile below   cat_price  </strong>
<strong>Top mobile phone below   cat_price1  </strong>
</textarea>
                            </div></div>
                        <div class="col-lg-6">
                            <div class="form-group">  <label for="date_s">date_s (Dec 15, 2016)</label> 
                                <input type="text" class="form-control" name="date_s" id="date_s" length="200"> </textarea>
                            </div></div>
                        
                        <div class="col-lg-6">
                            <div class="form-group">  <label for="list_id">list_id</label> 
                                <input type="text"  class="form-control" name="list_id" id="list_id" length="200"> </textarea>
                            </div></div>
                    </div>



                </div>
                <div class="col-lg-6">
                    <p> Reference Where Clause</p>
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
                            sql = new StringBuilder();
                            sql.append(" select feature_group,feature_name,filter_name,f.filter_vals,cfm.cat_id from filtervals f,category_feature_map cfm"
                                    + " where cfm.src_id=4 and cfm.feature_id=f.cfm_id and cfm.cat_id=137"
                                    + " group by feature_group,feature_name");
                            stmt = con.prepareStatement(sql.toString());
                            rs = stmt.executeQuery();
                            out.print("<table class=\"table table-bordered\">");
                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getString("cat_id") + "</td><td>" + rs.getString("feature_group") + "</td><td>" + rs.getString("feature_name") + "</td><td>" + rs.getString("filter_name") + "</td><td>" + rs.getString("filter_vals") + "</td>");
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
  </form>
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
