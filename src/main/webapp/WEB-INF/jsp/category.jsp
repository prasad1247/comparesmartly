<%@page import="in.sc.bean.FeatureBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.sc.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <%

        HashMap bMap = (HashMap) request.getAttribute("bMap");

    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Smart Compare</title>

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
        <script>

        </script>
        <style media="screen">

        </style>
        <style>
            .row-eq-height{
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

        </style>

    </head>

    <body>

        <!-- Navigation -->
        <jsp:include page="menu.jsp" />
        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Full Width Page
                        <small>Subheading</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">Full Width Page</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <!-- Content Row -->
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 row-eq-height">

                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 row-eq-height">
                    <h2 class="sidebar-heading">Filter Results</h2>
                    <form action="${pageContext.request.contextPath}/category" method="post" id="finder-form" class="finder-form-fixed">
                        <div class="scroll">

                            <div class="" data-heading="Price">
                                <h3>Price</h3>
                                <ul class="list-unstyled">
                                    <li><input type="checkbox" name="price" value="price=0-to-2000" data-text="Below Rs. 2,000">Below Rs. 2,000 <li>
                                    <li><input type="checkbox" name="price" value="price=2000-to-5000" data-text="Rs. 2,000 - Rs. 5000">Rs. 2,000 - Rs. 5000 <li>
                                    <li><input type="checkbox" name="price" value="price=5000-to-10000" data-text="Rs. 5,000 - Rs. 10,000">Rs. 5,000 - Rs. 10,000 <li>
                                    <li><input type="checkbox" name="price" value="price=10000-to-15000" data-text="Rs. 10,000 - Rs. 15,000">Rs. 10,000 - Rs. 15,000 <li>
                                    <li><input type="checkbox" name="price" value="price=15000-to-20000" data-text="Rs. 15,000 - Rs. 20,000">Rs. 15,000 - Rs. 20,000 <li>
                                    <li><input type="checkbox" name="price" value="price=20000-to-25000" data-text="Rs. 20,000 - Rs. 25,000">Rs. 20,000 - Rs. 25,000 <li>
                                    <li><input type="checkbox" name="price" value="price=25000-to-100000" data-text="Above Rs. 25,000">Above Rs. 25,000 <li>
                                </ul>
                            </div>

                            <div class="content-subsection filter-brands" data-heading="Brands">
                                <h3 class="heading">Brands</h3>
                                <a class="button no-img clear-filters">Clear</a>
                                <input type="text" placeholder="Search For A Brand">
                                <a title="Clear Search Box" class="search-clear"></a>
                                <div class="filterBox filter-scrollable" >
                                    <ul>
                                        <%                                        Iterator bitr = bMap.keySet().iterator();
                                            while (bitr.hasNext()) {
                                                String bName = (String) bitr.next();
                                        %>
                                        <label class="checkbox"><input type="checkbox" name="brand" value="brand=<%=bMap.get(bName)%>" ><i></i><a href="<%=bName%>"><%=bName%></a></label>
                                                <%  }
                                                %>
                                    </ul>
                                </div>
                            </div>
                            <%
                                HashMap gFeatureMap = (HashMap) request.getAttribute("gFeatureMap");
                                HashMap idToFeatureMap = gFeatureMap;
                                Iterator fitr = idToFeatureMap.keySet().iterator();
                                while (fitr.hasNext()) {
                                    String fid = (String) fitr.next();
                                    FeatureBean fBean = (FeatureBean) idToFeatureMap.get(fid);
                                    ArrayList<String> fList = fBean.getFilterVals();

                            %>
                            <div data-heading="Features">
                                <h3 class="heading"><%=fBean.getFeatureName()%></h3>
                                <a class="button no-img clear-filters">Clear</a>
                                <div class="filterBox">
                                    <ul><%
                                        if (fList != null) {
                                            for (String o : fList) {
                                                String name = o.split("#")[0];
                                                String val = o.split("#")[1];
                                        %>
                                        <label class="checkbox"><input type="checkbox" name="<%=fid%>" value="<%=fid + "=" + name%>" ><i></i><a href="<%=name%>"><%=name%></a></label>
                                                <%    }
                                                    }
                                                %>

                                    </ul>
                                </div>
                            </div>     
                            <%  }
                            %>
                            <input type="hidden" name="filterQ" id="filterQ" value="<%=request.getAttribute("filterQ")%>">
                            <button type="submit" class="btn btn-primary" onclick="return getSearchData();">Search</button> 
                            <button type="button" class="btn btn-primary" onclick="return setFilters();">SET</button> 
                        </div>
                    </form>
                </div>
                <div class="col-lg-9">
                    <% ArrayList<ProductBean> productList = (ArrayList) request.getAttribute("dataList");
                        //productList = new ArrayList();
                        for (ProductBean pb : productList) {
                    %>
                    <div class="row row-eq-height">
                        <div class="col-lg-2 col-xs-4">
                            <div class="pull-left">
                                <div class="square">
                                    <div class="content">
                                        <div class="table">
                                            <div class="table-cell numbers">
                                                <%=pb.getSpecScore()%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="">
                                <a href="${pageContext.request.contextPath}<%="/phones/" + pb.getUniqueId() + "-latest-price-in-india"%>" title="<%=pb.getProductName()%>">
                                    <img class="img img-responsive" src="<%=pb.getImgLink()%>" alt="<%=pb.getProductName()%>">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-lg-8 col-xs-8">
                                    <h3><a href="${pageContext.request.contextPath}<%="/phones/" + pb.getUniqueId() + "-latest-price-in-india"%>"><%=pb.getProductName()%></a></h3>
                                </div>
                                <div class="col-lg-4 col-xs-4">
                                    <h3><a href="${pageContext.request.contextPath}<%="/phones/" + pb.getUniqueId() + "-latest-price-in-india"%>"><span class="">Rs. <%=pb.getNewPrice()%></span></a></h3>
                                </div>
                            </div>

                            <div class="row">
                                <%        HashMap<String, ArrayList<String>> gMap = pb.getgFeatureMap();
                                    Iterator itr = gMap.keySet().iterator();
                                    int newRow = 0;
                                    while (itr.hasNext()) {
                                        String fId = (String) itr.next();
                                        ArrayList<String> sList = gMap.get(fId);
                                        if (newRow == 0 || newRow == 3) {
                                            out.print("<div class=\"info col-lg-4 col-xs-6\">");
                                        }
                                        if (newRow == 4 || newRow == 3) {

                                        }
                                %>


                                <ul class="">
                                    <% for (String data : sList) {
                                            out.print("<li>" + data + "</li>");
                                        }%>
                                </ul>


                                <%
                                        if (newRow == 2 || newRow == 5) {
                                            out.print("</div>");
                                        }
                                        newRow++;
                                    }
                                %>
                                <div class="info col-lg-4 col-xs-6">
                                    <div class="btn-group-vertical">
                                        <button type="button" class="btn btn-primary">Rs.10000 at Flipkart</button> 
                                        <button type="button" class="btn btn-primary btn-block">Rs.12000 at Amazon</button>
                                        <button type="button" class="btn btn-primary btn-block">View More Details</button>   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <%}%>
                    <div class="clear"></div>
                </div>     
            </div>


        </div>
        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/res/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
    <script src="http://dmitrybaranovskiy.github.io/raphael/raphael.js"></script>  
    <script>
                                function getSearchData() {
                                    var txt = '';
                                    $('input[name="brand"]:checked').each(function () {
                                        console.log(this.value);
                                        txt = txt + ',' + this.value;
                                    });
                                    var fLen =<%=idToFeatureMap.size()%>;
                                    for (var i = 1; i < fLen; i++) {
                                        $('input[name="f' + i + '"]:checked').each(function () {
                                            console.log(this.value);
                                            txt = txt + ',' + this.value;
                                        });
                                    }
                                    $('input[name="price"]:checked').each(function () {
                                        console.log(this.value);
                                        txt = txt + ',' + this.value;
                                    });
                                    $('#filterQ').val(txt.substr(1))
                                    return true;
                                }
                                function setFilters() {
                                    var fQ = $('#filterQ').val();
                                    var splitFq = fQ.split(",");
                                    for (var i = 0; i < splitFq.length; i++) {
                                        var vals=splitFq[i].split("=");
                                        $("input[name='"+vals[0]+"'][value='"+splitFq[i]+"']").attr('checked', true);
                                    }
                                }
    </script>   
</body>

</html>
