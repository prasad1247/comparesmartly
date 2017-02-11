<!DOCTYPE html>
<html lang="en">
    <%

        String title = "Compare Smartly | About Us", keywords = "", desc = "Compare Smartly | About Us", myUrl = "", myImg = "";
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
                            <h3 class="text-center">About Us</h3>
 
<p>At CompareSmartly, We Are Focused On Revolutionizing The Way People Shop, Specially Big Ticket Items.
Currently The Efforts Involved In Finding The Product You Want At A Reasonable Price Are Quite Involved. 
Most Of The People I Know They Simply Sign Into Flipkart, Amazon And Purchase Stuff From There.</p>

<p>You Can Simply Visit Our Site And Be Assured That
    We Have Done The Due Diligence In Finding The Best Deal (Note Not Just The Best Price) Out There.</p>
<p>We Constantly Refresh Our Databases With The Latest Price And Deal Information From The Most Reliable Online Stores.
Our Exponentially Increasing Traffic Is Live Testimony Of The Quality Of Service We Are Able To Provide To Shoppers. 
After All Retail Therapy Is Supposed To Make You Feel Better Not Keep You Worried Whether Or Not You Got A Good Deal!</p>


<p class="text-info">Note: We Are Scraping Data From Various Sites Such As flipkart.com,amazon.in,snapdeal.com Etc. 
    If You Are Owner Of Any Of These Sites And Want To Remove The Data Scrapped Please Contact At pd4prasad@gmail.com</p>
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
    <script src="https://use.fontawesome.com/1eb18839e7.js"></script>


</body>

</html>
