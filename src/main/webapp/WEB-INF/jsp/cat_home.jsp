<%@page import="in.sc.bean.MetaBean"%>
<%@page import="in.sc.admin.ApplicationUtils"%>
<%@page import="in.sc.dao.ProductHelper"%>
<%@page import="in.sc.bean.FeatureBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.sc.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <%

        ProductBean catBean = (ProductBean) request.getAttribute("cat_details");
        MetaBean mbean = catBean.getMbean();
        String title = "", keywords = "", desc = "", myUrl = "", myImg = "";

        title = mbean.getP_title();
        desc = mbean.getP_desc();
        keywords = mbean.getH_keywords();
        myUrl = catBean.getUrl();

    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><%=title%></title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/res/img/logo/3rd_1.png"/>
        <meta name='description' content='<%=desc%>' />

        <meta property='og:title' content='<%=title%>' />
        <meta property='og:url' content='http://comparesmartly.in/<%=myUrl%>' />
        <meta property='og:image' content='<%=catBean.getImgLink()%>' />
        <meta property="og:type"   content="product.group" />
        <meta property='og:site_name' content='CompareSmartly' />	
        <meta property='og:description' content='<%=desc%>' />

        <meta name="twitter:site" content="@ngpricecheck">
        <meta name="twitter:title" content="<%=title%>">
        <meta name="twitter:description" content="<%=desc%>">
        <meta name="twitter:image" content="<%=catBean.getImgLink()%>">


        <!-- Bootstrap Core CSS -->
        <link href="${pageContext.request.contextPath}/res/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/res/css/modern-business.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/res/css/menu.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="${pageContext.request.contextPath}/res/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>

        </script>
        <style media="screen">

        </style>
        <style>
            .row-eq-height{
                padding: 10px;
                outline-offset: -10px;
                -moz-outline-radius: 10px;  
                -webkit-outline-radius: 10px;
            }
            .row-eq-height-old{
                margin-top:10px;
                padding: 20px;
                outline: 2px solid #ccc;
                outline-offset: -10px;
                -moz-outline-radius: 10px;
                -webkit-outline-radius: 10px;
            }
            .square {
                float:left;
                position: relative;
                width: 35px;
                margin:1.66%;
                background-color:#1E1E1E;
                overflow:hidden;
            }

            .content {
                // position:absolute;
                height:90%; /* = 100% - 2*5% padding */
                width:90%; /* = 100% - 2*5% padding */
                padding: 5%;
                font-weight:900;
                color: #fff;
                text-align: center;
            }
            .table{
                display:table;
                width:100%;
                height:100%;
            }
            .table-cell{
                display:table-cell;
                vertical-align:middle;
            }
            .filter-scrollable{
                height:300px; 
                overflow-y:scroll;
            }
            #SearchParameters.in,
            #SearchParameters.collapsing {
                display: block!important;
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
        </style>

    </head>

    <body style="background-color: #F5F7F5; overflow-x: hidden">

        <!-- Navigation -->
        <jsp:include page="menu.jsp" />  <!-- Page Content -->
        <!-- Page Content -->
        <div class="container">
            <div class="row" style="margin-top: 50px;">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <p><%=catBean.getPdesc()%></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <%
                            HashMap bMap = (HashMap) request.getAttribute("bMap");
                        %>

                        <%
                            Iterator bitr = bMap.keySet().iterator();
                            int br = 0;
                            while (bitr.hasNext()) {
                                String bName = (String) bitr.next();
                                String data[] = ((String) bMap.get(bName)).split("#");
                                if (br == 0) {
                                    out.print("<div class=\"info col-lg-3 col-xs-6\"><ul>");
                                    out.print("<li><a href=\""+request.getContextPath()+"/"+catBean.getCatUrl()+"\">All "+catBean.getProductName()+"</a></li>");
                                }
                                if (br == 3 || br == 6 || br == 9) {
                                    out.print("</ul></div><div class=\"info col-lg-3 col-xs-6\"><ul>");
                                }

                        %>
                        <li><a href="${pageContext.request.contextPath}/<%=data[1]%>"><%=bName%></a></li>
                            <%
                                    if (br == 11) {
                                        out.print("</ul></div>");
                                        break;
                                    }
                                    br++;
                                }%>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            
            <!-- /.row -->
            <!-- Portfolio Section -->
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header">Popular <%=catBean.getProductName()%></h4>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <%                            ArrayList<ProductBean> phList = (ArrayList) request.getAttribute("populer");

                            for (ProductBean pb : phList) {
                        %>
                        <div class="col-md-2 col-xs-6">

                            <a href="${pageContext.request.contextPath}<%="/" + pb.getpUrl()%>">
                                <img class="img-responsive img-portfolio img-hover" src="<%=pb.getImgLink()%>" alt="" style="height:150px">
                                <%=pb.getProductName()%>
                            </a>
                            <a href=""></a>

                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header"><%=catBean.getProductName()%> pricelists</h4>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <%
                            HashMap priceMap = (HashMap) request.getAttribute("priceMap");
                            Iterator<String> itr = priceMap.keySet().iterator();
                            while (itr.hasNext()) {
                                String priceName = itr.next();
                                ArrayList<ProductBean> price0 = (ArrayList) priceMap.get(priceName);
                                out.print("<div class=\"info col-lg-3 col-xs-12\"><table class=\"table\">");
                                out.print("<th colspan=\"2\"><strong>" + priceName + "</strong></th>");
                                for (ProductBean pb : price0) {
                        %>

                        <tr>
                            <td>
                                <a href="${pageContext.request.contextPath}/<%=pb.getpUrl()%>">
                                    <img class="media-object" style="height:50px;" src="<%=pb.getImgLink()%>" alt="<%=pb.getProductName()%>">
                                </a>
                            </td>
                            <td >
                                <p class="media-heading"><%=pb.getProductName()%></p>
                            </td>
                        </tr>

                        <%}
                                out.print("</table></div>");
                            }
                        %>

                    </div>
                </div>
            </div>
                        <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header"><%=catBean.getProductName()%> By price and features</h4>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <%
                            br = 0;
                            int nr = 0;
                            ArrayList<ProductBean> catList = (ArrayList) request.getAttribute("catLists");
                            int size = catList.size();
                            for (ProductBean pb : catList) {
                                br++;
                                nr++;
                                if (br == 1) {
                                    out.print("<div class=\"col-md-4 col-xs-12\"><ul class=\"list-unstyled\">");
                                }

                        %>
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="<%=pb.getUrl()%>"><%=pb.getProductName()%></a></li>

                        <%
                                if (nr >= size / 3) {
                                    nr = 0;
                                    out.print("</ul></div><div class=\"col-md-4 col-xs-6\"><ul class=\"list-unstyled\">");
                                }
                                if (br == size) {
                                    out.print("</ul></div>");
                                    break;
                                }

                            }

                        %>

                    </div>
                </div>
            </div>
<!--
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header">Popular Phones</h4>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <p><%=catBean.getBrandCatDesc()%></p>
                    </div>
                </div>
            </div>         
-->
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
                        <p class="text-center">Copyright &copy; comparesmartly.in 2016</p>
                    </div>
                </div>
            </footer>


        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->

        <script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
        <!-- Script to Activate the Carousel -->
        <script>
            $('.carousel').carousel({
                interval: 5000 //changes the speed
            })
        </script>

    </body>

</html>
