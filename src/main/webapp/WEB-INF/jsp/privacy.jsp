<!DOCTYPE html>
<html lang="en">
    <%

        String title = "", keywords = "", desc = "", myUrl = "", myImg = "";
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
                    <li><a href="${pageContext.request.contextPath}/">Home</a>
                    </li>
                    <li class="active"><a href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
                </ol>
                <div class="col-lg-offset-3 col-lg-8 row-eq-height">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3 class="text-center">Privacy Policy</h3>
                            Last Modified October 14, 2016
<p>At CompareSmartly.com ("CompareSmartly") we want you to know exactly how and when we collect and use information that can specifically identify you,
such as your name, mailing address, phone number, and email address ("personal information"). 
We do not require that you provide, nor do we collect, any personal information if you are just browsing the Site.
We may offer on the Site non-transactional and transaction based services ("Service(s)") in which, subject to applicable terms and availability,
you may participate (e.g., submitting product reviews). 
In order to provide you with the Services you request, CompareSmartly may require that you first provide certain personal information,
which we determine is reasonably necessary in order for us to fulfill your request. 
If you indicate an interest in participating in a Service, we will identify what specific personal information you must provide prior
to collecting such information. 
Any personal information which we collect from you will only be used for the purposes identified in this Privacy Statement,
the CompareSmartly Terms of Use and your applicable Member Agreement with CompareSmartly,
and as may otherwise be indicated at the time the information is collected.
CompareSmartly will not disclose your personal information to any third party unless: 
1) it is necessary in order to provide you with a particular Service you have requested; 
2) it is required of CompareSmartly in order to comply with a legal process in any applicable jurisdiction (e.g., court order, subpoena, search warrant,
law enforcement request); 
3) CompareSmartly determines, in its sole discretion, that disclosure is necessary to protect the rights, property, and safety of CompareSmartly,
its subsidiaries, affiliates, co-brand partners or other parties under contract with CompareSmartly, our users, or others; or
4) you have provided such data through a partner's private-level shopping web site hosted by CompareSmartly, in which case CompareSmartly may provide
your personal data to that partner (CompareSmartly is not responsible for its partners' privacy policies or their use, 
storage and processing of data collected on their web sites).
In addition, CompareSmartly may transmit information to a merchant, such as an invoice number, which may permit the merchant to deduce the identity
of a user/reviewer in the event that a merchant disputes a user review on the grounds that a transaction never took place between the user and
the merchant and/or an order was never made by the user in each case for the applicable product(s)/service(s). In certain instances,
CompareSmartly may request that you provide secondary information (e.g., demographic information), which we may use, for example,
to learn more about our customers and to develop and improve our services. Any requests for secondary information will be marked "optional"
(or its equivalent). We may compile your personal information with that collected from other customers to create aggregate data.
Aggregate data is information about groups of customers and, once compiled, will in no way identify you as an individual.
We may disclose aggregate data to our business affiliates, advertisers, and other parties. Our web servers collect from Site visitors? statistical
information regarding what pages are visited, the date and time of the visits, how long it took a user to download a page, 
and the TCP/IP address of the user. These automated server functions do not collect this information in a manner intended to identify your
individual use of the Site, nor do we use this information for any such purpose. 
This information is collected to assist us in maintaining a high quality site, as well as, providing necessary traffic information to our advertisers. We currently contract with several online partners to help manage and optimize our Internet business and communications. In conjunction with our in-house advertising, we use third-party advertising companies to place customized advertisements on the pages you view on the Site. Our third-party advertising companies also separately place or recognize a cookie file on your browser in the course of delivering advertisements to the Site. These companies may use non-personal information collected by the cookies about your visits to the Site and other web sites in order to provide you with advertisements about goods and services of interest to you. The Site contains links to web sites of third parties. CompareSmartly is not responsible for the actions of these third parties, including their privacy practices and any content posted on their web sites. We encourage you to review their privacy policies to learn more about what, why and how they collect and use personal information. CompareSmartly adheres to industry recognized standards to secure any personal information in our possession, and to secure it from unauthorized access and tampering. However, as is true with all online actions, it is possible that third parties may unlawfully intercept transmissions of personal information, or other users of the Site may misuse or abuse your personal information that they may collect from the Site. CompareSmartly uses third-party advertising companies to serve our ads on the Site. These third-party advertising companies employ cookie and 1x1 pixel .gifs or web beacons to measure and improve the effectiveness of ads for their clients.
To do so, these companies may use anonymous information about your visits to our website and other websites, but will not collect 
any information which can personally identify you or can be linked to you.
This information can include: date/time of banner ad shown, the banner ad that was shown, their cookie, and the IP address.
This information can also be used for online preference marketing purposes.</p>

NOTE: All logos shown on CompareSmartly website are trademarks of their respective owners.
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <hr>

        <!-- Footer -->
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


</body>

</html>
