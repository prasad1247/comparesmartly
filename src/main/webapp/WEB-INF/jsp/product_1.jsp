<%@page import="in.sc.bean.MetaBean"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.sc.bean.FeatureBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.sc.bean.ProductBean"%>
<!DOCTYPE html>
<html lang="en">

    <%

        ProductBean pBean = (ProductBean) request.getAttribute("pBean");
        MetaBean mbean = pBean.getMbean();

    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/res/img/logo/3rd_1.png"/>
        <title><%=mbean.getP_title()%></title>
        <meta property='og:title' content='<%=mbean.getP_title()%>' />
        <meta name='description' content='<%=mbean.getP_desc()%>' />

        <meta property='og:url' content='http://comparesmartly.in/<%=pBean.getUrl()%>' />
        <meta property='og:type' content='product' />
        <meta property='og:image' content='<%=pBean.getImgLink()%>' />
        <meta property='og:site_name' content='CompareSmartly' />	
        <meta property='og:description' content='<%=mbean.getP_desc()%>' />


        <meta name="twitter:site" content="@ngpricecheck">
        <meta name="twitter:title" content="<%=mbean.getP_title()%>">
        <meta name="twitter:description" content="<%=mbean.getP_desc()%>">
        <meta name="twitter:image" content="<%=pBean.getImgLink()%>">

        <!-- Bootstrap Core CSS -->
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
            .img-responsive {margin:0 auto;}
            .table{
                display:table;
                width:100%;
                height:100%;
            }
            .table-cell{
                display:table-cell;
                vertical-align:middle;
            }
            .panel{
                margin-bottom: 3px;
            }
            .large-text{
                font-size: 25px;
                margin-top: 5px;
                margin-bottom: 5px;
            }
            .mdlarge-text{
                font-size: 20px;
                margin-bottom: 5px;
            }
            .md-text{
                font-size: 18px;
            }
            .navbar-inverse{
                background-color: #961440;
            }
            .btn-primary{
                background-color: #961440;
            }
            .panel-default>.panel-heading{
                background-color: #961440;
            }
        </style>

    </head>

    <body style="background-color: #F5F7F5;">

        <!-- Navigation -->
        <jsp:include page="menu.jsp" />
        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <ol class="breadcrumb">
                        <li><a href="<%=pBean.getCatUrl()%>">Home</a>
                        </li>
                        <li class="active"><a href="<%=pBean.getUrl()%>"><%=pBean.getProductName()%></a></li>
                    </ol>
                    <h1><%=mbean.getP_title()%></h1>
                </div>
            </div>
            <!-- /.row -->

            <!-- Content Row -->

            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 ">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="simg">
                                <a href="<%=pBean.getUrl()%>" title="<%=pBean.getProductName()%>">
                                    <img class="img img-responsive" src="<%=pBean.getImgLink()%>" alt="<%=pBean.getProductName()%>">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="row">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="col-lg-12 col-xs-12">
                                            <h3><%=pBean.getProductName()%></h3>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2 col-xs-6">
                                            <h3><span class="">Rs. <%=pBean.getNewPrice()%></span></h3>
                                        </div>
                                        <div class="col-lg-2 col-xs-6">
                                            <a href="<%=pBean.getSellerUrl()%>" target="_blank" rel="nofollow" class="btn btn-lg btn-info" style="margin-top:10px; padding: 10px" rel="nofollow" >Go to store</a>
                                        </div>
                                    </div>
                                    <h4>Product Features:</h4>    
                                    <div class="row">
                                        <%        HashMap<String, ArrayList<String>> gMap = pBean.getgFeatureMap();
                                            Iterator itr = gMap.keySet().iterator();
                                            int newRow = 0;
                                            out.print("<div class=\"info col-lg-6 col-xs-12\">");
                                            out.print("<table class=\" table \">");
                                            while (itr.hasNext()) {
                                                if (newRow == gMap.size() / 2) {
                                                    break;
                                                }
                                                String fId = (String) itr.next();
                                                ArrayList<String> sList = gMap.get(fId);

                                        %>

                                        <% for (String data : sList) {
                                                String glyph = data.substring(0, data.indexOf("#"));
                                                String fname = data.substring(data.indexOf("#") + 1, data.lastIndexOf("#"));
                                                String fval = data.substring(data.lastIndexOf("#") + 1);
                                                out.print("<tr><td > " + glyph + " </td><td > <strong> " + fname + " </strong> </td><td>" + fval + "</td></tr>");
                                            }%>

                                        <%    newRow++;
                                            }
                                            out.print("</table>");
                                            out.print("</div>");

                                        %>
                                        <%                                    out.print("<div class=\"info col-lg-6 col-xs-12\">");
                                            out.print("<table class=\"table\">");
                                            while (itr.hasNext()) {
                                                String fId = (String) itr.next();
                                                ArrayList<String> sList = gMap.get(fId);

                                        %>

                                        <% for (String data : sList) {
                                                String glyph = data.substring(0, data.indexOf("#"));
                                                String fname = data.substring(data.indexOf("#") + 1, data.lastIndexOf("#"));
                                                String fval = data.substring(data.lastIndexOf("#") + 1);
                                                out.print("<tr><td > " + glyph + "  </td><td > <strong>" + fname + " </strong></td><td>" + fval + "</td></tr>");
                                            }%>



                                        <%    newRow++;
                                            }
                                            out.print("</table>");
                                            out.print("</div>");
                                        %>
                                        <div class="info col-lg-4 hidden-xs hidden-lg">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-info" style="margin-bottom: 8px;">View More Details</button>   
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-xs-6">
                                            <h4>Product at Glance</h4>
                                            <!--  <ul class="pros">
                                                  <li><i class="i-tick-check"></i>Phone is 1st in Design under this category</li>
                                                  <li><i class="i-tick-check"></i>It scored 3rd in respect of Speed and performance</li>
                                                  <li><i class="i-tick-check"></i>the Phone has 2nd best Camera in this category</li>
                                                  <li><i class="i-tick-check"></i>With respect to Display Quality phone scored 2nd Rank</li>
                                                  <li><i class="i-tick-check"></i>Its 2nd in Battery Backup</li>
                                                  <li><i class="i-tick-check"></i>OverAll Phone is 1st in Value for money</li>
                                              </ul><div class="clear"></div>-->
                                            <div class="row">
                                                <div class="col-lg-12 col-xs-12">
                                                    <% for (Object o : pBean.getpListDesc()) {
                                                            ProductBean pListBean = (ProductBean) o;
                                                    %>
                                                    <p><a href="${pageContext.request.contextPath}/<%=pListBean.getUrl()%>"><%=pListBean.getPdesc()%></a></p>
                                                        <%}%>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>


                </div>     
            </div>
            <div class="row">
                <div class="col-lg-9">
                    <div class="panel panel-default">
                        <h4 class="head_bdr">Price of <%=pBean.getProductName()%> in India</h4>
                        <div class="panel-body">
                            <%  ArrayList<ProductBean> pList = (ArrayList) request.getAttribute("pList");
                                for (ProductBean pb : pList) {
                            %>
                            <div class="row">
                                <div class="col-xs-6 col-lg-5"><%=pb.getProductName()%></div>
                                <div class="col-xs-3 col-lg-2">Rs.<%=pb.getNewPrice()%></div>
                                <div class="col-xs-3"><a href="<%=pb.getSellerUrl()%>" target="_blank" rel="nofollow"><img src="${pageContext.request.contextPath}/res/<%=pb.getRetailerLogo()%>" title="<%=pb.getRetailer()%>" width="100"></a></div>
                                
                                <div class="col-lg-2 hidden-xs"><a href="<%=pb.getSellerUrl()%>" target="_blank" class="btn btn-info" style="margin-bottom:10px;" rel="nofollow" >Go to store</a></div>
                            </div>
                            <div class="clear"></div>
                            <%}%>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div id="descBox" class="sub_inner_box border">
                                <h4 class="head_bdr">Overview of <%=pBean.getProductName()%></h4>
                                <%=pBean.getPdesc()%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3"  style="padding:0px;">
                    <div class="panel panel-default" >
                    <div class="panel-heading mdlarge-text">Popular Lists</div>
                                     <div class="panel-body">
                            <%  ArrayList<ProductBean> catList=(ArrayList)request.getAttribute("catList");
                            out.print("<ul  class=\"list-unstyled\">");
                            for(ProductBean pb:catList){
                                out.print("<li> <a href='"+pb.getUrl()+"'>"+pb.getProductName()+"</a></li>");
                            }
                            out.print("</ul>");
                            %>
                        </div>
                </div>
                </div>
            </div>
            <div class="row">
                <%
                    HashMap<String, ArrayList<String>> generateMap = (HashMap) request.getAttribute("generateMap");
                    itr = generateMap.keySet().iterator();
                    newRow = 0;
                    while (itr.hasNext()) {
                        String fGroup = (String) itr.next();

                %>          
                <%if (newRow == generateMap.size() / 2 || newRow == 0) {%>
                <div class="col-lg-6">
                    <%}%>

                    <div class="panel panel-default">
                        <div class="panel-heading mdlarge-text">
                            <%=fGroup%>
                        </div>
                        <div class="panel-body">
                            <% for (String features : generateMap.get(fGroup)) {
                                    String fName = features.substring(1, features.lastIndexOf("#"));
                                    String fVal = features.substring(features.lastIndexOf("#") + 1);
                                    if (fVal == null || fVal.equals("null")) {
                                        continue;
                                    }
                            %>
                            <div class="row">
                                <div class="col-xs-6">
                                    <strong><%=fName%> :</strong> 
                                </div>    
                                <div class="col-xs-6 ">
                                    <%=fVal%>
                                </div>    
                            </div>
                            <%}%>
                        </div>
                    </div>

                    <%if (newRow == generateMap.size() || newRow == generateMap.size() / 2 - 1) {%>
                </div>
                <%}
                        newRow++;
                    }
                %>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="simg">
                        <a href="<%=pBean.getUrl()%>" title="<%=pBean.getProductName()%>">
                            <h3>Alternatives for <%=pBean.getProductName()%></h3>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <%
                    ArrayList<ProductBean> alternateList = (ArrayList) request.getAttribute("alternateList");
                    for (ProductBean pb : alternateList) {
                        HashMap<String, ArrayList<String>> fpbMap = pb.getgFeatureMap();
                        itr = fpbMap.keySet().iterator();
                %>
                <div class="col-lg-3 col-xs-12 row-eq-height">
                    <div class="simg">
                        <a href="${pageContext.request.contextPath}/<%=pb.getpUrl()%>" title="<%=pb.getProductName()%>">
                            <img class="img img-responsive" style="max-height: 200px" src="<%=pb.getImgLink()%>" alt="<%=pb.getProductName()%>">
                        </a>
                    </div>
                    <h4 class="text-center"><a href="${pageContext.request.contextPath}/<%=pb.getpUrl()%>" title="<%=pb.getProductName()%>"><%=pb.getProductName()%> </a></h4>
                    <p class="text-center">Rs.<%=pb.getNewPrice()%></p>

                    <% while (itr.hasNext()) {
                            if (newRow == gMap.size() / 2) {
                                break;
                            }
                            String fId = (String) itr.next();
                            ArrayList<String> sList = fpbMap.get(fId);
                    %>
                    <table class="table">
                        <% for (String data : sList) {
                                String glyph = data.substring(0, data.indexOf("#"));
                                String fname = data.substring(data.indexOf("#") + 1, data.lastIndexOf("#"));
                                String fval = data.substring(data.lastIndexOf("#") + 1);
                                out.print("<tr><td> " + glyph + "</td><td><strong>" + fname + "</strong></td><td>" + fval + "</td><tr>");
                            }%>
                    </table>
                    <%}%>
                </div>
                <%}%>
            </div>
            <!-- Footer -->
            <div class="row">
                <div class="col-lg-6">
                    <ul class="list-inline">
                        <li><a href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/termofuse">Terms Of use</a></li>
                        <li><a href="${pageContext.request.contextPath}/privacypolicy">Privacy Policy</a></li>
                    </ul>
                </div>
                <div class="col-lg-6">

                </div>
            </div>
            <footer>
                <div class="row">
                    <div class="col-lg-12">
                        <p>Copyright &copy; comparesmartly.in 2016</p>
                    </div>
                </div>
            </footer>
        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/res/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-12224560-9', 'auto');
  ga('send', 'pageview');

</script>
    </body>

</html>
