/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.matcher;

import in.sc.bean.ProductBean;
import in.sc.dao.ListGenerator;
import in.sc.dao.ProductHelper;
import in.sc.download.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Random;

/**
 *
 * @author Asus
 */
public class TVDescGenerator {

    static int cat_id = 180;
    static DecimalFormat decimalFormatPattern = new DecimalFormat("0");
    static SimpleDateFormat dateFormat = new SimpleDateFormat("MMM yyyy");

    public static void main(String[] args) {
        getProducts(cat_id);
    }

    public static void getProducts(int cat_id) {
        HashMap inputMap = new HashMap();
        ListGenerator pHelper = new ListGenerator();
        Random rand = new Random();
        int[] clArr = {57};
        //int[] clArr = {28};
        for (int cl = 0; cl < clArr.length; cl++) {
            int cat_list_id = clArr[cl];
            ListGenerator li = new ListGenerator();
            ProductBean pBean = (ProductBean) li.getListsDetails(cat_list_id,cat_id).get(0);
            inputMap = pBean.getFilterMap();

//        inputMap.put(ProductHelper.category, cat_id);
//        inputMap.put(ProductHelper.minprice, 5000);
//        inputMap.put(ProductHelper.maxprice, 10000);
//        inputMap.put(ProductHelper.orderclause, "cast(f16 as decimal(10,2)) desc");
            inputMap.put(ProductHelper.to, 10);
            inputMap.put(ProductHelper.from, 0);
            String month = dateFormat.format(new Date());
            String cat_price = inputMap.get(ProductHelper.maxprice) + "";;
            String cat_price1 = ((int) (inputMap.get(ProductHelper.maxprice)) / 1000) + "K";
            String cat_name = "<strong>Best 42 inch TVs under Rs. " + cat_price + "</strong>";
            String cat_name1 = "42 inch TVs under Rs. " + cat_price+" in India";
            String cat_name4 = "Top 42 inch Samsung Televisions under " + cat_price+" in India | December 2016";
            String cat_name2 = "<strong>best 42 inch televisions under " + cat_price1 + "</strong>";
            String cat_name3 = "<strong>42 inch TVs with best features below Rs. " + cat_price + "</strong>";
            String cat_name5 = "42 inch TVs with best features below " + cat_price1;

            String[] cat_names = {cat_name, cat_name1, cat_name2, cat_name3, cat_name4, cat_name5};
            String cat_s_name = "<strong>best 42 inch tv under Rs. " + cat_price + "</strong>";
            String cat_s_name1 = "best 42 inch tv under Rs. " + cat_price;
            String cat_s_name2 = "<strong>best 42 inch television under " + cat_price1 + "</strong>";
            String cat_s_name3 = "<strong>best 42 inch television below " + cat_price + "</strong>";
            String cat_s_name5 = "<strong>42 inch television with best features below " + cat_price + "</strong>";
            String cat_s_name4 = "<strong>Top 42 inch tv below " + cat_price + "</strong>";

            String[] cat_s_names = {cat_s_name, cat_s_name1, cat_s_name2, cat_s_name3, cat_s_name4, cat_s_name5};
            int catId = 0 + rand.nextInt((cat_names.length - 1) - 0 + 1);
            int catsId = 0 + rand.nextInt((cat_s_names.length - 1) - 0 + 1);
            String metaCatName = cat_names[catId].replace("<strong>", "").replace("</strong>", "");
            String metaCatSName = cat_s_names[catsId].replace("<strong>", "").replace("</strong>", "");
            String[] cat_meta_desc = {"Want to know which is " + metaCatSName + "? Check out our list of " + metaCatName + ".",
                "Which TV you should buy under " + cat_price + "? View latest " + metaCatName + " in India and read their specs.",
                "You should not miss our list of " + metaCatName + ", while you hunt for televisions under " + cat_price,
                "Have a budget of Rs. " + cat_price + "? check out these " + metaCatName + " and take your pick",
                metaCatName + " in India for " + month + " based on comparesmartly ratings, read specs and prices of them.",
                metaCatName + ", We have compiled a list of " + metaCatName + " in India."
            };

//        for (int lll = 0; lll < cat_meta_desc.length; lll++) {
//            System.out.println(cat_meta_desc[lll]);
//        }
            String lastLine = "<em>Updated</em> : <time style=\"font-weight:bold\" itemprop=\"dateModified\" datetime=\"2016-11-28\">Nov 19, 2016</time>"
                + "<span style=\"margin-left:15px;\"><em>in</em> : <a href=\"http://comparesmartly.in/tv\" title=\"View all posts in Televisions\" itemprop=\"about\">TV</a> </span>"
                + "<span style=\"margin-left:15px;\"><em>Published By :</em><span itemprop=\"author\">  <a href='http://comparesmartly.in/' title=\"comparesmartly.in\" rel=\"publisher\">comparesmartly.in</a> </span></span>";
            lastLine+="<meta itemprop=\"datePublished\" content=\"2016-12-11\">";
            for(int l=0;l<cat_names.length;l++){
              lastLine+="  <meta itemprop=\"keywords\" content='"+cat_names[l].replace("<strong>","").replace("</strong>","")+"'/>";
            }
            ArrayList pList = (ArrayList) pHelper.getListProducts(inputMap);
            HashMap descMap = getDataForDesc(cat_id);
            HashMap<String, ProductBean> bestMap = new HashMap();
            double avgScore = 0, avgSize = 0, avgRes = 0, avgSpks = 0, avgBattery = 0, avgDisplay = 0, avgInternal = 0, avgPrice = 0;

            double size[] = {22, 23, 32, 40, 42, 50, 55, 60, 75, 79};
            double spkA[] = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30};
            String disA[] = {"HD ready", "Full HD", "4K"};
            int hReady = 0, fhd = 0, k4 = 0;
            double tsiz = 0, res = 0, hprice = 0, lprice = 999999999, sss = 0;
            String spkS = "", SizeS = "", resS = "", batteryS = "", displayS = "", internalS = "", fCameraS = "", hpriceS = "", lpriceS = "";
            for (int i = 0; i < pList.size(); i++) {
                ProductBean pb = (ProductBean) pList.get(i);
                HashMap<String, String> fMap = pb.getgFeatureMap();

                avgScore += pb.getSpecScore();
                avgPrice += pb.getNewPrice();
                if (fMap.get("f2") != null && !fMap.get("f2").equals("")) {
                    try {
                        int si = Integer.parseInt(fMap.get("f2").split(" ")[0]);
                        avgSize += si;

                        if (tsiz < si) {
                            bestMap.put("provides biggest size", pb);
                            tsiz = si;
                            SizeS = decimalFormatPattern.format(tsiz) + " Inch(<a href='" + pb.getUrl() + "'>" + pb.getProductName() + "</a>)";
                        }
                    } catch (Exception e) {
                        System.out.println(fMap.get("f2"));
                    }
                }
                if (fMap.get("f3") != null && !fMap.get("f3").equals("")) {
                    String[] ss = fMap.get("f3").split(",")[1].split(" ");
                    double tres = Double.parseDouble(ss[1]) * Double.parseDouble(ss[3]);
                    avgRes += tres;
                    if (res < tres) {
                        bestMap.put("has best resolution of", pb);
                        res = tres;
                        resS = fMap.get("f3").split(",")[1].trim() + " (<a href='" + pb.getUrl() + "'>" + pb.getProductName() + "</a>)";
                    }
                    if (fMap.get("f3").contains(disA[0])) {
                        hReady++;
                    }
                    if (fMap.get("f3").contains(disA[1])) {
                        fhd++;
                    }
                    if (fMap.get("f3").contains(disA[2])) {
                        k4++;
                    }
                }

                if (fMap.get("f6") != null && !fMap.get("f6").equals("")) {
                    avgSpks += Double.parseDouble(fMap.get("f6").split(" ")[0]);
                    if (sss < Double.parseDouble(fMap.get("f6").split(" ")[0])) {
                        bestMap.put("has best speaker output", pb);
                        sss = Double.parseDouble(fMap.get("f6").split(" ")[0]);
                        spkS = fMap.get("f6") + " (<a href='" + pb.getUrl() + "'>" + pb.getProductName() + "</a>)";
                    }
                }

                if (lprice > pb.getNewPrice()) {
                    bestMap.put("is cheapest", pb);
                    lprice = pb.getNewPrice();
                    lpriceS = lprice + "(<a href='" + pb.getUrl() + "'>" + pb.getProductName() + "</a>)";
                }

                if (hprice < pb.getNewPrice()) {
                    bestMap.put("is most priced", pb);
                    hprice = pb.getNewPrice();
                    hpriceS = hprice + "(<a href='" + pb.getUrl() + "'>" + pb.getProductName() + "</a>)";
                }
            }

            avgScore = Math.round(avgScore / pList.size());
            avgSize = avgSize / pList.size();
            avgSize = getAvg(size, avgSize);

            avgSpks = avgSpks / pList.size();
            avgSpks = getAvg(spkA, avgSpks);

            avgPrice = avgPrice / pList.size();
            int roundPrice = (int) (((Math.round(avgPrice) + 500) / 1000) * 1000);

            System.out.println("avgScore = 0, avgRam = 0, avgMCamera = 0, avgFCamera = 0, avgBattery = 0, avgDisplay = 0, avgInternal = 0, avgPrice = 0;");

            System.out.println(avgScore + "  " + avgSize + "  " + avgRes + "  " + avgSpks + "  " + avgBattery + "  " + avgDisplay + "  " + avgInternal + "  " + roundPrice);

            LinkedList descList = (LinkedList) descMap.get("cat_open");
            int id = 0 + rand.nextInt((descList.size() - 1) - 0 + 1);

            DescBean d = (DescBean) descList.get(id);
            catId = 0 + rand.nextInt((cat_names.length - 1) - 0 + 1);
            catsId = 0 + rand.nextInt((cat_s_names.length - 1) - 0 + 1);
            String cat_desc = "<a itemprop=\"mainEntityOfPage\" href=\"http://comparesmartly.in/tv/"+pBean.getUrl()+"\">"
                    + "<h1 style=\"text-align: center;\"  itemprop=\"headline\">" + cat_name + "</h1></a>";
            cat_desc+="<div itemprop=\"description\">";
            cat_desc += "<p>" + appendIdstoString(d, null, cat_names[catId], null, cat_s_names[catsId], cat_price) + "</p>";
            String c = "<p>In this category televisions are priced at around " + roundPrice + ". Lowest priced TV is only at "
                    + lpriceS + ", while highest priced TV can cost you around Rs." + hpriceS+"</p>";
            c += "<p> The avarage size in this list is around " + decimalFormatPattern.format(avgSize) + " inch and the highest size you can get in this category is " + SizeS + ".";
            c += " The average spkeakers you may get in this price list is roughly have " + avgSpks + "W, "
                    + " while Best Speakers in this category provide output of " + spkS + ".</p>";
            c += "<p>The best resolution of TVs in this list is " + resS + ". There are " + hReady + " HD Ready TVs";
            if (fhd > 0) {
                c += "," + fhd + " Full HD";
            }
            if (k4 > 0) {
                c += "and " + k4 + " 4K TVs";
            }
            c += " in this list";
            descList = (LinkedList) descMap.get("cat_close");
            id = 0 + rand.nextInt((descList.size() - 1) - 0 + 1);
            d = (DescBean) descList.get(id);
            String c1 = "<p>" + appendIdstoString(d, null, cat_name, null, cat_s_name, cat_price) + "</p>";
            
            cat_desc += c + c1 +"</div>"+ lastLine;      
            System.out.println(cat_desc);
            String catMdesc = cat_meta_desc[0 + rand.nextInt((cat_meta_desc.length - 1) - 0 + 1)];
            updateCat(cat_list_id, cat_desc, catMdesc);
            deletecatProducts(cat_list_id);

            for (int i = 0; i < pList.size(); i++) {
                ProductBean pb = (ProductBean) pList.get(i);
                StringBuilder str = new StringBuilder();
                HashMap<String, String> fMap = pb.getgFeatureMap();

                LinkedList ls = (LinkedList) descMap.get("open");
                if (ls.size() > i) {
                    d = (DescBean) ls.get(i);
                    catId = 0 + rand.nextInt((cat_names.length - 1) - 0 + 1);
                    catsId = 0 + rand.nextInt((cat_s_names.length - 1) - 0 + 1);

                    str.append("<p>" + appendIdstoString(d, fMap, cat_names[catId], pb, cat_s_names[catsId], cat_price) + "</p>");
                }
                Iterator<String> itr = bestMap.keySet().iterator();
                int morerdesc = 0;
                while (itr.hasNext()) {
                    String param = itr.next();
                    if (bestMap.get(param).getProductName().equals(pb.getProductName())) {
                        if (morerdesc == 3) {
                            str.append("," + param + "");
                        } else if (morerdesc == 2) {
                            morerdesc++;
                            str.append("Also it " + param + "");
                        } else if (morerdesc == 1) {
                            morerdesc = 2;
                            str.append("It " + param + " " + cat_name1 + ".");
                        } else if (morerdesc == 0) {
                            morerdesc = 1;
                            str.append("<p>" + pb.getProductName()).append(" " + param + " among others on this list.");
                        }
                    }
                }
                if (morerdesc == 3) {
                    str.append(" in this list.</p>");
                }
                Iterator<String> itr1 = descMap.keySet().iterator();
                int pCreate = 0;
                while (itr1.hasNext()) {
                    String descType = itr1.next();
                    if (descType.equals("open") || descType.equals("close") || descType.contains("cat_")) {
                        continue;
                    }

                    ls = (LinkedList) descMap.get(descType);

                    int kk = 0 + rand.nextInt((ls.size() - 1) - 0 + 1);

                    d = (DescBean) ls.get(kk);
                    catId = 0 + rand.nextInt((cat_names.length - 1) - 0 + 1);
                    catsId = 0 + rand.nextInt((cat_s_names.length - 1) - 0 + 1);
                    pCreate++;
                    if (pCreate == 1) {
                        str.append("<p>");
                    } else if ((pCreate == 3)) {
                        str.append("</p><p>");
                    }
                    str.append(appendIdstoString(d, fMap, cat_names[catId], pb, cat_s_names[catsId], cat_price));

                }
                str.append("</p>");
                ls = (LinkedList) descMap.get("close");
                if (ls.size() > i) {
                    d = (DescBean) ls.get(i);
                    catId = 0 + rand.nextInt((cat_names.length - 1) - 0 + 1);
                    catsId = 0 + rand.nextInt((cat_s_names.length - 1) - 0 + 1);

                    str.append("<p>" + appendIdstoString(d, fMap, cat_names[catId], pb, cat_s_names[catsId], cat_price) + "</p>");
                }
                System.out.println("");
                System.out.println(pb.getProductName());
                System.out.println(str.toString().trim());
                System.out.println("==================================================================");
                insertProduct(str.toString().trim(), cat_list_id, pb.getProductId(), (i + 1));
            }
            System.out.println("completed for ID  " + clArr[cl]);
        }
    }

    private static double getAvg(double[] rams, double avgRam) {
        double diff = 9999999, temp = 0;
        for (int l = 0; l < rams.length; l++) {
            if (diff > Math.abs(avgRam - rams[l])) {
                diff = Math.abs(avgRam - rams[l]);
                temp = rams[l];
            }
        }
        avgRam = temp;
        return avgRam;
    }

    private static String appendIdstoString(DescBean d, HashMap<String, String> fMap, String cat_name, ProductBean pb, String cat_s_name, String cat_price) {
        String desc = d.descLine;
        String c = "";
        if (fMap != null) {
            desc = desc.replace("{size}", fMap.get("f2")).
                    replace("{display}", fMap.get("f3").split(",")[0].trim()).
                    replace("{resolution}", fMap.get("f3").split(",")[1].trim());
            if (fMap.get("f8") != null && !fMap.get("f8").equals("")) {
                c += fMap.get("f8") + " USB Ports, ";
            }
            if (fMap.get("f9") != null && !fMap.get("f9").equals("")) {
                c += fMap.get("f8") + " HDMI Ports, ";
            }
            if (fMap.get("f9") != null && !fMap.get("f9").equals("No")) {
                c += "and is WIFI enabled, ";
            }
            c = c.substring(1, c.length() - 2);
            desc = desc.replace("{connectivity}", c).replace("{wattage}", fMap.get("f6"));
            if (fMap.get("f15") != null) {
                desc = desc.replace("{speakers}", fMap.get("f15"));
            }
        }
            if (pb != null) {
                desc = desc.replace("{brand}", pb.getBrandName()).
                        replace("{tv}", pb.getProductName());
            }
            desc = desc.replace("{cat_name}", cat_name).
                    replace("{cat_s_name}", cat_s_name).
                    replace("{cat_price}", cat_price).
                    replace("{price}", cat_price);

            return desc;
        }

    

    

    public static HashMap getDataForDesc(int category_id) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        LinkedList ls = new LinkedList();
        LinkedHashMap mainMap = new LinkedHashMap();
        try {
            con = DBManager.getConnetion();
            sql.append(" Select * from p_desc_gen where cat_id= " + category_id);
            stmt = con.prepareStatement(sql.toString());
            rs = stmt.executeQuery();

            while (rs.next()) {
                if (mainMap.containsKey(rs.getString("desc_type").toLowerCase())) {
                    ls = (LinkedList) mainMap.get(rs.getString("desc_type").toLowerCase());
                } else {
                    ls = new LinkedList();
                }

                DescBean d = new DescBean();
                d.cat_id = rs.getInt("cat_id");;
                d.descId = rs.getInt("desc_id");
                d.descType = rs.getString("desc_type");
                d.descLine = rs.getString("desc_line");
                ls.add(d);
                mainMap.put(rs.getString("desc_type").toLowerCase(), ls);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
        return mainMap;
    }

    private static void deletecatProducts(int cat_list_id) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.getConnetion();
            sql.append(" delete from list_product_map where cl_id=" + cat_list_id);
            stmt = con.prepareStatement(sql.toString());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
    }

    private static void updateCat(int cat_list_id, String cat_desc, String catMdesc) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.getConnetion();
            sql.append(" update cat_lists set list_desc=?,metadesc=? where cl_id=" + cat_list_id);
            stmt = con.prepareStatement(sql.toString());
            stmt.setString(1, cat_desc);
            stmt.setString(2, catMdesc);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
    }

    private static void insertProduct(String desc, int cat_list_id, int productId, int rank) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.getConnetion();
            sql.append(" insert into list_product_map(cl_id,product_id,pdesc,rank)values(?,?,?,?) ");
            stmt = con.prepareStatement(sql.toString());
            stmt.setInt(1, cat_list_id);
            stmt.setInt(2, productId);
            stmt.setString(3, desc);
            stmt.setInt(4, rank);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);

        }
    }

    static class DescBean {

        int descId;
        String descType;
        String descLine;
        int cat_id;
    }
}
