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
        ArrayList<ProductBean> productList = (ArrayList) request.getAttribute("dataList");
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
        int pageNo = 0;
        if (request.getAttribute("pageNo") != null) {
            pageNo = (Integer) request.getAttribute("pageNo");
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

        <title><%=title%></title>
        <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/res/img/logo/3rd_1.png"/>
        <meta name='description' content='<%=desc%>' />

        <meta property='og:title' content='<%=title%>' />
        <meta property='og:url' content='http://comparesmartly.in/<%=myUrl%>' />
        <meta property='og:image' content='<%=pBean.getImgLink()%>' />
        <meta property="og:type"   content="product.group" />
        <meta property='og:site_name' content='CompareSmartly' />	
        <meta property='og:description' content='<%=desc%>' />

        <meta name="twitter:site" content="@ngpricecheck">
        <meta name="twitter:title" content="<%=title%>">
        <meta name="twitter:description" content="<%=desc%>">
        <meta name="twitter:image" content="<%=pBean.getImgLink()%>">

        <% if (productList.size() == 20) {%>
        <link rel="next" href="${pageContext.request.contextPath}/<%=pBean.getCatUrl()%>?p=<%=pageNo%>"/>
        <%}
            if (pageNo > 2) {%>
        <link rel="prev" href="${pageContext.request.contextPath}/<%=pBean.getCatUrl()%>?p=<%=(pageNo - 2)%>"/>
        <%}%>


        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
            .panel-default>.panel-heading{
                background-color: #961440;
            }

        </style>

    </head>

    <body style="background-color: #F5F7F5; overflow-x: hidden">

        <!-- Navigation -->
        <jsp:include page="menu.jsp" />
        <!-- Page Content -->
        <div class="container-fluid">
            <!-- Page Heading/Breadcrumbs -->
            <!--  <div class="row">
                  <div class="col-lg-12">
                      <ol class="breadcrumb">
                          <li><a href="/">Home</a>
                          </li>
                          <li class="active"><a href="<%=myUrl%>"><%=title%></a></li>
                      </ol>
                  </div>
              </div>-->
            <!-- /.row -->

            <!-- Content Row -->
            <!-- /.row -->
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/<%=pBean.getHomeurl()%>"><%=pBean.getCategoryName()%></a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/<%=myUrl%>"><%=title%></a></li>
                </ol>
            </div>
            <div  itemscope itemtype="http://schema.org/Article">
                <div class="row">
                    <div class=" col-lg-8 row-eq-height col-lg-offset-3">
                        <div class="panel panel-default" >
                            <div class="panel-body">
                                <%   if (clId == 0) {%><% if (pBean.getBrandCatDesc() != null) {
                                        out.print("<div >" + pBean.getBrandCatDesc());%>
                                <span itemscope  itemtype="http://schema.org/ImageObject" itemprop="image">
                                    <meta itemprop="contentUrl" content="<%=pBean.getImgLink()%>">
                                    <meta itemprop="name" content="<%=title%>">
                                </span>
                                <span itemscope  itemtype="http://schema.org/Organization" itemprop="publisher">
                                    <meta itemprop="name" content="CompareSmartly"></span>
                            </div>
                            <%   }
                            } else {%>
                            <%if (pBean.getCatDesc() != null) {
                                    out.print("<div  itemscope itemtype=\"http://schema.org/Article\">" + pBean.getCatDesc());%>
                            <span itemscope  itemtype="http://schema.org/ImageObject" itemprop="image">
                                <meta itemprop="url" content="<%=pBean.getImgLink()%>">
                                <meta itemprop="height" content="350">
                                <meta itemprop="width" content="250">
                                <meta itemprop="name" content="<%=title%>">
                            </span>
                            <span itemscope  itemtype="http://schema.org/Organization" itemprop="publisher">
                                <meta itemprop="name" content="CompareSmartly">
                                <span itemscope  itemtype="http://schema.org/ImageObject" itemprop="logo">
                                    <meta itemprop="url" content="http://comparesmartly.in/res/img/logo/3rd_1.png">
                                    <meta itemprop="height" content="96">
                                    <meta itemprop="width" content="96">
                                    <meta itemprop="name" content="Compare Smartly>">
                                </span>
                            </span>
                        </div>
                        <%   }
                            }%>
                        <br>
                        <!-- Go to www.addthis.com/dashboard to customize your tools --> <div class="addthis_inline_share_toolbox"></div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <button class="visible-xs btn btn-primary" data-toggle="collapse" id="filterbtn" data-target="#SearchParameters">Filter</button>
                <div class="col-lg-3 hidden-xs SearchParameters visible-lg" id="SearchParameters">
                    <div class="">
                        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                        <!-- Compare Smartly 1 -->
                        <ins class="adsbygoogle"
                             style="display:block"
                             data-ad-client="ca-pub-9563290425479640"
                             data-ad-slot="3204650489"
                             data-ad-format="auto"></ins>
                        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
                        </script>
                    </div>
                    <form action="${pageContext.request.contextPath}/<%=pBean.getHomeurl()%>" method="post" id="finder-form" class="finder-form-fixed">
                        <div class="scroll">
                            <div class="panel panel-default">

                                <div class="panel-body">
                                    <div class="mdlarge-text">Price</div>
                                    <ul class="list-inline">
                                        <li><input type="checkbox" name="price" value="price=0-to-2000" data-text="Below Rs. 2,000">  Below Rs. 2,000 <li>
                                        <li><input type="checkbox" name="price" value="price=2000-to-5000" data-text="Rs. 2,000 - Rs. 5000"> Rs. 2,000 - Rs. 5000 <li>
                                        <li><input type="checkbox" name="price" value="price=5000-to-10000" data-text="Rs. 5,000 - Rs. 10,000"> Rs. 5,000 - Rs. 10,000 <li>
                                        <li><input type="checkbox" name="price" value="price=10000-to-15000" data-text="Rs. 10,000 - Rs. 15,000"> Rs. 10,000 - Rs. 15,000 <li>
                                        <li><input type="checkbox" name="price" value="price=15000-to-20000" data-text="Rs. 15,000 - Rs. 20,000"> Rs. 15,000 - Rs. 20,000 <li>
                                        <li><input type="checkbox" name="price" value="price=20000-to-25000" data-text="Rs. 20,000 - Rs. 25,000"> Rs. 20,000 - Rs. 25,000 <li>
                                        <li><input type="checkbox" name="price" value="price=25000-to-100000" data-text="Above Rs. 25,000"> Above Rs. 25,000 <li>
                                    </ul>
                                    <button type="submit" class="btn btn-primary pull-right" onclick="return getSearchData();">Search</button> 
                                </div>

                            </div>


                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="mdlarge-text">Brands</div>
                                    <div class="filterBox filter-scrollable" >
                                        <ul>
                                            <%                                        Iterator bitr = bMap.keySet().iterator();
                                                while (bitr.hasNext()) {
                                                    String bName = (String) bitr.next();
                                                    String data[] = ((String) bMap.get(bName)).split("#");
                                            %>
                                            <label class="checkbox"><input type="checkbox" name="brand" value="brand=<%=data[0]%>" ><i></i><a href="${pageContext.request.contextPath}/<%=data[1]%>"><%=bName%></a></label>
                                                    <%  }
                                                    %>
                                        </ul>
                                    </div>

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
                                    if (fList.size() == 0) {
                                        continue;
                                    }
                            %>
                            <div data-heading="Features">
                                <div class="panel panel-default">
                                    <div class="panel-body">

                                        <div class="mdlarge-text"><%=fBean.getFeatureName()%></div>
                                        <div class="col-lg-12">
                                            <ul class="list-unstyled"><%
                                                if (fList != null) {
                                                    for (String o : fList) {
                                                        String name = o.split("#")[0];
                                                        String val = o.split("#")[1];
                                                %>
                                                <li><input type="checkbox" name="<%=fid%>" value="<%=fid + "=" + name%>" > <%=name%></li>
                                                    <%    }
                                                        }
                                                    %>

                                            </ul>
                                            <button type="submit" class="btn btn-primary pull-right" onclick="return getSearchData();">Search</button> 
                                        </div>
                                    </div>     
                                </div>     
                            </div>     
                            <%  }
                            %>
                            <input type="hidden" name="filterQ" id="filterQ" value="<%=request.getAttribute("filterQ")%>">


                        </div>

                    </form>
                <!--    <div class="panel panel-default" >
                        <div class="panel-heading mdlarge-text">Popular Lists</div>
                        <div class="panel-body">
                            <% // ArrayList<ProductBean> catList = (ArrayList) request.getAttribute("catList");
                               // out.print("<ul  class=\"list-unstyled\">");
                               // for (ProductBean pb : catList) {
                               //     out.print("<li> <a href='" + pb.getUrl() + "'>" + pb.getProductName() + "</a></li>");
                               // }
                               // out.print("</ul>");
                            %>
                        </div>
                    </div>-->
                </div>
                <div class="col-lg-9">
                    <h1 class="text-center"><%=title%> </h1>
                    <div class="hidden-xs">
                        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                        <!-- Compare Smartly - header -->
                        <ins class="adsbygoogle"
                             style="display:block"
                             data-ad-client="ca-pub-9563290425479640"
                             data-ad-slot="1169514083"
                             data-ad-format="auto"></ins>
                        <script>
                                                (adsbygoogle = window.adsbygoogle || []).push({});
                        </script>
                    </div>
                    <%
                        //productList = new ArrayList();
                        for (ProductBean pb : productList) {
                    %>
                    <div class="row row-eq-height" itemprop="itemListElement">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-lg-2 col-xs-3">
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
                                        <div class="col-lg-7 col-xs-9">
                                            <h4><a  href="${pageContext.request.contextPath}<%="/" + pb.getpUrl()%>"><span ><%=pb.getProductName()%></span></a></h4>
                                            <p ><%=pb.getBrandName()%></p>
                                        </div>
                                        <div class="col-lg-3 col-xs-5">
                                            <div class="large-text"  style="color:forestgreen"><span content="INR"><i class="fa fa-inr" aria-hidden="true"></i></span>.<span  content="<%=pb.getNewPrice()%>"><%=pb.getNewPrice()%></span></div>
                                        </div>
                                        <div class="col-lg-2 col-xs-4">
                                            <a href="<%=pb.getSellerUrl()%>" target="_blank" rel="nofollow" class="btn btn-primary">Visit Seller</a>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-lg-12 col-xs-12">
                                            <%=pb.getPdesc()%>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <%        HashMap<String, ArrayList<String>> gMap = pb.getgFeatureMap();
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
                                                out.print("<tr ><td > " + glyph + " </td><td > <strong><span > " + fname + "</span> </strong> </td><td><span >" + fval + "</span></td></tr>");
                                            }%>

                                        <%    newRow++;
                                            }
                                            out.print("</table>");
                                            out.print("</div>");

                                        %>
                                        <%  out.print("<div class=\"info col-lg-6 col-xs-12\">");
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
                                    <%if (pb.getpListDesc().size() > 1) {%>
                                    <div class="row">
                                        <p class="mdlarge-text">Also featured in,</p>
                                        <div class="col-lg-6 col-xs-12">
                                            <% int listSize = 0;
                                                for (int o = 0; o < pb.getpListDesc().size(); o++) {
                                                    ProductBean pListBean = (ProductBean) pb.getpListDesc().get(o);
                                                    if (pListBean.getUrl().equals(myUrl)) {
                                                        continue;
                                                    }
                                                    if (listSize == 3) {
                                                        listSize = 0;
                                                        break;
                                                    }
                                                    listSize++;
                                            %>
                                            <%=pListBean.getPdesc()%>
                                                <%}%>
                                        </div>
                                        <div class="col-lg-6 col-xs-12">
                                            <% for (int o = 3; o < pb.getpListDesc().size(); o++) {
                                                    ProductBean pListBean = (ProductBean) pb.getpListDesc().get(o);
                                                    if (pListBean.getUrl().equals(myUrl)) {
                                                        continue;
                                                    }
                                                    if (listSize == 3) {
                                                        listSize = 0;
                                                        break;
                                                    }
                                                    listSize++;
                                            %>
                                            <p><a rel="nofollow" href="${pageContext.request.contextPath}/<%=pListBean.getUrl()%>"><%=pListBean.getPdesc()%></a></p>
                                                <%}%>
                                        </div>

                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <%}%>
                    <div class="clear"></div>
                    <p>  <% if (productList.size() == 20) {%>
                    <div class="load_more" ><a class="btn btn-success" href="${pageContext.request.contextPath}/<%=pBean.getCatUrl()%>?p=<%=pageNo%>">Load More</a></div>     
                    <%}
                        if (pageNo > 2) {%>
                    <div class="load_more" ><a  class="btn btn-info "  href="${pageContext.request.contextPath}/<%=pBean.getCatUrl()%>?p=<%=(pageNo - 2)%>">Previous</a></div>     
                    <%}%></p>

                </div>    

            </div>
        </div>

    </div>
    <hr>

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
<script src="${pageContext.request.contextPath}/res/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/1eb18839e7.js"></script>

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

                                                $('#slide_button').click(function () {
                                                    $('#slide').slideToggle('slow');
                                                });
                                                $(function () {
                                                    setFilters();
                                                });
</script>   
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-12224560-9', 'auto');
    ga('send', 'pageview');

</script>
<!-- Go to www.addthis.com/dashboard to customize your tools --> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-584277fa51384aa2"></script> 	
</body>

</html>
