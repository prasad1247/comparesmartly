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

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
               <title>Compare Smartly | Smart choices, Best prices in India</title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/res/img/logo/3rd_1.png"/>
        <meta name='description' content='We, CompareSmartly, help you find the best products in your budget in India and help you find the best price online' />

        <meta property='og:title' content='Compare Smartly | Smart choices, Best prices in India' />
        <meta property='og:url' content='http://comparesmartly.in' />
        <meta property='og:image' content='${pageContext.request.contextPath}/res/img/home.jpg' />
        <meta property="og:type"   content="product.group" />
        <meta property='og:site_name' content='CompareSmartly' />	
        <meta property='og:description' content='We, CompareSmartly, help you find the best products in your budget in India and help you find the best price online' />

        <meta name="twitter:site" content="@ngpricecheck">
        <meta name="twitter:title" content="Compare Smartly | Smart choices, Best prices in India">
        <meta name="twitter:description" content="We, CompareSmartly, help you find the best products in your budget in India and help you find the best price online">
        <meta name="twitter:image" content="${pageContext.request.contextPath}/res/img/home.jpg">

        
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
                        <h2>Compare Smartly</h2>
                        <p>Compare the prices of various phones, televisions, power banks etc only on comparesmartly.in and get the best-suited one for you. Come with your budget and iterate through the varieties of the best products here.</p>
                    </div>
                </div>
               </div>
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-md-2">
                            <a href="${pageContext.request.contextPath}/phones/phones-in-india" title="Phones">
                            <img class="img img-responsive" src="https://cdn.compareraja.in/images/product/small/hp-7-voicetab-8gb-wi-fi-3g-small.jpeg" alt="">
                            </a>
                        </div> <div class="col-md-4">
                            <h4 class="text-center"><a href="${pageContext.request.contextPath}/phones/phones-in-india">Phones</a></h4>
                            <p>Find the best phones at best prices on comparesmartly.in We have compiled various lists of phones, so that you can get best mobile in your budget.</p>
                            <p></p>
                        </div>

                        <div class="col-md-4">
                            <h4 class="text-center"><a href="${pageContext.request.contextPath}/tv/televisions-in-india">Televisions</a></h4>
                            <p>View Popular Televisions, Best brands, Best TVs to help you buy best suited TV.</p>

                        </div>
                        <div class="col-md-2">
                            <a href="${pageContext.request.contextPath}/tv/televisions-in-india" title="Televisions">
                            <img class="img img-responsive" src="https://cdn.compareraja.in/images/product/small/micromax-32-canvas-s-32-inch-hd-ready-smart-led-television-small.jpeg" alt="">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-md-2">
                            <a href="${pageContext.request.contextPath}/powerbanks/powerbanks-in-india" title="Power Banks">
                            <img class="img img-responsive" src="https://cdn.compareraja.in/images/product/large/lenovo-pb410-power-bank.jpeg" alt="">
                            </a>
                        </div> <div class="col-md-4">
                            <h4 class="text-center"><a href="${pageContext.request.contextPath}/powerbanks/powerbanks-in-india">Power Banks</a></h4>
                            <p>View the best Power banks in India, Compare their specs and get the lowest prices</p>

                        </div>

                        <div class="col-md-4">
                            <h4 class="text-center"><a href="${pageContext.request.contextPath}/headphones/headphones-in-india">Headphones</a></h4>
                            <p>Find the best headphones to suit your need, View popular brands and compare prices from various retailers</p>
                        </div>
                        <div class="col-md-2">
                            <a href="${pageContext.request.contextPath}/headphones/headphones-in-india" title="Headphones">
                            <img class="img img-responsive" src="https://cdn.compareraja.in/images/product/small/sennheiser-hd-451-wired-headphones.jpeg" alt="">
                            </a>
                        </div> 
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header">Phones Price Lists</h4>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-md-4 col-sm-6"><ul class="list-unstyled">
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-4g-phones-under-5000">Best 4G Phone Under 5000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-4g-phones-under-10000">Best 4G Phone Under 10000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-camera-phones-under-5000">best camera phones under 5000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-camera-phones-under-10000">best camera phones under 10000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-camera-phones-under-15000">best camera phones under 15000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-camera-phones-under-20000">best camera phones under 20000</a></li>

                        </ul></div><div class="col-md-4 col-sm-6"><ul class="list-unstyled">
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-camera-phones-under-25000">best camera phones under 25000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-4g-phones-under-15000">Best 4G Phones Under 15000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/4g-phones-in-india">4G phone in India</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-phones-under-5000">Best-phones under 5000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-phones-under-8000">Best-phones under 8000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-phones-under-10000">Best-phones under 10000</a></li>

                        </ul></div><div class="col-md-4 col-sm-6"><ul class="list-unstyled">
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-phones-under-15000">Best-phones under 15000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-phones-under-20000">Best phones under 20000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-phones-under-25000">Best phones under 25000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-phones-under-30000">Best phones under 30000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-phones-under-35000">Best phones under 35000</a></li>

                        
                        <li><i class="fa fa-mobile" aria-hidden="true"></i> <a href="phones/best-phones-under-40000">Best phones under 40000</a></li>

                        </ul></div><div class="col-md-4 col-sm-6"><ul class="list-unstyled"></ul></div>

                    </div>
                </div>
            </div>

            <!-- /.row -->
            <!-- Portfolio Section -->
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header">Popular Phones</h4>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <%
                            ArrayList<ProductBean> phList = (ArrayList) request.getAttribute("phones");
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
                    <h4 class="page-header">TVs price lists</h4>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-md-4 col-sm-6"><ul class="list-unstyled">
                        <li><i class="fa fa-television" aria-hidden="true"></i> <a href="tv/best-TVs-under-20000">Best TVs under 20000</a></li>

                        
                        <li><i class="fa fa-television" aria-hidden="true"></i> <a href="tv/best-TVs-under-30000">Best TVs under 30000</a></li>

                        </ul></div><div class="col-md-4 col-sm-6"><ul class="list-unstyled">
                        <li><i class="fa fa-television" aria-hidden="true"></i> <a href="tv/best-TVs-under-40000">Best TVs under 50000</a></li>

                        
                        <li><i class="fa fa-television" aria-hidden="true"></i> <a href="tv/best-TVs-under-50000">Best TVs under 50000</a></li>

                        </ul></div><div class="col-md-4 col-sm-6"><ul class="list-unstyled">
                        <li><i class="fa fa-television" aria-hidden="true"></i> <a href="tv/best-TVs-under-60000">Best TVs under 60000</a></li>

                        
                        <li><i class="fa fa-television" aria-hidden="true"></i> <a href="tv/best-32-inch-tvs-under-30000">Best 32 Inch TVs under 30000</a></li>

                        </ul></div><div class="col-md-4 col-sm-6"><ul class="list-unstyled">
                        <li><i class="fa fa-television" aria-hidden="true"></i> <a href="tv/best-40-inch-tvs-under-50000">Best 40 Inch TVs under 50000</a></li>

                        
                        <li><i class="fa fa-television" aria-hidden="true"></i> <a href="tv/best-42-inch-tvs-under-50000">Best 42 Inch TVs under 40000</a></li>

                        </ul></div><div class="col-md-4 col-sm-6"><ul class="list-unstyled"></ul></div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header">Popular Televisions</h4>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <%
                            ArrayList<ProductBean> tvList = (ArrayList) request.getAttribute("tvs");
                            for (ProductBean pb : tvList) {
                        %>
                        <div class="col-md-2 col-xs-6">

                            <a href="${pageContext.request.contextPath}<%="/" + pb.getpUrl()%>">
                                <img class="img-responsive img-portfolio img-hover" src="<%=pb.getImgLink()%>" alt="" style="max-height:150px">
                                <%=pb.getProductName()%>
                            </a>

                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
          <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header">Power Banks under</h4>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-md-4 col-sm-6"><ul class="list-unstyled">
                        <li><i class="fa fa-battery-full" aria-hidden="true"></i> <a href="powerbanks/best-powerbanks-under-500">Best PowerBanks under 500</a></li>

                        </ul></div><div class="col-md-4 col-sm-6"><ul class="list-unstyled">
                        <li><i class="fa fa-battery-full" aria-hidden="true"></i> <a href="powerbanks/best-powerbanks-under-1000">Best PowerBanks under 1000</a></li>

                        </ul></div><div class="col-md-4 col-sm-6"><ul class="list-unstyled">
                        <li><i class="fa fa-battery-full" aria-hidden="true"></i><a href="powerbanks/best-powerbanks-under-1500">Best PowerBanks under 1500</a></li>

                        </ul></div><div class="col-md-4 col-sm-6"><ul class="list-unstyled">
                        <li><i class="fa fa-battery-full" aria-hidden="true"></i> <a href="powerbanks/best-powerbanks-under-2000">Best PowerBanks under 2000</a></li>

                        </ul></div><div class="col-md-4 col-sm-6"><ul class="list-unstyled"></ul></div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header">Popular PowerBanks</h4>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <%
                            ArrayList<ProductBean> pbList = (ArrayList) request.getAttribute("pbs");
                            for (ProductBean pb : pbList) {
                        %>
                        <div class="col-md-2 col-xs-6">
                            <a href="${pageContext.request.contextPath}<%="/" + pb.getpUrl()%>">
                                <img class="img-responsive img-portfolio img-hover" src="<%=pb.getImgLink()%>" alt="" style="height:150px">
                                <%=pb.getProductName()%>
                            </a>
                        </div>
                        <%}%>
                    </div>
                </div>

            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="page-header">Popular HeadPhones</h4>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <%
                            ArrayList<ProductBean> hList = (ArrayList) request.getAttribute("headphones");
                            for (ProductBean pb : hList) {
                        %>
                        <div class="col-md-2 col-xs-6">

                            <a href="${pageContext.request.contextPath}<%="/" + pb.getpUrl()%>">
                                <img class="img-responsive img-portfolio img-hover" src="<%=pb.getImgLink()%>" alt="" style="height:150px" >
                                <%=pb.getProductName()%>
                            </a>

                        </div>
                        <%}%>
                    </div>
                </div>
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
