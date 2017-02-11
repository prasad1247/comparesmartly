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
                <div class="col-lg-2 row-eq-height">
                    <h2 class="sidebar-heading">Filter Results</h2>
                    <form action="http://www.smartprix.com/mobiles/smartphone-type?sort=pop&amp;asc=0" method="GET" id="finder-form" class="finder-form-fixed">
                        <div class="scroll">

                            <div class="content-section" style="margin-bottom: 0;">
                                <div class="content-subsection filter-search" style="padding-bottom: 5px;" data-heading="Find Criteria">
                                    <h3 class="heading">Find Criteria</h3>
                                    <div class="filterBox">
                                        <input type="text" id="filter-features-text-box" placeholder="Find Criteria">
                                    </div>
                                </div>

                            </div>

                            <div class="content-section" id="ajax-facet-section">
                                <div class="content-subsection filter-price" data-heading="Price">
                                    <h3 class="heading">Price</h3>
                                    <a class="button no-img clear-filters">Clear</a>
                                    <ul class="checkbox-table">
                                        <li><a href="javascript:;"><label><input type="checkbox" value="^price-below_1000" data-text="Below Rs. 1,000">Below Rs. 1,000 <span class="count">(3)</span></label></a></li>							<li><a href="javascript:;"><label><input type="checkbox" value="^price-1000_to_2000" data-text="Rs. 1,000 - Rs. 2,000">Rs. 1,000 - Rs. 2,000 <span class="count">(96)</span></label></a></li>							<li><a href="javascript:;"><label><input type="checkbox" value="^price-2000_to_5000" data-text="Rs. 2,000 - Rs. 5,000">Rs. 2,000 - Rs. 5,000 <span class="count">(1317)</span></label></a></li>							<li><a href="javascript:;"><label><input type="checkbox" value="^price-5000_to_10000" data-text="Rs. 5,000 - Rs. 10,000">Rs. 5,000 - Rs. 10,000 <span class="count">(1394)</span></label></a></li>							<li><a href="javascript:;"><label><input type="checkbox" value="^price-10000_to_20000" data-text="Rs. 10,000 - Rs. 20,000">Rs. 10,000 - Rs. 20,000 <span class="count">(838)</span></label></a></li>							<li><a href="javascript:;"><label><input type="checkbox" value="^price-20000_to_25000" data-text="Rs. 20,000 - Rs. 25,000">Rs. 20,000 - Rs. 25,000 <span class="count">(252)</span></label></a></li>							<li><a href="javascript:;"><label><input type="checkbox" value="^price-above_25000" data-text="Above Rs. 25,000">Above Rs. 25,000 <span class="count">(352)</span></label></a></li>			
                                    </ul>
                                </div>
                            </div>
                            <div class="content-subsection filter-brands" data-heading="Brands">
                                <h3 class="heading">Brands</h3>
                                <a class="button no-img clear-filters">Clear</a>
                                <div class="filterBox">
                                    <input type="text" placeholder="Search For A Brand">
                                    <a title="Clear Search Box" class="search-clear"></a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-8">
                    <div class="row row-eq-height">
                        <div class="col-lg-2 col-xs-4">
                            <div class="score-val" style="float:left;">59</div>
                            <div class="simg">
                                <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" title="Samsung Galaxy J3 Pro">
                                    <img class="img img-responsive" src="http://img2.smartprix.com/mobiles/1101dhfwv8t/n-1/xiaomi_redmi_3.jpg" alt="Samsung Galaxy J3 Pro">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-lg-8 col-xs-8">
                                    <h3><a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq">Samsung Galaxy J3 Pro</a></h3>
                                </div>
                                <div class="col-lg-4 col-xs-4">
                                    <h3><a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq"><span class="">Rs. 10,999</span></a></h3>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="info col-lg-4 col-xs-6">
                                    <div class="product-features">
                                        <h4>Product Features:</h4>
                                        <ul class="pros"><li><i class="i-tick-check"></i>Dual Sim, 4G, 3G, Wi-Fi, NFC</li><li><i class="i-tick-check"></i>Quad Core, 1.2 GHz Processor</li><li><i class="i-tick-check"></i>2 GB RAM, 16 GB inbuilt</li><li><i class="i-tick-check"></i>2600 mAH Battery</li></ul><ul class="cons"><li><i class="i-tick-check"></i>5 inches, 720 x 1280 px display</li><li><i class="i-tick-check"></i>8 MP Camera with flash</li><li><i class="i-tick-check"></i>Memory Card Supported</li><li><i class="i-tick-check"></i>Android, v5.1</li></ul><div class="clear"></div>					<a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq?tab=specifications" class="top-link" idx="2">See Full Specifications</a>
                                    </div>

                                </div>
                                <div class="col-lg-4 col-xs-6">
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
                                <div class="info col-lg-4">
                                    <div class="product-features">
                                        <h3>Recommanded For:</h3>
                                        <ul class="pros"><li><i class="i-tick-check"></i>For Gamers</li><li><i class="i-tick-check"></i>For Professionals</li><li><i class="i-tick-check"></i>For everyday Users</li><li><i class="i-tick-check"></i>For Techno Savys</li>
                                    </div>
                                    <div class="extra">
                                        
                                        <span title="User ratings: 3.9/5" class="rating r14"><i style="width:78%"></i></span>	
                                        <a class="button compare btn btn-primary" pid="1101128dziq" pname="Samsung Galaxy J3 Pro" data-cat="1101"><i class="i-btn-cmp"></i><span>compare</span></a>			
                                        <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" class="button shop btn btn-primary">See Details</a>
                                        <!--<a href="#" class="button fav">Favourite</a>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row row-eq-height">
                        <div class="col-lg-2">
                            <div class="score-val" style="float:left;">59</div>
                            <div class="simg">
                                <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" title="Samsung Galaxy J3 Pro">
                                    <img class="img img-responsive" src="http://img2.smartprix.com/mobiles/1101dhfwv8t/n-1/xiaomi_redmi_3.jpg" alt="Samsung Galaxy J3 Pro">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-lg-8">
                                    <h3><a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq">Samsung Galaxy J3 Pro</a></h3>
                                </div>
                                <div class="col-lg-4">
                                    <h3><a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq"><span class="">Rs. 10,999</span></a></h3>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="info col-lg-4">
                                    <div class="product-features">
                                        <h4>Product Features:</h4>
                                        <ul class="pros"><li><i class="i-tick-check"></i>Dual Sim, 4G, 3G, Wi-Fi, NFC</li><li><i class="i-tick-check"></i>Quad Core, 1.2 GHz Processor</li><li><i class="i-tick-check"></i>2 GB RAM, 16 GB inbuilt</li><li><i class="i-tick-check"></i>2600 mAH Battery</li></ul><ul class="cons"><li><i class="i-tick-check"></i>5 inches, 720 x 1280 px display</li><li><i class="i-tick-check"></i>8 MP Camera with flash</li><li><i class="i-tick-check"></i>Memory Card Supported</li><li><i class="i-tick-check"></i>Android, v5.1</li></ul><div class="clear"></div>					<a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq?tab=specifications" class="top-link" idx="2">See Full Specifications</a>
                                    </div>

                                </div>
                                <div class="col-lg-4">
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
                                <div class="info col-lg-4">
                                    <div class="product-features">
                                        <h3>Recommanded For:</h3>
                                        <ul class="pros"><li><i class="i-tick-check"></i>For Gamers</li><li><i class="i-tick-check"></i>For Professionals</li><li><i class="i-tick-check"></i>For everyday Users</li><li><i class="i-tick-check"></i>For Techno Savys</li>
                                    </div>
                                    <div class="extra">
                                        
                                        <span title="User ratings: 3.9/5" class="rating r14"><i style="width:78%"></i></span>	
                                        <a class="button compare btn btn-primary" pid="1101128dziq" pname="Samsung Galaxy J3 Pro" data-cat="1101"><i class="i-btn-cmp"></i><span>compare</span></a>			
                                        <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" class="button shop btn btn-primary">See Details</a>
                                        <!--<a href="#" class="button fav">Favourite</a>-->
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="clear"></div>
                    <div class="row row-eq-height">
                        <div class="col-lg-2">
                            <div class="score-val" style="float:left;">59</div>
                            <div class="simg">
                                <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" title="Samsung Galaxy J3 Pro">
                                    <img class="img img-responsive" src="http://img2.smartprix.com/mobiles/1101dhfwv8t/n-1/xiaomi_redmi_3.jpg" alt="Samsung Galaxy J3 Pro">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-lg-8">
                                    <h3><a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq">Samsung Galaxy J3 Pro</a></h3>
                                </div>
                                <div class="col-lg-4">
                                    <h3><a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq"><span class="">Rs. 10,999</span></a></h3>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="info col-lg-4">
                                    <div class="product-features">
                                        <h4>Product Features:</h4>
                                        <ul class="pros"><li><i class="i-tick-check"></i>Dual Sim, 4G, 3G, Wi-Fi, NFC</li><li><i class="i-tick-check"></i>Quad Core, 1.2 GHz Processor</li><li><i class="i-tick-check"></i>2 GB RAM, 16 GB inbuilt</li><li><i class="i-tick-check"></i>2600 mAH Battery</li></ul><ul class="cons"><li><i class="i-tick-check"></i>5 inches, 720 x 1280 px display</li><li><i class="i-tick-check"></i>8 MP Camera with flash</li><li><i class="i-tick-check"></i>Memory Card Supported</li><li><i class="i-tick-check"></i>Android, v5.1</li></ul><div class="clear"></div>					<a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq?tab=specifications" class="top-link" idx="2">See Full Specifications</a>
                                    </div>

                                </div>
                                <div class="col-lg-4">
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
                                <div class="info col-lg-4">
                                    <div class="product-features">
                                        <h3>Recommanded For:</h3>
                                        <ul class="pros"><li><i class="i-tick-check"></i>For Gamers</li><li><i class="i-tick-check"></i>For Professionals</li><li><i class="i-tick-check"></i>For everyday Users</li><li><i class="i-tick-check"></i>For Techno Savys</li>
                                    </div>
                                    <div class="extra">
                                        
                                        <span title="User ratings: 3.9/5" class="rating r14"><i style="width:78%"></i></span>	
                                        <a class="button compare btn btn-primary" pid="1101128dziq" pname="Samsung Galaxy J3 Pro" data-cat="1101"><i class="i-btn-cmp"></i><span>compare</span></a>			
                                        <a href="http://www.smartprix.com/mobiles/samsung-galaxy-j3-pro-p1101128dziq" class="button shop btn btn-primary">See Details</a>
                                        <!--<a href="#" class="button fav">Favourite</a>-->
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="clear"></div>
                    

                </div>     
                <div class="col-lg-2 row-eq-height">
                <div class="sidebardiv widget"><div class="sidebardivheader">More Recommended Deals</div><div class="sidebardivlist "><a href="/deals/free-samples-of-olay-ariel-head-shoulders-dealid127922?sidebar=1" class="sidelistout"><div class="sideimg"><img src="https://fd379b09dfe5fd258cee-4c7efcc0fa50ed2f0ba8ecc23dd2f42d.ssl.cf1.rackcdn.com/127922-731-thumb.jpg"></div><div class="sidedet"><div class="sidetitle">Free Samples of Olay, Ariel, Head &amp; Shoulders</div><div class="item-price"><span class="icon">@</span><span class="new">Rewardme Free Samples </span></div></div></a></div><div class="sidebardivlist "><a href="/deals/kaspersky-internet-security-multidevice-dealid164451?sidebar=1" class="sidelistout"><div class="sideimg"><img src="https://fd379b09dfe5fd258cee-4c7efcc0fa50ed2f0ba8ecc23dd2f42d.ssl.cf1.rackcdn.com/164451-afd-thumb.jpg"></div><div class="sidedet"><div class="sidetitle">Kaspersky Internet Security ? Multi-Device</div><div class="item-price"><span class="icon">@</span><span class="new">Free Premium Protection</span></div></div></a></div><div class="sidebardivlist "><a href="/deals/vatika-brave-beautiful-oil-shampoo-dealid127875?sidebar=1" class="sidelistout"><div class="sideimg"><img src="https://fd379b09dfe5fd258cee-4c7efcc0fa50ed2f0ba8ecc23dd2f42d.ssl.cf1.rackcdn.com/127875-a07-thumb.jpg"></div><div class="sidedet"><div class="sidetitle">Vatika Brave &amp; Beautiful Oil &amp; Shampoo</div><div class="item-price"><span class="icon">@</span><span class="new">Free Sample </span></div></div></a></div><div class="sidebardivlist "><a href="/deals/idea-postpaid-bill-payment-offer-idea-money-dealid171938?sidebar=1" class="sidelistout"><div class="sideimg"><img src="https://fd379b09dfe5fd258cee-4c7efcc0fa50ed2f0ba8ecc23dd2f42d.ssl.cf1.rackcdn.com/171938-af9-thumb.jpg"></div><div class="sidedet"><div class="sidetitle">Idea Postpaid Bill Payment Offer @ Idea Money</div><div class="item-price"><span class="icon">@</span><span class="new">5% Cashback on Postpaid Payment </span></div></div></a></div><div class="sidebardivlist more"><a href="/deals/tags/mobiles-tablets-deals-317?sidebar=1" class="dealsidelistout" style="font-weight:bold;">All Mobiles &amp; Tablets deals</a></div></div>
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

</body>

</html>
