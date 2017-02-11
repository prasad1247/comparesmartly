<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.sc.bean.HeaderBean"%>
<div class="bootstrap_container">
    <nav class="navbar navbar-default w3_megamenu" role="navigation">
        <div class="navbar-header">
            <button type="button" data-toggle="collapse" data-target="#defaultmenu" class="navbar-toggle"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a href="${pageContext.request.contextPath}/ng/newhome" class="navbar-brand"><i class="fa fa-home"></i></a>
        </div><!-- end navbar-header -->

        <div id="defaultmenu" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath}/ke/newhome">Home</a></li>
                <!-- Mega Menu -->
                <%
                    HeaderBean hbean = null;//(HeaderBean) request.getAttribute("HeaderBean");
                    ServletContext sc = request.getServletContext();
                    HashMap rootMap = null;
                    rootMap = (HashMap) sc.getAttribute("menu");
                    String rootCat = "";
                    String parentCat = "";
                    try {

                        Iterator rItr = rootMap.keySet().iterator();
                        int i = 0;
                        while (rItr.hasNext()) {
                            if (i > 5) {
                                break;
                            }
                            i++;
                            rootCat = (String) rItr.next();
                            HashMap parentMap = (HashMap) rootMap.get(rootCat);
                            out.print("<li class=\"dropdown\"><a href=\"#\" data-toggle=\"dropdown\" class=\"dropdown-toggle\">" + rootCat + " <b class=\"caret\"></b></a>");
                            out.print(" <ul class=\"dropdown-menu\" role=\"menu\">");
                           /* if (rootCat.equals("Mobile Phones")) {
                                if (hbean.getMobileBrandList() != null && hbean.getMobileBrandList().size() > 6) {
                                    out.print("<li class=\"dropdown-submenu\"><a href=\"#\">Mobiles</a><ul class=\"dropdown-menu\">");
                                    ArrayList hList = hbean.getMobileBrandList();
                                    out.print("<li><a href=\"all-mobiles-in-kenya\">All Mobiles</a></li>");
                                    for (int j = 0; j < 6; j++) {
                                        ProductBean sb = (ProductBean) hList.get(j);
                                        out.print("<li><a href=\"" + sb.getbUrl() + "\">" + sb.getBrandName() + "</a></li>");
                                    }
                                }
                                out.print("</ul> </li>");
                            }*/
                            Iterator pItr = parentMap.keySet().iterator();
                            while (pItr.hasNext()) {
                                parentCat = (String) pItr.next();
                                ArrayList childList = (ArrayList) parentMap.get(parentCat);
                                String check = (String) childList.get(0);
                                if (!check.contains("#")) {
                                    out.print("<li><a href=\"" + check + "\">" + parentCat + "</a></li>");
                                } else {
                                    out.print("<li class=\"dropdown-submenu\"><a href=\"#\">" + parentCat + "</a><ul class=\"dropdown-menu\">");
                                    for (Object o : childList) {
                                        String catList[] = ((String) o).split("#");
                                        if (catList.length > 1) {
                                            out.print("<li><a href=\""+sc.getContextPath()+"/" + catList[1] + "\">" + catList[0] + "</a></li>");
                                            
                                        }
                                    }
                                    out.print("</ul> </li>");
                                }
                            }
                            out.print("</ul> </li>");
                        }
                %>
                <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Other <b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu">
                        <%while (rItr.hasNext()) {
                                    rootCat = (String) rItr.next();
                                    HashMap parentMap = (HashMap) rootMap.get(rootCat);
                                    out.print("<li class=\"dropdown-submenu\"><a href=\"#\">" + rootCat + "</a><ul class=\"dropdown-menu\">");
                                    Iterator pItr = parentMap.keySet().iterator();
                                    while (pItr.hasNext()) {
                                        parentCat = (String) pItr.next();
                                        ArrayList childList = (ArrayList) parentMap.get(parentCat);
                                        String check = (String) childList.get(0);
                                        if (!check.contains("#")) {
                                            out.print("<li><a href=\"" + check + "\">" + parentCat + "</a></li>");
                                        } else {
                                            out.print("<li class=\"dropdown-submenu pull-left \"><a href=\"#\">" + parentCat + "</a><ul class=\"dropdown-menu\">");
                                            for (Object o : childList) {
                                                String catList[] = ((String) o).split("#");
                                                if (catList.length > 1) {
                                                    out.print("<li><a href=\"" + catList[1] + "\">" + catList[0] + "</a></li>");
                                                }
                                            }
                                            out.print("</ul> </li>");
                                        }
                                    }
                                    out.print("</ul> </li>");
                                }
                            } catch (Exception e) {
                                System.out.println(" paren " + parentCat);
                                System.out.println(" root " + rootCat);
                                System.out.println(parentCat);
                                e.printStackTrace();
                            }
                        %>
                    </ul><!-- end dropdown-menu -->

                </li><!-- end standard drop down -->
            </ul><!-- end nav navbar-nav -->
        </div><!-- end #navbar-collapse-1 -->

    </nav><!-- end navbar navbar-default w3_megamenu -->
</div>