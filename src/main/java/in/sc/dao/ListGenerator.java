/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.dao;


import in.sc.admin.ApplicationUtils;
import in.sc.bean.MetaBean;
import in.sc.bean.ProductBean;
import static in.sc.dao.ProductHelper.brand;
import static in.sc.dao.ProductHelper.brandname;
import static in.sc.dao.ProductHelper.catListId;
import static in.sc.dao.ProductHelper.category;
import static in.sc.dao.ProductHelper.country;
import static in.sc.dao.ProductHelper.from;
import static in.sc.dao.ProductHelper.generateUrl;
import static in.sc.dao.ProductHelper.getImgUrl;
import static in.sc.dao.ProductHelper.maxprice;
import static in.sc.dao.ProductHelper.minprice;
import static in.sc.dao.ProductHelper.orderclause;
import static in.sc.dao.ProductHelper.retailer;
import static in.sc.dao.ProductHelper.to;
import static in.sc.dao.ProductHelper.unique_id;
import static in.sc.dao.ProductHelper.whereclause;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Asus
 */
@Repository
public class ListGenerator {

    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Autowired
    ProductHelper pHelper;

    public NamedParameterJdbcTemplate getTemplate() {
        if (namedParameterJdbcTemplate == null) {
            DriverManagerDataSource dataSource = new DriverManagerDataSource();
            dataSource.setSchema("smart_compare");
            dataSource.setUsername("root");
            dataSource.setPassword("root");
            dataSource.setUrl("jdbc:mysql://localhost:3306/smart_compare");
//            dataSource.setPassword("rose@123");
//            dataSource.setURL("jdbc:mysql://52.42.111.208:3033/smart_compare");

            namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        }
        return namedParameterJdbcTemplate;
    }

