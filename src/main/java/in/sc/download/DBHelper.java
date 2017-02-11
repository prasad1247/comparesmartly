/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.download;

import in.sc.bean.ProductBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;

/**
 *
 * @author PRASAD
 */
public class DBHelper {

    public static void insertBrand(ProductBean pb) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.getConnetion();
            sql.append(" INSERT INTO BRAND_DETAILS(B_NAME,B_DESC,B_RATING,B_POPULARITY,B_UNIQUE_NAME,B_IMG,STATUS) VALUES(?,?,?,?,?,?,?)");
            stmt = con.prepareStatement(sql.toString());
            int fld = 1;
            stmt.setString(fld++, pb.getBrandName());
            stmt.setString(fld++, pb.getBrandName());
            stmt.setInt(fld++, pb.getBrandrating());
            stmt.setInt(fld++, 0);
            stmt.setString(fld++, pb.getbUniqueName());
            stmt.setString(fld++, pb.getBrandimg());
            stmt.setString(fld++, "A");
            stmt.executeUpdate();

            //con.prepareStatement("truncate table productlist").executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
    }

    public static int insertProduct(ProductBean pb) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int id = 0;
        try {
            con = DBManager.getConnetion();
            sql.append(" INSERT INTO PRODUCT_DETAILS_PR(P_NAME,P_DESC,BRAND_ID,CAT_ID,UNIQUE_ID,P_URL,PROS,CONS) VALUES(?,?,?,?,?,?,?,?)");
            stmt = con.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
            int fld = 1;
            stmt.setString(fld++, pb.getProductName());
            stmt.setString(fld++, pb.getPdesc());
            stmt.setInt(fld++, pb.getBrandId());
            stmt.setInt(fld++, pb.getCategoryid());
            stmt.setString(fld++, pb.getUniqueId());
            stmt.setString(fld++, pb.getpUrl());
            stmt.setString(fld++, pb.getRbean().getPros());
            stmt.setString(fld++, pb.getRbean().getCons());
            stmt.executeUpdate();
            ResultSet rs1 = stmt.getGeneratedKeys();
            rs1.next();
            id = rs1.getInt(1);
            rs1.close();
            //con.prepareStatement("truncate table productlist").executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
        return id;

    }

    public static int insertImg(HashMap iMap) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int id = 0;
        try {
            con = DBManager.getConnetion();
            sql.append(" INSERT INTO PRODUCT_IMG_MAP(PRODUCT_ID,IMG1,IMG2,IMG3,IMG4) VALUES (?,?,?,?,?)");
            stmt = con.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);

            stmt.setLong(1, (long) iMap.get("PRODUCT_ID"));
            stmt.setString(2, (String) iMap.get("IMG1"));
            stmt.setString(3, (String) iMap.get("IMG2"));
            stmt.setString(4, (String) iMap.get("IMG3"));
            stmt.setString(5, (String) iMap.get("IMG4"));
            stmt.executeUpdate();
            //con.prepareStatement("truncate table productlist").executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
        return id;

    }

    public static int updateProduct(int imgId, int productId) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int id = 0;
        try {
            con = DBManager.getConnetion();
            sql.append(" UPDATE PRODUCT_DETAILS_SP SET P_IMG_ID = ? where product_id=?");
            stmt = con.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
            int fld = 1;
            stmt.executeUpdate();
            stmt.setLong(1, imgId);
            stmt.setLong(2, productId);

            //con.prepareStatement("truncate table productlist").executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
        return id;

    }

    public static int insertProductSpecs(int productId,int cat_id, HashMap spcMap) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        StringBuilder values = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int id = 0;
        try {
            con = DBManager.getConnetion();
            sql.append(" INSERT INTO product_feature_map_PR(product_id,cat_id");
            values.append(" VALUES ( " + productId+","+cat_id);
            Iterator itr = spcMap.keySet().iterator();
            while (itr.hasNext()) {
                String column = (String) itr.next();
                String value = (String) spcMap.get(column);
                sql.append("," + column);
                values.append(",'" + value + "'");
            }
            values.append(")");
            sql.append(")");
    //        System.out.println("sql b " + sql.toString());
   //         System.out.println("sql  " + values.toString());
            sql.append(values);
  //          System.out.println("sql  " + sql.toString());
            stmt = con.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
            int fld = 1;

            stmt.executeUpdate();
            ResultSet rs1 = stmt.getGeneratedKeys();
            rs1.next();
            id = rs1.getInt(1);
            rs1.close();
            //con.prepareStatement("truncate table productlist").executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
        return id;

    }

        public static int updateProductSpecs(int productId,int cat_id, HashMap spcMap) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        StringBuilder values = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int id = 0;
        try {
            con = DBManager.getConnetion();
            sql.append(" update product_feature_map_PR set ");
            Iterator itr = spcMap.keySet().iterator();
            while (itr.hasNext()) {
                String column = (String) itr.next();
                String value = (String) spcMap.get(column);
                sql.append( column+"='"+value+"',");
            }
            sql.append(" cat_id="+cat_id+" where product_id="+productId+" and cat_id="+cat_id);
    //        System.out.println("sql b " + sql.toString());
   //         System.out.println("sql  " + values.toString());
   //         sql.append(values);
            System.out.println("sql  " + sql.toString());
            stmt = con.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
            int fld = 1;

            stmt.executeUpdate();
//            ResultSet rs1 = stmt.getGeneratedKeys();
//            rs1.next();
//            id = rs1.getInt(1);
//            rs1.close();
            //con.prepareStatement("truncate table productlist").executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
        return id;

    }

    
    public static HashMap selectBrand() {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        HashMap bMap = new HashMap();
        try {
            con = DBManager.getConnetion();
            sql.append(" SELECT BRAND_ID,B_NAME,B_DESC,B_RATING,B_POPULARITY,B_UNIQUE_NAME,B_IMG,STATUS FROM BRAND_DETAILS ");
            stmt = con.prepareStatement(sql.toString());
            rs = stmt.executeQuery();
            while (rs.next()) {
                ProductBean pb = new ProductBean();
                pb.setBrandId(rs.getInt("BRAND_ID"));
                pb.setBrandName(rs.getString("B_NAME"));
                pb.setBrandDesc(rs.getString("B_DESC"));
                pb.setbUniqueName(rs.getString("B_UNIQUE_NAME"));
                bMap.put(rs.getString("B_UNIQUE_NAME"), rs.getInt("BRAND_ID"));

            }

            //con.prepareStatement("truncate table productlist").executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
        return bMap;
    }

    public static HashMap productMap() {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        HashMap bMap = new HashMap();
        try {
            con = DBManager.getConnetion();
            sql.append(" SELECT PRODUCT_ID,P_NAME FROM product_details_pr ");
            stmt = con.prepareStatement(sql.toString());
            rs = stmt.executeQuery();
            while (rs.next()) {
                ProductBean pb = new ProductBean();
                bMap.put(rs.getString("P_NAME"), rs.getInt("PRODUCT_ID"));

            }

            //con.prepareStatement("truncate table productlist").executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
        return bMap;
    }

    public static HashMap selectSpecMap(int cat_id) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        HashMap specMap = new HashMap();
        try {
            con = DBManager.getConnetion();
            sql.append(" SELECT feature_id,feature_group,feature_name FROM category_feature_map where cat_id= " + cat_id + " and src_id=2");
            stmt = con.prepareStatement(sql.toString());
            rs = stmt.executeQuery();
            while (rs.next()) {
                specMap.put(rs.getString("feature_group") + "-" + rs.getString("feature_name"), rs.getInt("feature_id"));
            }

            //con.prepareStatement("truncate table productlist").executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
        return specMap;
    }

    public static void updateVisits(int pid,int visitId) {
        Connection con = null;
        StringBuilder sql = new StringBuilder();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int id = 0;
        try {
            con = DBManager.getConnetion();
            sql.append(" UPDATE PRODUCT_DETAILS_sp SET VISITS = ? where product_id=? and visits=0");
            stmt = con.prepareStatement(sql.toString());
            int fld = 1;
            stmt.setLong(1, visitId);
            stmt.setLong(2, pid);
           int cmd=  stmt.executeUpdate();
           
            //con.prepareStatement("truncate table productlist").executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.closeConnection(con, rs, stmt);
        }
       

    }

}
