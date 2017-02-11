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

        HashMap bMap = (HashMap) request.getAttribute("bMap");

        String brandName = "";
        if (request.getAttribute("brandName") != null) {
            brandName = (String) request.getAttribute("brandName");
        }

        int clId = 0;
        if (request.getAttribute("clId") != null) {
            clId = (Integer) request.getAttribute("clId");
        }
        ProductBean pBean = null;
        if (request.getAttribute("pBean") != null) {
            pBean = (ProductBean) request.getAttribute("pBean");
        }
        MetaBean mbean = pBean.getMbean();
        String title = "", keywords = "", desc = "", myUrl = "", myImg = "";
        if (!brandName.equals("")) {
            title = mbean.getB_title();
            desc = mbean.getB_desc();
            keywords = mbean.getB_keywords();
            myUrl = pBean.getbUrl();
        } else {
            title = mbean.getH_title();
            desc = mbean.getH_desc();
            keywords = mbean.getH_keywords();
            myUrl = pBean.getCatUrl();
        }
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Smart Compare</title>
        <script src="https://use.fontawesome.com/1eb18839e7.js"></script>
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
                    <h1 class="page-header"><%=title%> </h1>
                    <ol class="breadcrumb">
                        <li><a href="/">Home</a>
                        </li>
                        <li class="active"><a href="<%=myUrl%>"><%=title%></a></li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <!-- Content Row -->
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 row-eq-height">

                    <%   if (clId == 0) {%>
                    <div><%=pBean.getBrandCatDesc()%></div>
                    <%   } else {%>
                    <div><%=pBean.getCatDesc()%></div>
                    <%   }%>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <h2 class="sidebar-heading">Filter Results</h2>
                <button class="visible-xs" data-toggle="collapse" data-target="#SearchParameters">View</button>
                <div class="col-lg-3 row-eq-height hidden-xs SearchParameters visible-lg" id="SearchParameters">
                    <form action="${pageContext.request.contextPath}/<%=pBean.getCatUrl()%>" method="post" id="finder-form" class="finder-form-fixed">
                        <div class="scroll">
                            <div class="col-lg-12 col-xs-12" data-heading="Price">
                                <h3>Price</h3>
                                <ul class="list-inline">
                                    <li><input type="checkbox" name="price" value="price=0-to-2000" data-text="Below Rs. 2,000"> <a href="#"> Below Rs. 2,000</a> <li>
                                    <li><input type="checkbox" name="price" value="price=2000-to-5000" data-text="Rs. 2,000 - Rs. 5000"> <a href="#">Rs. 2,000 - Rs. 5000</a> <li>
                                    <li><input type="checkbox" name="price" value="price=5000-to-10000" data-text="Rs. 5,000 - Rs. 10,000"> <a href="#">Rs. 5,000 - Rs. 10,000</a> <li>
                                    <li><input type="checkbox" name="price" value="price=10000-to-15000" data-text="Rs. 10,000 - Rs. 15,000"> <a href="#">Rs. 10,000 - Rs. 15,000</a> <li>
                                    <li><input type="checkbox" name="price" value="price=15000-to-20000" data-text="Rs. 15,000 - Rs. 20,000"> <a href="#">Rs. 15,000 - Rs. 20,000</a> <li>
                                    <li><input type="checkbox" name="price" value="price=20000-to-25000" data-text="Rs. 20,000 - Rs. 25,000"> <a href="#">Rs. 20,000 - Rs. 25,000</a> <li>
                                    <li><input type="checkbox" name="price" value="price=25000-to-100000" data-text="Above Rs. 25,000"> <a href="#">Above Rs. 25,000</a> <li>
                                </ul>
                            </div>

                            <div class="col-lg-12 col-xs-6" data-heading="Brands">
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
                                        <label class="checkbox"><input type="checkbox" name="brand" value="brand=<%=bMap.get(bName)%>" ><i></i><a href="<%="best-" + bName + "-phones-in-india"%>"><%=bName%></a></label>
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
                                <div class="col-lg-12 col-xs-6">
                                    <ul><%
                                        if (fList != null) {
                                            for (String o : fList) {
                                                String name = o.split("#")[0];
                                                String val = o.split("#")[1];
                                        %>
                                        <label class="checkbox"><input type="checkbox" name="<%=fid%>" value="<%=fid + "=" + name%>" ><i></i><a href="#"><%=name%></a></label>
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
                            <%if (pb.getSpecScore() > 0) {%>
                            <div class="pull-left">
                                <div class="btn btn-success" style="margin-bottom: 8px;"> <strong><%=pb.getSpecScore()%>%</strong></div>   
                            </div>

                            <%}%>
                            <div class="">
                                <a href="${pageContext.request.contextPath}/<%=pb.getpUrl()%>" title="<%=pb.getProductName()%>">
                                    <img class="img img-responsive" style="max-height: 200px" src="<%=pb.getImgLink()%>" alt="<%=pb.getProductName()%>">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-lg-8 col-xs-8">
                                    <h3><a href="${pageContext.request.contextPath}<%="/" + pb.getpUrl()%>"><%=pb.getProductName()%></a></h3>
                                </div>
                                <div class="col-lg-4 col-xs-4">
                                    <h3><a href="${pageContext.request.contextPath}<%="/" + pb.getpUrl()%>"><span class=""><i class="fa fa-inr" aria-hidden="true"></i>.<%=pb.getNewPrice()%></span></a></h3>
                                </div>
                            </div>

                            <div class="row">
                                <%        HashMap<String, ArrayList<String>> gMap = pb.getgFeatureMap();
                                    Iterator itr = gMap.keySet().iterator();
                                    int newRow = 0;
                                    out.print("<div class=\"info col-lg-4 col-xs-6\">");
                                    while (itr.hasNext()) {
                                        if (newRow == gMap.size() / 2) {
                                            break;
                                        }
                                        String fId = (String) itr.next();
                                        ArrayList<String> sList = gMap.get(fId);

                                %>
                                <ul class="list-inline">
                                    <% for (String data : sList) {
                                            String glyph = data.substring(0, data.indexOf("#"));
                                            String fname = data.substring(data.indexOf("#") + 1, data.lastIndexOf("#"));
                                            String fval = data.substring(data.lastIndexOf("#") + 1);
                                            out.print("<li> " + glyph + "   <strong>" + fname + " : </strong>" + fval + "</li>");
                                        }%>
                                </ul>


                                <%    newRow++;
                                    }
                                    out.print("</div>");
                                %>
                                <%
                                    out.print("<div class=\"info col-lg-4 col-xs-6\">");
                                    while (itr.hasNext()) {
                                        String fId = (String) itr.next();
                                        ArrayList<String> sList = gMap.get(fId);

                                %>
                                <ul class="list-inline">
                                    <% for (String data : sList) {
                                            String glyph = data.substring(0, data.indexOf("#"));
                                            String fname = data.substring(data.indexOf("#") + 1, data.lastIndexOf("#"));
                                            String fval = data.substring(data.lastIndexOf("#") + 1);
                                            out.print("<li> " + glyph + "   <strong>" + fname + " : </strong>" + fval + "</li>");
                                        }%>
                                </ul>


                                <%    newRow++;
                                    }
                                    out.print("</div>");
                                %>
                                <div class="info col-lg-4 hidden-xs">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-info" style="margin-bottom: 8px;">View More Details</button>   
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-xs-12">
                                    <% for (Object o : pb.getpListDesc()) {
                                            ProductBean pListBean = (ProductBean) o;
                                    %>
                                    <p><a href="${pageContext.request.contextPath}/phones/<%=pListBean.getUrl()%>"><%=pListBean.getPdesc()%></a></p>
                                        <%}%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-xs-12">
                                    <%=pb.getPdesc()%>
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
                                        var vals = splitFq[i].split("=");
                                        $("input[name='" + vals[0] + "'][value='" + splitFq[i] + "']").attr('checked', true);
                                    }
                                }
    </script>   

</body>

</html>
