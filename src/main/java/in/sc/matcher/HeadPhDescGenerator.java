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
public class HeadPhDescGenerator {

    static int cat_id = 212;
    static DecimalFormat decimalFormatPattern = new DecimalFormat("0");
    static SimpleDateFormat dateFormat = new SimpleDateFormat("MMM yyyy");

    public static void main(String[] args) {
        getProducts(cat_id);
    }

    public static void getProducts(int cat_id) {
        HashMap inputMap = new HashMap();
        ListGenerator pHelper = new ListGenerator();
        Random rand = new Random();
//        int[] clArr = {27,28,29,30,31,32,33,34,35,49,50,51,52,53,54,55};
        int[] clArr = {62,63,64,65};
        int rotateHeadings=0;
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
            String cat_min_price = inputMap.get(ProductHelper.minprice) + "";
            String cat_price1 = ((int) (inputMap.get(ProductHelper.maxprice)) / 1000) + "K";
            String cat_name = "Best headphones under Rs. " + cat_price + " in January 2017";
            String cat_name7 = "<strong>Best headphones under Rs. " + cat_price + "</strong>";
            String cat_name1 = "Headphones with best features under Rs. " + cat_price;
            String cat_name4 = "Headsets having top specs under " + cat_price;
            String cat_name2 = "<strong>Best Earphones in range " + cat_min_price + " to "+cat_price+"</strong>";
            String cat_name3 = "<strong>Top headsets below Rs. " + cat_price + "</strong>";
            String cat_name5 = "Top earphones below " + cat_price;
            String cat_name6 = "Top earphones between "+cat_min_price+" and "+cat_price;
//            String cat_name1 = "Best micromax mobile price in range 10000 to 15000";
//            String cat_name4 = "<strong>micromax mobile between 10000 to 15000</strong>";
//            String cat_name2 = "<strong>micromax 10000 to 15000</strong>";
//            String cat_name3 = "<strong>Top micromax mobile between 10000 to 15000</strong>";
//            String cat_name5 = "Best Micromax mobile price 10000 to 15000";
//            String cat_name6 = "Top Micromax mobile phones price upto 15000";
//            String cat_name7 = "Best Micromax smartphones price 10000 to 15000";

            String[] cat_names = {cat_name, cat_name1, cat_name2, cat_name3, cat_name4, cat_name5, cat_name6, cat_name7};
            String cat_s_name = "<strong>Best headphone under Rs. " + cat_price + "</strong>";
            String cat_s_name1 = "headphone with best features under Rs. " + cat_price;
            String cat_s_name2 = "<strong>Top earphone from " + cat_min_price + " to "+cat_price+"</strong>";
            String cat_s_name3 = "<strong>Best headset below " + cat_price + "</strong>";
            String cat_s_name4 = "<strong>Top headphone between " + cat_min_price + " and "+cat_price+"</strong>";
            String cat_s_name5 = "<strong>Top earphone below " + cat_price1 + "</strong>";
//            String cat_s_name = "<strong>Best Micromax phone in range 10000 to 15000</strong>";
//            String cat_s_name1 = "Top Micromax phones between 10000 to 15000";
//            String cat_s_name2 = "<strong>Top Micromax mobile price 10000 to 15000</strong>";
//            String cat_s_name3 = "<strong>Best Micromax smartphone in 10000 to 15000 range</strong>";
//            String cat_s_name4 = "<strong>Micromax smartphone in price between 10000 to 15000</strong>";
//            String cat_s_name5 = "<strong>Best Micromax smartphone under 15000 Rs.</strong>";


            String[] cat_s_names = {cat_s_name, cat_s_name1, cat_s_name2, cat_s_name3, cat_s_name4, cat_s_name5};
            int catId = 0 + rand.nextInt((cat_names.length - 1) - 0 + 1);
            int catsId = 0 + rand.nextInt((cat_s_names.length - 1) - 0 + 1);
            String metaCatName = cat_names[catId].replace("<strong>", "").replace("</strong>", "");
            String metaCatSName = cat_s_names[catsId].replace("<strong>", "").replace("</strong>", "");
            String[] cat_meta_desc = {"Want to know which is "+metaCatSName+"? Check out our list of "+metaCatName + ".",
            "Which headphone you should buy under "+cat_price + "? View latest " + metaCatName + " in India and read their specs.",
            "You should not miss our list of "+metaCatName+", while you hunt for earphone under "+cat_price+".View the best headphone under "+cat_price+" in "+month,
            "Have a budget of Rs. "+cat_price + "? check out these " +metaCatName + " in "+month+" and take your pick",
           metaCatName + " in India for " + month + " based on comparesmartly ratings, read specs and prices of them.",
            metaCatName + ", We have compiled a list of " + metaCatName + " in India."
        };

//        for (int lll = 0; lll < cat_meta_desc.length; lll++) {
//            System.out.println(cat_meta_desc[lll]);
//        }
            
            String[] dateS={"Jan 01, 2017","Dec 08, 2016","Dec 09, 2016","Dec 10, 2016"};
            String ddd=dateS[0];
            if(rotateHeadings==4)ddd=dateS[1];
            if(rotateHeadings==8)ddd=dateS[2];
            if(rotateHeadings==12)ddd=dateS[3];
            
           if(rotateHeadings==4)cat_name=cat_names[1].replace("<strong>","").replace("</strong>","");
            if(rotateHeadings==8)cat_name=cat_names[2].replace("<strong>","").replace("</strong>","");
            if(rotateHeadings==12)cat_name=cat_names[3].replace("<strong>","").replace("</strong>","");
            
            rotateHeadings++;
            
        String lastLine = "<em>Updated</em> : <time style=\"font-weight:bold\" itemprop=\"dateModified\">"+ddd+"</time>"
                + "<span style=\"margin-left:15px;\"><em>in</em> : <a href=\"http://comparesmartly.in/phones\" title=\"View all posts in phones\" itemprop=\"about\">phones</a> </span>"
                + "<span style=\"margin-left:15px;\"><em>Published By : </em><span itemprop=\"author\"> <a href='http://comparesmartly.in/' title=\"comparesmartly.in\" rel=\"publisher\">comparesmartly.in</a> </span></span>";
        lastLine+="<meta itemprop=\"datePublished\" content=\"2016-12-21\">";
        for(int l=0;l<cat_names.length;l++){
              lastLine+="  <meta itemprop=\"keywords\" content='"+cat_names[l].replace("<strong>","").replace("</strong>","")+"'/>";
            }
        ArrayList pList = (ArrayList) pHelper.getListProducts(inputMap);
        HashMap descMap = getDataForDesc(cat_id);
        HashMap<String, ProductBean> bestMap = new HashMap();
        double avgScore = 0, avgRam = 0, avgMCamera = 0, avgFCamera = 0, avgBattery = 0, avgDisplay = 0, avgInternal = 0, avgPrice = 0;

        double rams[] = {0.5, 1, 2, 3, 4, 6};
        double cams[] = {1.2, 1.5, 2, 3, 5, 8, 13, 16, 20, 25};
        double bats[] = {200, 500, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000, 5500, 6000, 6500, 7000, 7500, 8000, 8500};
        double displays[] = {1.2, 2, 3, 4, 4.5, 4.7, 5, 5.5, 6, 6.6, 7, 7.5, 8, 9, 10};
        double internals[] = {1, 2, 4, 8, 16, 32, 64, 128, 256};

        double processor = 0, ram = 0, camera = 0, battery = 0, display = 0, internal = 0, fCamera = 0, hprice = 0, lprice = 999999999;
        String processorS = "", ramS = "", cameraS = "", batteryS = "", displayS = "", internalS = "", fCameraS = "", hpriceS = "", lpriceS = "";
        for (int i = 0; i < pList.size(); i++) {
            ProductBean pb = (ProductBean) pList.get(i);
            HashMap<String, String> fMap = pb.getgFeatureMap();

            avgScore += pb.getSpecScore();
//            avgRam += Double.parseDouble(fMap.get("f13"));
//            avgMCamera += Double.parseDouble(fMap.get("f16"));
//            if (fMap.get("f17") != null && !fMap.get("f17").equals("")) {
//                avgFCamera += Double.parseDouble(fMap.get("f17"));
//            }
//            avgBattery += Double.parseDouble(fMap.get("f24"));
//            avgDisplay += Double.parseDouble(fMap.get("f23"));
//            avgInternal += Double.parseDouble(fMap.get("f15"));
            avgPrice += pb.getNewPrice();

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

//        avgScore = Math.round(avgScore / pList.size());
//        avgRam = avgRam / pList.size();
//        avgRam = getAvg(rams, avgRam);
//
//        avgMCamera = avgMCamera / pList.size();
//        avgMCamera = getAvg(cams, avgMCamera);
//
//        avgFCamera = avgFCamera / pList.size();
//        avgFCamera = getAvg(cams, avgFCamera);
//
//        avgBattery = avgBattery / pList.size();
//        avgBattery = getAvg(bats, avgBattery);
//
//        avgDisplay = avgDisplay / pList.size();
//        avgDisplay = getAvg(displays, avgDisplay);
//
//        avgInternal = avgInternal / pList.size();
//        avgInternal = getAvg(internals, avgInternal);

        avgPrice = avgPrice / pList.size();
        int roundPrice = (int) (((Math.round(avgPrice) + 5) / 10) * 10);

        System.out.println("avgScore = 0, avgRam = 0, avgMCamera = 0, avgFCamera = 0, avgBattery = 0, avgDisplay = 0, avgInternal = 0, avgPrice = 0;");

        System.out.println(avgScore + "  " + avgRam + "  " + avgMCamera + "  " + avgFCamera + "  " + avgBattery + "  " + avgDisplay + "  " + avgInternal + "  " + roundPrice);
//        Iterator<String> itr = bestMap.keySet().iterator();
//        while(itr.hasNext()){
//            String param=itr.next();
//            System.out.println(param+"  "+bestMap.get(param).getProductName());
//        }
        StringBuilder catdesc = new StringBuilder();
        LinkedList descList = (LinkedList) descMap.get("cat_open");
        int id = 0 + rand.nextInt((descList.size() - 1) - 0 + 1);

        DescBean d = (DescBean) descList.get(id);
        catId = 0 + rand.nextInt((cat_names.length - 1) - 0 + 1);
        catsId = 0 + rand.nextInt((cat_s_names.length - 1) - 0 + 1);
        
        String cat_desc = "<a itemprop=\"mainEntityOfPage\" href=\"http://comparesmartly.in/headphones/"+pBean.getUrl()+"\">"
                + "<h1 style=\"text-align: center;\"  itemprop=\"headline\">" + cat_name + "</h1></a>";
        cat_desc+="<div itemprop=\"description\">";
        cat_desc += "<p>" + appendIdstoString(d, null, cat_names[catId], null, cat_s_names[catsId], cat_price) + "</p>";
        String c = "<p>In this category headphones are priced at an average of Rs." + roundPrice + ". The Cheapest among this category is of Rs."+lpriceS+""
                + ", while most priced headphone can cost you around "+hpriceS+".</p>";
        descList = (LinkedList) descMap.get("cat_close");
        id = 0 + rand.nextInt((descList.size() - 1) - 0 + 1);
        d = (DescBean) descList.get(id);
        String c1 = "<p>" + appendIdstoString(d, null, cat_name, null, cat_s_name, cat_price) + "</p>";
        cat_desc += c + c1 +"</div>"+ lastLine;      
//        System.out.println(cat_desc);
        String catMdesc=cat_meta_desc[0 + rand.nextInt((cat_meta_desc.length - 1) - 0 + 1)];
        updateCat(cat_list_id, cat_desc,catMdesc);
        deletecatProducts(cat_list_id);

        for (int i = 0; i < pList.size(); i++) {
            ProductBean pb = (ProductBean) pList.get(i);
            StringBuilder str = new StringBuilder();
            HashMap<String, String> fMap = pb.getgFeatureMap();
//
//            LinkedList ls = (LinkedList) descMap.get("open");
//            if (ls!=null && ls.size() > i) {
//                d = (DescBean) ls.get(i);
//                catId = 0 + rand.nextInt((cat_names.length - 1) - 0 + 1);
//                catsId = 0 + rand.nextInt((cat_s_names.length - 1) - 0 + 1);
//
//                str.append("<p>" + appendIdstoString(d, fMap, cat_names[catId], pb, cat_s_names[catsId], cat_price) + "</p>");
//            }
//            Iterator<String> itr = bestMap.keySet().iterator();
//            int morerdesc = 0;
//            while (itr.hasNext()) {
//                String param = itr.next();
//                if (bestMap.get(param).getProductName().equals(pb.getProductName())) {
//                    if (morerdesc == 3) {
//                        str.append("," + param + "");
//                    } else if (morerdesc == 2) {
//                        morerdesc++;
//                        str.append("Also it " + param + "");
//                    } else if (morerdesc == 1) {
//                        morerdesc = 2;
//                        str.append("It " + param + " " + cat_name1 + ".");
//                    } else if (morerdesc == 0) {
//                        morerdesc = 1;
//                        str.append("<p>" + pb.getProductName()).append(" " + param + " among others on this list.");
//                    }
//                }
//            }
//            if (morerdesc == 3) {
//                str.append(" in this list.</p>");
//            }
//            Iterator<String> itr1 = descMap.keySet().iterator();
//            int pCreate = 0;
//            while (itr1.hasNext()) {
//                String descType = itr1.next();
//                if (descType.equals("open") || descType.equals("close") || descType.contains("cat_") || descType.contains("_sub")) {
//                    continue;
//                }
//
//                ls = (LinkedList) descMap.get(descType);
//
//                int kk = 0 + rand.nextInt((ls.size() - 1) - 0 + 1);
//
//                d = (DescBean) ls.get(kk);
//                catId = 0 + rand.nextInt((cat_names.length - 1) - 0 + 1);
//                catsId = 0 + rand.nextInt((cat_s_names.length - 1) - 0 + 1);
//                pCreate++;
//                if (pCreate == 1) {
//                    str.append("<p>");
//                } else if ((pCreate == 3)) {
//                    str.append("</p><p>");
//                }
//                str.append(appendIdstoString(d, fMap, cat_names[catId], pb, cat_s_names[catsId], cat_price));
//
//            }
//            str.append("</p>");
//            ls = (LinkedList) descMap.get("close");
//            if (ls.size() > i) {
//                d = (DescBean) ls.get(i);
//                catId = 0 + rand.nextInt((cat_names.length - 1) - 0 + 1);
//                catsId = 0 + rand.nextInt((cat_s_names.length - 1) - 0 + 1);
//
//                str.append("<p>" + appendIdstoString(d, fMap, cat_names[catId], pb, cat_s_names[catsId], cat_price) + "</p>");
//            }
//            System.out.println("");
//            System.out.println(pb.getProductName());
//            System.out.println(str.toString().trim());
//            System.out.println("==================================================================");
            insertProduct("", cat_list_id, pb.getProductId(), (i + 1));
        }
            System.out.println("completed for ID  "+clArr[cl]);
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
        if (fMap != null) {
            desc = desc.replace("{processor}", fMap.get("f2")).
                    replace("{RAM}", fMap.get("f1")).
                    replace("{dsize}", fMap.get("f11")).
                    replace("{resolution}", fMap.get("f10")).
                    replace("{main_camera}", fMap.get("f4")).
                    replace("{front_camera}", fMap.get("f5")).
                    replace("{battery}", fMap.get("f12")).
                    replace("{internal}", fMap.get("f3"));
        }
        if (pb != null) {
            desc = desc.replace("{brand}", pb.getBrandName()).
                    replace("{phone}", pb.getProductName());
        }
        desc = desc.replace("{category}", cat_name).
                replace("{cat_s_name}", cat_s_name).
                replace("{cat_price}", cat_price).
                replace("{prize}", cat_price);

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

    private static void updateCat(int cat_list_id, String cat_desc,String catMdesc) {
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
