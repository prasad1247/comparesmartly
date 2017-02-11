/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.dao;


import in.sc.admin.ApplicationUtils;
import in.sc.bean.FeatureBean;
import in.sc.bean.MetaBean;
import in.sc.bean.ProductBean;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

/**
 *
 * @author PRASAD
 */
@Repository
public class ProductHelper {

    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public static String category = "category";
    public static String category_name = "category_name";
    public static String country = "country";
    public static String brand = "brand";
    public static String brandname = "brandName";
    public static String retailer = "retailer";
    public static String unique_id = "uniqueid";
    public static String from = "from";
    public static String to = "to";
    public static String feature1 = "feature1";
    public static String feature2 = "feature2";
    public static String feature3 = "feature3";
    public static String minprice = "minprice";
    public static String maxprice = "maxprice";
    public static String featureTable = "featureTable";
    public static String product_id = "product_id";
    public static String featureToIdMap = "featureToIdMap";
    public static String idToFeatureMap = "idToFeatureMap";
    public static String whereclause = "whereclause";
    public static String orderclause = "orderclause";
    public static String catListId = "clId";
    public static String getFilterVals = "getFilterVals";
    static SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy");
    static SimpleDateFormat format1 = new SimpleDateFormat("MMM-yyyy");

    public NamedParameterJdbcTemplate getTemplate() {
        if (namedParameterJdbcTemplate == null) {
            DriverManagerDataSource dataSource = new DriverManagerDataSource();
            dataSource.setSchema("smart_compare");
            dataSource.setUsername("root");
            dataSource.setPassword("root");
//            dataSource.setPassword("rose@123");
            dataSource.setUrl("jdbc:mysql://localhost:3306/smart_compare");
//            dataSource.setURL("jdbc:mysql://52.42.111.208:3033/smart_compare");
            namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        }
        return namedParameterJdbcTemplate;
    }

    public void submitPoints(HashMap pMap) {
        StringBuilder sql = new StringBuilder();
        sql.append("insert into product_points_map(product_id,points1,points2,points3,points4,points5,points_src,points_url)values(:product_id,:points1,:points2,:points3,:points4,"
                + ":points5,:points_src,:points_url) ");
        getTemplate().update(sql.toString(), pMap);
    }

    public HashMap getFeatureMap(HashMap pMap) {
        StringBuilder sql = new StringBuilder();
        sql.append(" select * from category_feature_map cf where src_id= :src_id and cat_id=:category");
        namedParameterJdbcTemplate = getTemplate();
        HashMap featureMap = namedParameterJdbcTemplate.query(sql.toString(), pMap, new ResultSetExtractor<HashMap>() {
            @Override
            public HashMap extractData(ResultSet rs) throws SQLException, DataAccessException {
                HashMap idToFeatureMap = new HashMap();
                while (rs.next()) {
                    FeatureBean fBean = new FeatureBean();
                    fBean.setFeatureGroup(rs.getString("feature_group"));
                    fBean.setFeatureName(rs.getString("feature_name"));
                    fBean.setFeatureId(rs.getInt("feature_id"));
                    fBean.setFeatureId(rs.getInt("feature_id"));
                    fBean.setGlyphicons(rs.getString("glyphicons"));
                    fBean.setFeatureTable("Src_id " + rs.getInt("src_id"));
                    // featureToIdMap.put(fBean, "f" + rs.getInt("feature_id"));
                    idToFeatureMap.put("f" + rs.getInt("feature_id"), fBean);
                }
                // dataMap.put("featureToIdMap", featureToIdMap);
                // dataMap.put("idToFeatureMap", idToFeatureMap);
                return idToFeatureMap;
            }
        });
        Integer aa = (Integer) pMap.get("src_id");
        if (aa == 4 && pMap.containsKey(getFilterVals)) {
            Iterator itr = featureMap.keySet().iterator();
            HashMap newIdMap = new HashMap();
            while (itr.hasNext()) {
                String fid = (String) itr.next();
                FeatureBean fBean = (FeatureBean) featureMap.get(fid);
                fBean.setFilterVals((ArrayList) getFilterVals(fBean.getFeatureId(), (Integer) pMap.get(category)));
                newIdMap.put(fid, fBean);
            }
            featureMap = newIdMap;
        }
        return featureMap;
    }