    public List getListsDetails(int featureId,int cat_id) {
        StringBuilder sql = new StringBuilder();
        List catList = null;
        try {
            sql.append(" SELECT * FROM cat_lists WHERE 1=1 ");
            if (featureId > 0) {
                sql.append(" and cl_ID=" + featureId);
            }if (cat_id > 0) {
                sql.append(" and cat_ID=" + cat_id);
            }

            namedParameterJdbcTemplate = getTemplate();
            catList = namedParameterJdbcTemplate.query(sql.toString(), new HashMap(), new RowMapper<ProductBean>() {
                @Override
                public ProductBean mapRow(ResultSet rs, int i) throws SQLException {
                    ProductBean pBean = new ProductBean();
                    pBean.setUrl(rs.getString("list_url"));
                    pBean.setProductName(rs.getString("list_name"));
                    pBean.setPdesc(rs.getString("list_desc"));
                    pBean.setCategoryid(rs.getInt("cat_id"));
                    pBean.setProductId(rs.getInt("cl_id"));
                    HashMap filterMap = new HashMap();
                    if (rs.getInt("cat_id") > 0) {
                        filterMap.put(ProductHelper.category, rs.getInt("cat_id"));
                    }

                    if (rs.getInt("min_price") > 0) {
                        filterMap.put(ProductHelper.minprice, rs.getInt("min_price"));
                    }
                    if (rs.getInt("max_price") > 0) {
                        filterMap.put(maxprice, rs.getInt("max_price"));
                    }
                    if (rs.getString("brand_ids") != null) {
                        filterMap.put(brand, rs.getString("brand_ids"));
                    }
                    if (rs.getString("whereclause") != null) {
                        filterMap.put(ProductHelper.whereclause, rs.getString("whereclause"));
                    }
                    if (rs.getString("orderclause") != null) {
                        filterMap.put(ProductHelper.orderclause, rs.getString("orderclause"));
                    }
                    pBean.setFilterMap(filterMap);

                    return pBean;
                }
            });

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return catList;

    }

    public int createList(HashMap inputMap) {
        StringBuilder sql = new StringBuilder();

        KeyHolder holder = new GeneratedKeyHolder();
        int cl_id = 0;
        try {
            sql.append(" INSERT INTO CAT_LISTS(cat_id,list_type,list_url,list_name,min_price,max_price,brand_ids,whereclause,orderclause)VALUES ");
            sql.append(" (:cat_id,:list_type,:list_url,:list_name,:minprice,:maxprice,:brand,:whereclause,:orderclause) ");
            namedParameterJdbcTemplate = getTemplate();
            namedParameterJdbcTemplate.update(sql.toString(), new MapSqlParameterSource(inputMap), holder);
            cl_id = holder.getKey().intValue();
            inputMap.put(ProductHelper.to, 20);
         //   ArrayList<ProductBean> data = (ArrayList) pHelper.getProductLists1(inputMap);
         //   pHelper.insertListProductMap(data, cl_id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return cl_id;

    }

    public LinkedHashMap generateCat(int from) {

        StringBuilder sql = new StringBuilder();

        LinkedHashMap rootMap = null;
        try {

            sql.append("select k1.c_unique_name,concAt(li.cat_name,'/',li.home_url_exp) as url,k1.cat_name as child_cat,k2.cat_name as parent_cat,k3.cat_name as root_cat "
                    + "from category_details k1,category_details k2, category_details k3,linkgenerator li where k1.status='B' and "
                    + " k1.parent_cat_id=k2.cat_id and k2.parent_cat_id=k3.cat_id "
                    + "	and li.category_id=k1.cat_id "
                    + " order by k3.priority asc");
            namedParameterJdbcTemplate = getTemplate();
            rootMap = namedParameterJdbcTemplate.query(sql.toString(), new HashMap(), new ResultSetExtractor<LinkedHashMap>() {
                @Override
                public LinkedHashMap extractData(ResultSet rs) throws SQLException, DataAccessException {
                    LinkedHashMap rootMap = new LinkedHashMap();
                    LinkedList li = null;
                    HashMap parentMap = null;
                    while (rs.next()) {
                        try {
                            ArrayList childList = null;
                            String rootCat = "";
                            String parentCat = "";
                            String childCat = "";
                            String childUrl = rs.getString("url");
                            if (rs.getString("root_cat").equals("Root Category ")) {
                                rootCat = rs.getString("parent_cat");
                                parentCat = rs.getString("child_cat");
                                childCat = childUrl;
                            } else {
                                rootCat = rs.getString("root_cat");
                                parentCat = rs.getString("parent_cat");
                                childCat = rs.getString("child_cat") + "#" + childUrl;
                            }

                            if (rootMap.containsKey(rootCat)) {
                                parentMap = (HashMap) rootMap.get(rootCat);
                            } else {
                                parentMap = new HashMap();
                            }
                            if (childCat != null && parentMap.containsKey(parentCat)) {
                                childList = (ArrayList) parentMap.get(parentCat);
                            } else {
                                childList = new ArrayList();
                            }
                            if (childCat != null) {
                                childList.add(childCat);
                            }
                            parentMap.put(parentCat, childList);
                            rootMap.put(rootCat, parentMap);

//                        if (rootMap.containsKey(rootCat)) {
//                             if (!childCat.equals("")) {
//                            parentMap = (HashMap) rootMap.get(rootCat);
//                            if (parentMap.containsKey(childCat)) {
//                                    childList = (ArrayList) parentMap.get(childCat);
//                                } else {
//                                    childList = new ArrayList();
//                                }
//                                childList.add(childCat);
//                                parentMap.put(parentCat, childList);
//                                rootMap.put(rootCat, parentMap);
//                            }
//                             
//                        } else {
//                           if (!childCat.equals("")) {
//                            childList = new ArrayList();
//                            childList.add(childCat);
//                            parentMap=new HashMap();
//                            parentMap.put(parentCat, childList);
//                            rootMap.put(rootCat, parentMap);
//                            }else{
//                                rootMap.put(rootCat, parentCat);
//                            }
//                            
//                        }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    return rootMap;
                }
            });

            // Mainmap.put("data", dataList);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return rootMap;
    }

    public List<ProductBean> getListProducts(final HashMap inputMap) {
        int toCount = 20;
        final int flag = 0;
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT REPLACE(pd.unique_id,'-',' ') p_name,min(pt.productname)as productname,pd.unique_id, MIN(pt.NewPrice)as newprice,min(pt.url) as sellerUrl, "
                + " count(1)as records,max(pt.imglink)as p_img,bd.b_name,li.p_url_exp,li.brand_url_exp, "
                + " li.home_url_exp, "
                + " li.category_url_exp,li.p_keywords,p_title,li.p_desc,b_keywords,b_title,li.b_desc,h_keywords,h_title,h_desc,1 as country_id,max(pt.pricedate) "
                + " pricedate, cd.cat_name,cd.s_cat_name,pd.cat_id,cd.cdesc1,product_id_pr,product_id_sp,product_id_91,pd.product_id,pd.specscore,cb.cb_desc,pd.short_Desc,li.cat_name as urlCatName,pfm.* ");
        if (inputMap.containsKey(catListId)) {
            sql.append(",lpm.pdesc,lpm.rank,cl.list_desc,cl.list_name,cl.list_url ");
        }
        sql.append(" from product_details pd,product_transaction pt,brand_details bd,category_details cd,linkgenerator li,product_feature_map pfm,cat_brand_map cb ");
        if (inputMap.containsKey(catListId)) {
            sql.append(",list_product_map lpm,cat_lists cl ");
        }
        sql.append(" where pd.CAT_ID=cd.cat_id "
                + " and pd.BRAND_ID=bd.BRAND_ID "
                + " and pd.UNIQUE_ID=pt.unique_id "
                + " and li.category_id=pd.cat_id and li.country_id=1 "
                + " and pd.product_id=pfm.product_id "
                + " and cb.brand_id=pd.brand_id "
                + " and cb.cat_id=pd.cat_id ");
        if (inputMap.containsKey(catListId)) {
            sql.append(" and lpm.cl_id= " + inputMap.get(catListId));
            sql.append(" and lpm.product_id=pd.product_id ");
            sql.append(" and cl.cl_id=lpm.cl_id ");
        }

        if (inputMap.containsKey(category)) {
            sql.append(" AND Pd.cat_id in(:" + category + ") ");

        }
//        if (inputMap.containsKey(country)) {
//            sql.append(" AND pd.country_id in(:" + country + ") ");
//
//        }
        if (inputMap.containsKey(brand) && inputMap.get(brand) != null) {
            sql.append(" AND bd.brand_id in(:" + brand + ") ");

        }
        if (inputMap.containsKey(brandname)) {
            sql.append(" AND bd.b_unique_name in(:" + brandname + ") ");

        }
        if (inputMap.containsKey(retailer)) {
            sql.append(" AND Pt.retailer_id in(:" + retailer + ") ");
        }
        if (inputMap.containsKey(unique_id)) {
            sql.append(" AND Pd.unique_id in(:" + unique_id + ") ");
        }
        if (inputMap.containsKey(maxprice) && inputMap.get(maxprice) != null) {
            sql.append(" AND pt.newprice between :" + minprice + " and :" + maxprice);
        }
        if (inputMap.containsKey(whereclause) && inputMap.get(whereclause) != null) {
            sql.append(" " + inputMap.get(whereclause));
        }

        sql.append(" group by "
                + " REPLACE(pd.unique_id,'_',' '),pd.unique_id,bd.b_name,li.p_url_exp,li.brand_url_exp, "
                + " li.home_url_exp, "
                + " li.category_url_exp,li.p_keywords,p_title,li.p_desc,b_keywords,b_title,li.b_desc,h_keywords,h_title,h_desc, cd.cat_name,cd.s_cat_name,pd.cat_id,cd.cdesc1,li.cat_name ");
        if (inputMap.containsKey(orderclause) && inputMap.get(orderclause) != null) {
            sql.append(" order by " + inputMap.get(orderclause) + ",pd.specscore desc");
        } else if (inputMap.containsKey(catListId)) {
            sql.append(" order by lpm.rank asc,pd.specscore desc");
        } else {
            sql.append(" order by pd.specscore desc");
        }
        if (inputMap.containsKey(from)) {
            if (inputMap.containsKey(to)) {
                toCount = (Integer) (inputMap.get(to));
            } else {
                toCount = 20;
            }
            String fro = "0";
            Object o = inputMap.get(from);
            if (ArrayList.class.isInstance(o)) {
                fro = (String) ((ArrayList) o).get(0);
            } else {
                fro = o + "";
            }
            sql.append(" limit " + fro + "," + toCount);

        }

        namedParameterJdbcTemplate = getTemplate();
//        System.out.println("sql   " + sql);
        List<ProductBean> detailList = namedParameterJdbcTemplate.query(sql.toString(), inputMap, new RowMapper<ProductBean>() {
            ResultSetMetaData meta = null;
            int numCol = 0;

            @Override
            public ProductBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                ProductBean pBean = new ProductBean();
                MetaBean mbean = new MetaBean();
                pBean.setNewPrice(rs.getInt("newPrice"));

                pBean.setProductName(ApplicationUtils.toTitleCase(rs.getString("p_name")));
                pBean.setUniqueId(rs.getString("unique_id"));
                pBean.setProductId(rs.getInt("product_id"));
                pBean.setImgLink(getImgUrl(rs.getString("p_img")));
                pBean.setBrandName(ApplicationUtils.toTitleCase(rs.getString("b_Name")));
                pBean.setCategoryName(rs.getString("cat_name"));
                pBean.setCountryid(rs.getInt("country_id"));
                pBean.setSellerCount(rs.getInt("records"));
                pBean.setsCatName(rs.getString("s_cat_name"));
                pBean.setCategoryid(rs.getInt("cat_id"));
                pBean.setSpecScore(rs.getInt("specscore"));
                pBean.setUniqueName(rs.getString("productname"));
                pBean.setbUniqueName(rs.getString("b_Name"));

                if (rowNum == 0) {
                    pBean.setBrandCatDesc(rs.getString("cb_desc"));
                    meta = rs.getMetaData();
                    numCol = meta.getColumnCount();
                    for (int i = 70; i < numCol + 1; i++) {
                        if (meta.getColumnName(i).equals("list_desc")) {
                            pBean.setCatDesc(rs.getString("list_desc"));
                            break;
                        }
                    }
                    for (int i = 70; i < numCol + 1; i++) {
                        if (meta.getColumnName(i).equals("list_name")) {
                            mbean.setH_title(ApplicationUtils.toTitleCase(generateUrl(rs.getString("list_name"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));
                            break;
                        }
                    }
                    for (int i = 70; i < numCol + 1; i++) {
                        if (meta.getColumnName(i).equals("list_url")) {
                            pBean.setCatUrl(generateUrl(rs.getString("urlCatName") + "/" + rs.getString("list_url"), rs.getString("unique_id"), rs.getString("b_Name"), null));
                            break;
                        }
                    }
                    if (pBean.getCatUrl() == null) {
                        pBean.setCatUrl(generateUrl(rs.getString("urlCatName") + "/" + rs.getString("category_url_exp"), rs.getString("unique_id"), rs.getString("b_Name"), null));
                    }

                    if (mbean.getH_title() == null) {
                        mbean.setH_title(ApplicationUtils.toTitleCase(generateUrl(rs.getString("h_title"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));
                    }

                    if (pBean.getCatDesc() == null) {
                        pBean.setCatDesc(rs.getString("cdesc1"));
                    }
                }
                for (int i = 70; i < numCol + 1; i++) {
                    if (meta.getColumnName(i).equals("pdesc")) {
                        pBean.setPdesc(rs.getString("pdesc"));
                        break;
                    }
                }
                if (pBean.getPdesc() == null) {
                    pBean.setPdesc(rs.getString("short_desc"));
                }

                pBean.setUrl(generateUrl(rs.getString("p_url_exp"), rs.getString("unique_id"), rs.getString("b_Name"), null));

                HashMap gFeatureMap = new HashMap();
                for (int i = 1; i < 30; i++) {
                    if (rs.getString("f" + i) != null) {
                        gFeatureMap.put("f" + i, rs.getString("f" + i));
                    }
                }
                pBean.setgFeatureMap(gFeatureMap);

                return pBean;
            }

        });
        return detailList;
    }

    public static void main(String[] args) {
        ListGenerator li = new ListGenerator();
//        ProductHelper li1 = new ProductHelper();
//        li.getListsDetails(13);
//        ArrayList<ProductBean> data = (ArrayList) li1.getProductLists1(pb.getFilterMap());
//        li1.insertListProductMap(data, 3);
        int cnt = 0;
//        for (Object o : data) {
//            System.out.println("" + o);
//
//            cnt++;
//        }
        li.generateCat(0);
        ConcurrentHashMap cfm = new ConcurrentHashMap();
        HashMap hm = new HashMap();
        cfm.put("1", cnt);
        cfm.put("2", cnt);
        cfm.put(5, cnt);
        cfm.put(3, cnt);

//        System.out.println("count  " + cnt);
    }

}
