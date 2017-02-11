/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.download;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hp
 */
public class DBManager {
  public static Connection getConnetion() {
        Connection con = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_compare", "root", "root");
          
//         con = DriverManager.getConnection("jdbc:mysql://52.42.111.208:3033/smart_compare", "root", "rose@123");
//            System.out.println("get "+con.getSchema());
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return con;
    }
      public static Connection getConnetionProd() {
        Connection con = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
//          con = DriverManager.getConnection("jdbc:mysql://localhost:3033/smart_compare", "root", "rose@123");
          
         con = DriverManager.getConnection("jdbc:mysql://localhost:3033/comparesite", "root", "rose@123");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return con;
    }
       public static void closeConnection(Connection con, ResultSet rs, Statement st) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (st != null) {
            try {
                st.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