    public List<ProductBean> getProductLists1(final HashMap inputMap) {
        int toCount = 20;
        final int flag = 0;
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT p_name,min(pt.productname)as productname,pd.unique_id, MIN(pt.NewPrice)as newprice,min(pt.url) as sellerUrl, "
                + " count(1)as records,max(pt.imglink)as p_img,bd.b_name,li.p_url_exp,li.brand_url_exp, "
                + " li.home_url_exp, "
                + " li.category_url_exp,li.p_keywords,p_title,li.p_desc,b_keywords,b_title,li.b_desc,h_keywords,h_title,h_desc,1 as country_id,max(pt.pricedate) "
                + " pricedate, cd.cat_name,cd.s_cat_name,pd.cat_id,cd.cdesc1,product_id_pr,product_id_sp,product_id_91,pd.product_id,pd.specscore,cb.cb_desc,pd.short_Desc,li.cat_name as urlCatName,pfm.* ");
        if (inputMap.containsKey(catListId)) {
            sql.append(",lpm.pdesc,lpm.rank,cl.list_desc,cl.list_name,cl.list_url,cl.metadesc ");
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
            sql.append(" AND pd.cat_id in(:" + category + ") ");

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
            sql.append(" AND pt.retailer_id in(:" + retailer + ") ");
        }
        if (inputMap.containsKey(unique_id)) {
            sql.append(" AND pd.unique_id in(:" + unique_id + ") ");
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

                pBean.setProductName(rs.getString("p_name"));
                pBean.setUniqueId(rs.getString("unique_id"));
                pBean.setProductId(rs.getInt("product_id"));
                pBean.setImgLink(getImgUrl(rs.getString("p_img")));
                pBean.setBrandName(rs.getString("b_Name"));
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
                    for (int i = 75; i < numCol + 1; i++) {
                        if (meta.getColumnName(i).equals("metadesc")) {
                            mbean.setH_desc(ApplicationUtils.toTitleCase(generateUrl(rs.getString("metadesc"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));
                            break;
                        }
                    }
                    if (mbean.getH_desc() == null) {
                        mbean.setH_desc(ApplicationUtils.toTitleCase(generateUrl(rs.getString("h_desc"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));
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

                pBean.setSellerUrl(rs.getString("sellerUrl"));
                pBean.setpUrl(generateUrl(rs.getString("urlCatName") + "/" + rs.getString("p_url_exp"), rs.getString("unique_id"), rs.getString("b_Name"), null));
                pBean.setbUrl(generateUrl(rs.getString("urlCatName") + "/" + rs.getString("brand_url_exp"), rs.getString("unique_id"), rs.getString("b_Name"), null));

                pBean.setHomeurl(generateUrl(rs.getString("urlCatName") + "/" + rs.getString("home_url_exp"), rs.getString("unique_id"), rs.getString("b_Name"), null));

                mbean.setP_title(ApplicationUtils.toTitleCase(generateUrl(rs.getString("p_title"), rs.getString("unique_id"), rs.getString("b_Name"), "").replace("-", " ")));
                mbean.setB_title(ApplicationUtils.toTitleCase(generateUrl(rs.getString("b_title"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));

                mbean.setP_desc(ApplicationUtils.toTitleCase(generateUrl(rs.getString("p_desc"), rs.getString("unique_id"), rs.getString("b_Name"), "").replace("-", " ")));
                mbean.setB_desc(ApplicationUtils.toTitleCase(generateUrl(rs.getString("b_desc"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));

                mbean.setP_keywords(ApplicationUtils.toTitleCase(generateUrl(rs.getString("p_keywords"), rs.getString("unique_id"), rs.getString("b_Name"), "").replace("-", " ")));
                mbean.setB_keywords(ApplicationUtils.toTitleCase(generateUrl(rs.getString("b_keywords"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));
                mbean.setH_keywords(ApplicationUtils.toTitleCase(generateUrl(rs.getString("h_keywords"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));

                pBean.setMbean(mbean);
//                System.out.println(""+rs.getString("category_url_exp")+"   "+ rs.getString("home_url_exp"));
                pBean.setpListDesc((ArrayList) getProductListDesc(pBean.getProductId(), rs.getString("urlCatName")));
//                pBean.setProductName(ApplicationUtils.toTitleCase(pBean.getProductName()));

                if (rs.getInt("product_id_pr") > 0) {
                    pBean.setFeatureId(rs.getInt("product_id_pr"));
                    pBean.setFeatureTable("product_feature_map_pr");
                    pBean.setFeatureSrcId(2);
                } else if (rs.getInt("product_id_91") > 0) {
                    pBean.setFeatureId(rs.getInt("product_id_91"));
                    pBean.setFeatureTable("product_feature_map_91");
                    pBean.setFeatureSrcId(3);
                } else if (rs.getInt("product_id_sp") > 0) {
                    pBean.setFeatureId(rs.getInt("product_id_sp"));
                    pBean.setFeatureSrcId(1);
                }
                if (inputMap.get("gFeatureMap") != null) {
                    pBean.setgFeatureMap(generateFMap(pBean, "general", (HashMap) inputMap.get("gFeatureMap")));
                }
                return pBean;
            }

        });
        return detailList;
    }

    public List<ProductBean> getProductDetails(HashMap inputMap) {
        StringBuilder sql = new StringBuilder();
        ArrayList inputList = new ArrayList();
        sql.append("Select distinct pl.productName AS productName,REPLACE(pm.unique_id,'-',' ') p_name ,pm.product_id,pm.product_id_sp,pm.product_id_pr,pm.product_id_91, ");
        sql.append(" b.b_name,newPrice,oldPrice,url,pl.imgLink,seller,pm.unique_id,li.p_url_exp,li.brand_url_exp,li.home_url_exp,li.category_url_exp, ");
        sql.append(" rs.RetailerName,rs.RetailerAddress,rs.RetailerDesc,rs.Logo, li.p_keywords,p_title,pm.p_desc,b_keywords,b_title,li.b_desc,h_keywords,h_title,h_desc, ");
        sql.append(" pl.country_id,pl.category_id,pl.pricedate, c.cat_name,c.s_cat_name,pm.short_desc,li.cat_name as urlcatname ");
        sql.append(" from product_transaction pl,brand_details b,product_details pm,linkgenerator li,category_details c,retailers rs ");
        sql.append(" where pl.unique_id=pm.unique_id ");
        sql.append(" and pl.brand_id=b.brand_id ");
        sql.append(" and pm.cat_id=c.cat_id ");
        sql.append(" and rs.Retailer_Id=pl.retailer_id ");
        sql.append(" AND li.category_id=pm.cat_id ");
        sql.append(" AND li.country_id=pl.country_id ");

        if (inputMap.containsKey(category)) {
            sql.append(" AND pl.category_id in(:" + category + ") ");
            inputList.add(inputMap.get(category));
        }
        if (inputMap.containsKey(country)) {
            sql.append(" AND pl.country_id in(:" + country + ") ");
            inputList.add(inputMap.get(country));
        }
        if (inputMap.containsKey(unique_id)) {
            sql.append(" AND pm.unique_id in(:" + unique_id + ") ");
            inputList.add(inputMap.get(unique_id));
        }

        sql.append(" order by pricedate desc,newPrice asc ");
//        System.out.println("sql  " + sql.toString());
        namedParameterJdbcTemplate = getTemplate();
        List<ProductBean> detailList = namedParameterJdbcTemplate.query(sql.toString(), inputMap, new RowMapper<ProductBean>() {

            @Override
            public ProductBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                ProductBean pBean = new ProductBean();
                MetaBean mbean = new MetaBean();
                pBean.setNewPrice(rs.getInt("newPrice"));
                pBean.setProductName(rs.getString("productName"));
                pBean.setUniqueId(rs.getString("unique_id"));
                pBean.setImgLink(getImgUrl(rs.getString("imgLink")));
                pBean.setRetailer(rs.getString("RetailerName"));
                pBean.setSeller(rs.getString("seller"));
                pBean.setRetailerLogo(rs.getString("Logo"));
                pBean.setSellerUrl(rs.getString("url"));
                pBean.setUniqueName(rs.getString("p_name"));
                pBean.setBrandName(rs.getString("b_Name"));
                pBean.setCategoryid(rs.getInt("category_id"));
                pBean.setCountryid(rs.getInt("country_id"));
                pBean.setPriceDate(rs.getDate("pricedate"));
                pBean.setPdesc(rs.getString("p_desc"));
                if (pBean.getPdesc() == null) {
                    pBean.setPdesc(rs.getString("short_desc"));
                }
                pBean.setCategoryName(rs.getString("cat_name"));
                pBean.setsCatName(rs.getString("s_cat_name"));
                pBean.setProductId(rs.getInt("product_id"));

                pBean.setUrl(generateUrl(rs.getString("p_url_exp"), rs.getString("unique_id"), rs.getString("b_Name"), null));
                pBean.setbUrl(generateUrl(rs.getString("brand_url_exp"), rs.getString("unique_id"), rs.getString("b_Name"), null));
                pBean.setCatUrl(generateUrl(rs.getString("category_url_exp"), rs.getString("unique_id"), rs.getString("b_Name"), null));
                pBean.setHomeurl(generateUrl(rs.getString("home_url_exp"), rs.getString("unique_id"), rs.getString("b_Name"), null));

                mbean.setP_title(ApplicationUtils.toTitleCase(generateUrl(rs.getString("p_title"), rs.getString("unique_id"), rs.getString("b_Name"), "").replace("-", " ")));
                mbean.setB_title(ApplicationUtils.toTitleCase(generateUrl(rs.getString("b_title"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));
                mbean.setH_title(ApplicationUtils.toTitleCase(generateUrl(rs.getString("h_title"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));

                mbean.setP_desc(ApplicationUtils.toTitleCase(generateUrl(rs.getString("p_desc"), rs.getString("unique_id"), rs.getString("b_Name"), "").replace("-", " ")));
                mbean.setB_desc(ApplicationUtils.toTitleCase(generateUrl(rs.getString("b_desc"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));
                mbean.setH_desc(ApplicationUtils.toTitleCase(generateUrl(rs.getString("h_desc"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));

                mbean.setP_keywords(ApplicationUtils.toTitleCase(generateUrl(rs.getString("p_keywords"), rs.getString("unique_id"), rs.getString("b_Name"), "").replace("-", " ")));
                mbean.setB_keywords(ApplicationUtils.toTitleCase(generateUrl(rs.getString("b_keywords"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));
                mbean.setH_keywords(ApplicationUtils.toTitleCase(generateUrl(rs.getString("h_keywords"), rs.getString("unique_id"), rs.getString("b_Name"), null).replace("-", " ")));

                pBean.setMbean(mbean);
                pBean.setpListDesc((ArrayList) getProductListDesc(pBean.getProductId(), rs.getString("urlcatname")));
                if (rs.getInt("product_id_pr") > 0) {
                    pBean.setFeatureId(rs.getInt("product_id_pr"));
                    pBean.setFeatureTable("product_feature_map_pr");
                    pBean.setFeatureSrcId(2);
                } else if (rs.getInt("product_id_91") > 0) {
                    pBean.setFeatureId(rs.getInt("product_id_91"));
                    pBean.setFeatureTable("product_feature_map_91");
                    pBean.setFeatureSrcId(3);
                } else if (rs.getInt("product_id_sp") > 0) {
                    pBean.setFeatureId(rs.getInt("product_id_sp"));
                    pBean.setFeatureTable("product_feature_map_sp");
                    pBean.setFeatureSrcId(1);
                }
                pBean.setgFeatureMap(generateFMap(pBean, "general"));
                return pBean;
            }
        });
        return detailList;
    }

    public List getProductListDesc(int product_id, final String cat_name) {
        StringBuilder sql = new StringBuilder();
        sql.append("select * from cat_lists cl,list_product_map lpm where cl.cl_id=lpm.cl_id and lpm.product_id= " + product_id);
        namedParameterJdbcTemplate = getTemplate();
        List f = namedParameterJdbcTemplate.query(sql.toString(), new RowMapper<ProductBean>() {

            @Override
            public ProductBean mapRow(ResultSet rs, int i) throws SQLException {
                String suffix="";
                ProductBean pb = new ProductBean();
                if(rs.getInt("rank")==1) suffix="st";else
                if(rs.getInt("rank")==2) suffix="nd";else
                if(rs.getInt("rank")==3) suffix="rd";else suffix="th";
              //  pb.setPdesc("Ranked " + rs.getInt("rank") +suffix+ " in " + rs.getString("list_name"));
                pb.setUrl(cat_name + "/" + rs.getString("list_url"));
                pb.setPdesc("<p>Ranked <b>"+rs.getInt("rank") +suffix+ "</b> in "+ "<a rel=\"nofollow\" target=\"_blank\" href=\""+rs.getString("list_url")+"\">"+rs.getString("list_name")+"</a></p>");
                
                return pb;
            }
        });
        return f;
    }

    public HashMap getProductFeatures(HashMap pMap) {
        StringBuilder sql = new StringBuilder();
        sql.append(" select * from " + pMap.get(featureTable) + " where product_id= :" + product_id);
        namedParameterJdbcTemplate = getTemplate();
        HashMap featureMap = namedParameterJdbcTemplate.query(sql.toString(), pMap, new ResultSetExtractor<HashMap>() {
            @Override
            public HashMap extractData(ResultSet rs) throws SQLException, DataAccessException {
                HashMap dataMap = new HashMap();
                ResultSetMetaData rsmd = rs.getMetaData();

                while (rs.next()) {
                    for (int i = 1; i < rsmd.getColumnCount(); i++) {
                        if (rsmd.getColumnName(i).contains("f") && !rsmd.getColumnName(i).contains("pf_id")) {
                            dataMap.put(rsmd.getColumnName(i), rs.getString(i));
                        }
                    }
                }
                return dataMap;
            }
        });
        return featureMap;
    }

    public HashMap getCatPatterns(HashMap pMap) {
        StringBuilder sql = new StringBuilder();
        sql.append(" select cat_name,category_id,productPattern,brandPattern,homePattern,catpattern from linkgenerator");
        namedParameterJdbcTemplate = getTemplate();
        HashMap featureMap = namedParameterJdbcTemplate.query(sql.toString(), pMap, new ResultSetExtractor<HashMap>() {
            @Override
            public HashMap extractData(ResultSet rs) throws SQLException, DataAccessException {
                HashMap dataMap = new HashMap();
                LinkedList li = null;
                while (rs.next()) {
                    li = new LinkedList();
                    li.add(rs.getInt("category_id"));
                    li.add(rs.getString("homePattern"));
                    li.add(rs.getString("productPattern"));
                    li.add(rs.getString("brandPattern"));
                    li.add(rs.getString("catPattern"));
                    dataMap.put(rs.getString("cat_name"), li);
                }
                return dataMap;
            }
        });
        return featureMap;
    }

    public LinkedHashMap selectBrand(int cat_id) {
        StringBuilder sql = new StringBuilder();
        LinkedHashMap bMap = new LinkedHashMap();
        try {
            sql.append(" SELECT distinct b.BRAND_ID,B_NAME,b.B_DESC,B_RATING,B_POPULARITY,B_UNIQUE_NAME,B_IMG,b.STATUS,li.brand_url_Exp,li.cat_name,cb.brand_rating FROM brand_details b,product_transaction pt,linkgenerator li,cat_brand_map cb "
                    + " where b.brand_id=pt.brand_id and cb.cat_id =pt.category_id and cb.brand_id=b.brand_id and li.category_id=pt.category_id and pt.category_id=" + cat_id + " order by cb.brand_rating desc ");
            namedParameterJdbcTemplate = getTemplate();
            bMap = namedParameterJdbcTemplate.query(sql.toString(), new ResultSetExtractor<LinkedHashMap>() {
                @Override
                public LinkedHashMap extractData(ResultSet rs) throws SQLException, DataAccessException {
                    LinkedHashMap dataMap = new LinkedHashMap();
                    while (rs.next()) {
                        String url = generateUrl(rs.getString("cat_name") + "/" + rs.getString("brand_url_exp"), null, rs.getString("b_Name"), null);
                        dataMap.put(rs.getString("B_NAME"), rs.getInt("BRAND_ID") + "#" + url+"#"+rs.getString("B_IMG"));
                    }

                    return dataMap;
                }
            });

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return bMap;
    }

    public static String getImgUrl(String p_img) {

        if (p_img != null && !p_img.contains("http")) {
            p_img = "res/" + p_img;
        }
        String[] imgList = p_img.split(";");
        for (int i = 0; i < imgList.length; i++) {
            if (imgList[i].contains("200x200")) {
                return imgList[i];

            }
        }
        for (int i = 0; i < imgList.length; i++) {
            if (imgList[i].contains("400x400")) {
                return imgList[i];

            }
        }

        return p_img.split(";")[0];

    }

    public static String generateUrl(String url_exp, String unique_id, String brand_name, String retailer) {
        String url = url_exp;

        String date1 = format.format(new Date());
        String month = format1.format(new Date());

        if (url_exp.contains("{unique_id}")) {
            url = url.replace("{unique_id}", unique_id);
        }
        if (url_exp.contains("{brand_name}")) {
            url = url.replace("{brand_name}", brand_name);
        }
        if (url_exp.contains("{month}")) {
            url = url.replace("{month}", month);
        }
        if (url_exp.contains("{date}")) {
            url = url.replace("{date}", date1);
        }
        if (url_exp.contains("{retailer}")) {
            url = url.replace("{retailer}", retailer);
        }

        return url;
    }

    public HashMap generateFMap(ProductBean pBean, String type) {
        HashMap inputMap = new HashMap();
        inputMap.put(category, pBean.getCategoryid());
        if (type.equalsIgnoreCase("general")) {
            inputMap.put(featureTable, "product_feature_map");
            inputMap.put("src_id", 4);
            inputMap.put("product_id", pBean.getProductId());
        } else {
            inputMap.put(featureTable, pBean.getFeatureTable());
            inputMap.put("src_id", pBean.getFeatureSrcId());
            inputMap.put("product_id", pBean.getFeatureId());
        }

        HashMap gpFeatureMap = getProductFeatures(inputMap);
        HashMap<String, FeatureBean> gidToFMap = getFeatureMap(inputMap);

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
            gList.add(ApplicationUtils.printIfBlank(fBean.getGlyphicons()) + "#" + fBean.getFeatureName() + "#" + gpFeatureMap.get(fId));
            gMap.put(fBean.getFeatureGroup(), gList);
        }
        return gMap;
    }

    private HashMap generateFMap(ProductBean pBean, String type, HashMap hashMap) {
        HashMap inputMap = new HashMap();
        inputMap.put(category, pBean.getCategoryid());
        if (type.equalsIgnoreCase("general")) {
            inputMap.put(featureTable, "product_feature_map");
            inputMap.put("src_id", 4);
            inputMap.put("product_id", pBean.getProductId());
        } else {
            inputMap.put(featureTable, pBean.getFeatureTable());
            inputMap.put("src_id", pBean.getFeatureSrcId());
            inputMap.put("product_id", pBean.getFeatureId());
        }

        HashMap gpFeatureMap = getProductFeatures(inputMap);
        HashMap<String, FeatureBean> gidToFMap = hashMap;

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
            gList.add(ApplicationUtils.printIfBlank(fBean.getGlyphicons()) + "#" + fBean.getFeatureName() + "#" + gpFeatureMap.get(fId));
            gMap.put(fBean.getFeatureGroup(), gList);
        }
        return gMap;
    }

    public List getFilterVals(int featureId, int cat_id) {
        StringBuilder sql = new StringBuilder();
        List fList = null;
        try {
            sql.append(" SELECT * FROM filtervals WHERE cfm_ID=" + featureId + " and cat_id=" + cat_id);
            namedParameterJdbcTemplate = getTemplate();
            fList = namedParameterJdbcTemplate.query(sql.toString(), new RowMapper<String>() {

                @Override
                public String mapRow(ResultSet rs, int i) throws SQLException {

                    return rs.getString("filter_name") + "#" + rs.getString("filter_vals") + "#";
                }

            });

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return fList;

    }

    public List getCategoryDetails(int cat_id) {
        StringBuilder sql = new StringBuilder();
        List fList = null;
        try {
            sql.append(" SELECT c.*,li.cat_name as urlCatName,li.* FROM category_details c,linkgenerator li WHERE li.category_id=c.cat_id and c.cat_id=" + cat_id);
            namedParameterJdbcTemplate = getTemplate();
            fList = namedParameterJdbcTemplate.query(sql.toString(), new RowMapper<ProductBean>() {

                @Override
                public ProductBean mapRow(ResultSet rs, int i) throws SQLException {
                    ProductBean pb = new ProductBean();
                    MetaBean mbean = new MetaBean();
                    mbean.setP_title(ApplicationUtils.toTitleCase(generateUrl(rs.getString("ctitle"), null, null, "").replace("-", " ")));
                    mbean.setP_desc(ApplicationUtils.toTitleCase(generateUrl(rs.getString("cmetadesc"), null, null, "").replace("-", " ")));
                    pb.setMbean(mbean);
                    pb.setUrl(generateUrl(rs.getString("urlCatName") + "/"+rs.getString("home_url_exp") , null, null, null));
                    pb.setCatUrl(generateUrl(rs.getString("urlCatName") + "/"+rs.getString("category_url_exp") , null, null, null));
                    pb.setProductName(rs.getString("cat_name"));
                    pb.setCatDesc(rs.getString("cdesc1"));  //cdesc1 for category_2 page
                    pb.setPdesc(rs.getString("cdesc2")); // home page
                    pb.setBrandCatDesc(rs.getString("cdesc3")); //home page

                    return pb;
                }

            });

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return fList;

    }

    protected List insertListProductMap(ArrayList<ProductBean> pList, int cl_id) {
        StringBuilder sql = new StringBuilder();
        List fList = null;
        try {
            sql.append(" insert into list_product_map(cl_id,product_id,pdesc,rank)values(:cl_id,:product_id,:pdesc,:rank) ");
            namedParameterJdbcTemplate = getTemplate();
            HashMap inMap = new HashMap();
            int rank = 1;
            for (ProductBean pb : pList) {
                inMap.put("cl_id", cl_id);
                inMap.put("product_id", pb.getProductId());
                inMap.put("pdesc", pb.getPdesc());
                inMap.put("rank", rank++);
                namedParameterJdbcTemplate.update(sql.toString(), inMap);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return fList;

    }

    public static void main(String[] args) {
        HashMap a = new HashMap();
        ArrayList brandL = new ArrayList();
        brandL.add("apple");
        brandL.add("sony");
//        a.put(category, 137);
//        a.put(country, 1);
        a.put(brand, brandL);
        String whereC = " AND (CAST(TRIM(f13) AS DECIMAL(10,2)) =1 or CAST(TRIM(f13) AS DECIMAL(10,2)) =2) and CAST(TRIM(f14) AS DECIMAL(10,2)) BETWEEN 1.3 AND 2.7 ";
//        a.put(unique_id, "panasonic-p66-mega");
        a.put(from, 0);
        a.put(whereclause, whereC);

        try {
            ArrayList<ProductBean> data = (ArrayList) new ProductHelper().getProductLists1(a);
            int cnt = 0;
            for (Object o : data) {
//                System.out.println("" + o);
                cnt++;
            }
//            System.out.println("count  " + cnt);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateBDesc(String brandname, String desc, int cat_id) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append(" update cat_brand_map set cb_desc=:desc where brand_id=(select brand_id from brand_details where b_unique_name=:brandname) and cat_id=:cat_id");
            namedParameterJdbcTemplate = getTemplate();
            HashMap inMap = new HashMap();
            inMap.put("cat_id", cat_id);
            inMap.put("brandname", brandname);
            inMap.put("desc", desc);
            namedParameterJdbcTemplate.update(sql.toString(), inMap);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }

    }

    public void updateCL_PDesc(int productId, int clId, String htmldesc, int parseInt) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append(" update list_product_map set pdesc=:desc where product_id=:productId and cl_id=:cl_id");
            namedParameterJdbcTemplate = getTemplate();
            HashMap inMap = new HashMap();
            inMap.put("cl_id", clId);
            inMap.put("productId", productId);
            inMap.put("desc", htmldesc);
            namedParameterJdbcTemplate.update(sql.toString(), inMap);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }

    public void updateCL_Desc(int clId, String htmldesc, int parseInt) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append(" update cat_lists set list_desc=:desc where  cl_id=:clId");
            namedParameterJdbcTemplate = getTemplate();
            HashMap inMap = new HashMap();
            inMap.put("clId", clId);
            inMap.put("desc", htmldesc);
            namedParameterJdbcTemplate.update(sql.toString(), inMap);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }

    public void updatePDesc(int productId, String htmldesc, int parseInt, String descType) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append(" update product_details set " + descType + "=:desc where product_id=:productId ");
            namedParameterJdbcTemplate = getTemplate();
            HashMap inMap = new HashMap();
            inMap.put("productId", productId);
            inMap.put("desc", htmldesc);
            namedParameterJdbcTemplate.update(sql.toString(), inMap);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }

    public void updateCDesc(String htmldesc, int cat_id) {
        StringBuilder sql = new StringBuilder();
        try {
            sql.append(" update category_details set cdesc1=:desc where cat_id=:cat_id ");
            namedParameterJdbcTemplate = getTemplate();
            HashMap inMap = new HashMap();
            inMap.put("cat_id", cat_id);
            inMap.put("desc", htmldesc);
            namedParameterJdbcTemplate.update(sql.toString(), inMap);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }

}
