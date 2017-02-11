<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.sc.bean.FeatureBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

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
                <div class="col-lg-3 row-eq-height">
                    <div class="simg">
                        <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" title="Samsung Galaxy J3 Pro">
                            <img class="img img-responsive" src="http://www.91-img.com/pictures/lenovo-k5-note-mobile-phone-large-1.jpg" alt="Samsung Galaxy J3 Pro">
                        </a>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="row row-eq-height">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-lg-12 col-xs-8">
                                    <h3><a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq">Samsung Galaxy J3 Pro</a></h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-xs-4">
                                    <h3><a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq"><span class="">Rs. 10,999</span></a></h3>
                                </div>
                                <div class="col-lg-2 col-xs-4">
                                    <button type="button" class="btn btn-primary btn-lg">Go to Flipkart</button>   
                                </div>
                            </div>
                            <div class="row">
                                <div class="info col-lg-6 col-xs-6">
                                    <div class="product-features">
                                        <h4>Product Features:</h4>
                                         <div class="row">
                                <%
                                    HashMap<String, FeatureBean> gidToFMap = (HashMap) request.getAttribute("gidToFMap");
                                    HashMap<String, String> gpFeatureMap = (HashMap) request.getAttribute("gpFeatureMap");
                                    Iterator itr = gidToFMap.keySet().iterator();
                                    HashMap<String, ArrayList<String>> gMap = new HashMap();
                                    ArrayList gList = null;
                                    while (itr.hasNext()) {
                                        String fId = (String) itr.next();
                                        FeatureBean fBean = gidToFMap.get(fId);
                                        if (fBean.getFeatureGroup().equals("Connectivity")) {
                                            continue;
                                        }
                                        if (gMap.containsKey(fBean.getFeatureGroup())) {
                                            gList = gMap.get(fBean.getFeatureGroup());
                                        } else {
                                            gList = new ArrayList();
                                        }
                                        gList.add("<strong>" + fBean.getFeatureName() + " : </strong>" + gpFeatureMap.get(fId));
                                        gMap.put(fBean.getFeatureGroup(), gList);
                                    }
                                    itr = gMap.keySet().iterator();
                                %>

                                <%
                                    while (itr.hasNext()) {
                                        String fId = (String) itr.next();
                                        ArrayList<String> sList = gMap.get(fId);
                                %>
                                <div class="info col-lg-4 col-xs-6">
                                    <h4><%=fId%></h4>
                                    <ul class="">
                                        <% for (String data : sList) {
                                                out.print("<li>" + data + "</li>");
                                            }%>
                                    </ul>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                                    </div>

                                </div>
                                <div class="col-lg-6 col-xs-6">
                                    <h4>Product Glance:</h4>
                                    <ul class="pros"><li><i class="i-tick-check"></i>1st in Design</li>
                                        <li><i class="i-tick-check"></i>1st in Price Category 10000-15000</li>
                                        <li><i class="i-tick-check"></i>3rd in Speed</li>
                                        <li><i class="i-tick-check"></i>2nd in Camera </li>
                                    </ul><ul class="cons"><li><i class="i-tick-check"></i>2nd in Display</li>
                                        <li><i class="i-tick-check"></i>2nd in Battery Backup</li>
                                        <li><i class="i-tick-check"></i>1st in Value for money</li>
                                    </ul><div class="clear">
                                    </div>			
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>


                </div>     
            </div>
            <div class="row">
                <div class="col-lg-9 row-eq-height">

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div id="descBox" class="sub_inner_box border">
                                <h2 class="head_bdr">Lenovo K5 Note description</h2>
                                <div style="margin-top: 15px;"></div>
                                <div class="inner_heading">Buy For</div>
                                <div class="clr"></div>
                                <div><ul class="buyFor_ul"><li><span style="" initial="">Beautifully made device</span></li><li>
                                            <span >Good pair of shooters</span></li><li><span style="" initial="">Massive battery</span></li><li><span style="" initial="">Great storage</span></li><li><span style="" initial="">Ample RAM</span></li></ul></div>                <div class="inner_heading">Beware of</div>
                                <div class="clr"></div>
                                <ul class="buyFor_ul"><li><span style="" initial="">Non-removable battery</span></li></ul>        <div class="clr"></div>


                                <div class="inner_heading">Verdict</div>
                                <div class="clr"></div>
                                <p class="details_p"></p><div>The Lenovo K5 Note is a great mid-range phone from the Chinese manufacturer Lenovo. It's a combination of great hardware and specs provide seamless experience. Just like its predecessor, the K5 Note also sports a fingerprint sensor which provides added security.</div><p></p>
                                <div class="inner_heading">An all rounder in budget</div> 

                                <div class="details_p display" id="details_p"><div><b>Display and Configuration</b></div><div><br></div><div>The Lenovo K5 Note sports a 5.5-inch full HD display with a resolution of &nbsp;1,080x1,920 pixels resulting in an impressive pixel density of 401ppi. The phone has a beautiful metal body with a waistline of 8.0mm and weighs 152 grams. This device gets all its strength from a 1.8GHz octa-core processor which is seated on a MediaTek chipset and paired with 4GB of RAM for great multitasking and a Mali-T860 MP2 GPU for a good gaming experience. Android Marshmallow works as the OS on this phone. It also sports a fingerprint sensor at the back just like its predecessor K4 Note.</div><div><br></div><div><b>Camera and Storage</b></div><div><br></div><div>The Lenovo K5 Note is equipped with 13MP autofocus primary camera with dual LED flash and CMOS image sensor. The camera quality is further enhanced by some inbuilt features like AF Phase Detection, Auto Flash, Continuos Shooting, Exposure compensation, Face detection, Geo tagging, High Dynamic Range mode (HDR), ISO control, Touch to focus, White balance presets. It comes with an 8MP front camera which is a treat for the selfie lovers.</div><div><br></div><div>The phone comes with massive 32GB of storage for storing large amount of data, but still you can expand the storage up to 128GB with the help of an external microSD card.</div><div><br></div><div><b>Battery and Connectivity</b></div><div><br></div><div>A massive 3,500mAh li-po non-removable battery supplies all the needed juice to the phone and makes sure that the smartphone runs for a long time. The K5 Note is equipped with usual connectivity features such as 3G, 4G LTE, Wi-Fi, Bluetooth and micro USB.</div> </div><span class="readmore overviewDesc">Read more</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 row-eq-height">
                    <div class="sidebardiv widget"><div class="sidebardivheader">More Recommended Deals</div><div class="sidebardivlist "><a href="/deals/free-samples-of-olay-ariel-head-shoulders-dealid127922?sidebar=1" class="sidelistout"><div class="sideimg"><img src="https://fd379b09dfe5fd258cee-4c7efcc0fa50ed2f0ba8ecc23dd2f42d.ssl.cf1.rackcdn.com/127922-731-thumb.jpg"></div><div class="sidedet"><div class="sidetitle">Free Samples of Olay, Ariel, Head &amp; Shoulders</div><div class="item-price"><span class="icon">@</span><span class="new">Rewardme Free Samples </span></div></div></a></div><div class="sidebardivlist "><a href="/deals/kaspersky-internet-security-multidevice-dealid164451?sidebar=1" class="sidelistout"><div class="sideimg"><img src="https://fd379b09dfe5fd258cee-4c7efcc0fa50ed2f0ba8ecc23dd2f42d.ssl.cf1.rackcdn.com/164451-afd-thumb.jpg"></div><div class="sidedet"><div class="sidetitle">Kaspersky Internet Security ? Multi-Device</div><div class="item-price"><span class="icon">@</span><span class="new">Free Premium Protection</span></div></div></a></div><div class="sidebardivlist "><a href="/deals/vatika-brave-beautiful-oil-shampoo-dealid127875?sidebar=1" class="sidelistout"><div class="sideimg"><img src="https://fd379b09dfe5fd258cee-4c7efcc0fa50ed2f0ba8ecc23dd2f42d.ssl.cf1.rackcdn.com/127875-a07-thumb.jpg"></div><div class="sidedet"><div class="sidetitle">Vatika Brave &amp; Beautiful Oil &amp; Shampoo</div><div class="item-price"><span class="icon">@</span><span class="new">Free Sample </span></div></div></a></div><div class="sidebardivlist "><a href="/deals/idea-postpaid-bill-payment-offer-idea-money-dealid171938?sidebar=1" class="sidelistout"><div class="sideimg"><img src="https://fd379b09dfe5fd258cee-4c7efcc0fa50ed2f0ba8ecc23dd2f42d.ssl.cf1.rackcdn.com/171938-af9-thumb.jpg"></div><div class="sidedet"><div class="sidetitle">Idea Postpaid Bill Payment Offer @ Idea Money</div><div class="item-price"><span class="icon">@</span><span class="new">5% Cashback on Postpaid Payment </span></div></div></a></div><div class="sidebardivlist more"><a href="/deals/tags/mobiles-tablets-deals-317?sidebar=1" class="dealsidelistout" style="font-weight:bold;">All Mobiles &amp; Tablets deals</a></div></div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            General
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6 ">
                                   <h4> Launch Date</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    March 9, 2016 (Official)
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6 ">
                                  <h4>  Brand</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    Xiaomi
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                 <h4>   Model</h4>
                                </div>    
                                <div class="col-lg-6">
                                    Redmi Note 3 32GB
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                  <h4>  Operating System</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    Android v5.1 (Lollipop)
                                </div>    
                            </div>
                        </div>
                    </div>
                           <div class="panel panel-default">
                        <div class="panel-heading">
                            General
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6 ">
                                   <h4> Launch Date</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    March 9, 2016 (Official)
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6 ">
                                  <h4>  Brand</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    Xiaomi
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                 <h4>   Model</h4>
                                </div>    
                                <div class="col-lg-6">
                                    Redmi Note 3 32GB
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                  <h4>  Operating System</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    Android v5.1 (Lollipop)
                                </div>    
                            </div>
                        </div>
                    </div>
                </div>
                  <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            General
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6 ">
                                   <h4> Launch Date</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    March 9, 2016 (Official)
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6 ">
                                  <h4>  Brand</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    Xiaomi
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                 <h4>   Model</h4>
                                </div>    
                                <div class="col-lg-6">
                                    Redmi Note 3 32GB
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                  <h4>  Operating System</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    Android v5.1 (Lollipop)
                                </div>    
                            </div>
                        </div>
                    </div>
                           <div class="panel panel-default">
                        <div class="panel-heading">
                            General
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6 ">
                                   <h4> Launch Date</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    March 9, 2016 (Official)
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6 ">
                                  <h4>  Brand</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    Xiaomi
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                 <h4>   Model</h4>
                                </div>    
                                <div class="col-lg-6">
                                    Redmi Note 3 32GB
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                  <h4>  Operating System</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    Android v5.1 (Lollipop)
                                </div>    
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Design
                        </div>
                        <div class="panel-body">
                            <div class="row ">
                                <div class="col-lg-6 ">
                                    <h4> Dimensions</h4>
                                </div>    
                                <div class="col-lg-6">
                                    150 (H) x 76 (W) x 8.6 (T) mm 
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6 ">
                                    <h4>Weight</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    164 grams
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6 ">
                                    <h4> Build Material</h4>
                                </div>    
                                <div class="col-lg-6">
                                    Case: Metal
                                    Back: Metal
                                </div>    
                            </div>
                        </div>
                    </div>
                           <div class="panel panel-default">
                        <div class="panel-heading">
                            General
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6 ">
                                   <h4> Launch Date</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    March 9, 2016 (Official)
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6 ">
                                  <h4>  Brand</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    Xiaomi
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                 <h4>   Model</h4>
                                </div>    
                                <div class="col-lg-6">
                                    Redmi Note 3 32GB
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                  <h4>  Operating System</h4>
                                </div>    
                                <div class="col-lg-6 ">
                                    Android v5.1 (Lollipop)
                                </div>    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="row">
             <div class="col-lg-12">
                    <div class="simg">
                        <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" title="Samsung Galaxy J3 Pro">
                            <h3>Alternatives to Xiomi Redmi 3s</h3>
                        </a>
                    </div>
                </div>
             </div>
           <div class="row">
                <div class="col-lg-3 col-xs-4 row-eq-height">
                    <div class="simg">
                        <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" title="Samsung Galaxy J3 Pro">
                            <img class="img img-responsive" src="http://www.91-img.com/pictures/lenovo-k5-note-mobile-phone-large-1.jpg" alt="Samsung Galaxy J3 Pro">
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-4 row-eq-height">
                    <div class="simg">
                        <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" title="Samsung Galaxy J3 Pro">
                            <img class="img img-responsive" src="http://www.91-img.com/pictures/lenovo-k5-note-mobile-phone-large-1.jpg" alt="Samsung Galaxy J3 Pro">
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-xs-4 row-eq-height">
                    <div class="simg">
                        <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" title="Samsung Galaxy J3 Pro">
                            <img class="img img-responsive" src="http://www.91-img.com/pictures/lenovo-k5-note-mobile-phone-large-1.jpg" alt="Samsung Galaxy J3 Pro">
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 hidden-xs row-eq-height">
                    <div class="simg">
                        <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" title="Samsung Galaxy J3 Pro">
                            <img class="img img-responsive" src="http://www.91-img.com/pictures/lenovo-k5-note-mobile-phone-large-1.jpg" alt="Samsung Galaxy J3 Pro">
                        </a>
                    </div>
                </div>
           </div>
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

    </body>

</html>
