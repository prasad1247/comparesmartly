/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.main;

import in.sc.dao.ListGenerator;
import in.sc.dao.ProductHelper;
import in.sc.matcher.DescGenerator;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Asus
 */
@Controller
public class AdminController {

    @Autowired
    ProductHelper pHelper;
    @Autowired
    ListGenerator lHelper;

    @RequestMapping(value = {"addList"})
    public String viewAddList() {
        return "addList";
    }

    @RequestMapping(value = {"createList"})
    public String createList(Model model, String cat_id, String list_type, String list_url, String list_name, String min_price, String max_price, String brand_ids, String whereclause, String orderclause, HttpServletRequest request) {
        try {
            HashMap inputMap = new HashMap();
            inputMap.put("cat_id", cat_id);
            inputMap.put("list_type", list_type);
            inputMap.put("list_url", list_url);
            inputMap.put("list_name", list_name);
int listId = 0;
            if (request.getParameter("list_id") == null || request.getParameter("list_id").equals("")) {
             
            if (max_price != null && Integer.parseInt(max_price) > 0) {
                inputMap.put(ProductHelper.minprice, Integer.parseInt(min_price));
                inputMap.put(ProductHelper.maxprice, Integer.parseInt(max_price));
            } else {
                inputMap.put(ProductHelper.minprice, null);
                inputMap.put(ProductHelper.maxprice, null);
            }
            if (brand_ids != null && !brand_ids.equals("")) {
                inputMap.put(ProductHelper.brand, brand_ids);
            } else {
                inputMap.put(ProductHelper.brand, null);
            }
            if (whereclause != null && !whereclause.equals("")) {
                inputMap.put(ProductHelper.whereclause, whereclause);
            } else {
                inputMap.put(ProductHelper.whereclause, null);
            }
            if (orderclause != null && !orderclause.equals("")) {
                inputMap.put(ProductHelper.orderclause, orderclause);
            } else {
                inputMap.put(ProductHelper.orderclause, null);
            }
             //  listId = lHelper.createList(inputMap);
            } else {
                System.out.println(request.getParameter("list_id"));
                listId = Integer.parseInt(request.getParameter("list_id"));
            }

            
            String catNames[] = request.getParameter("cat_names").split("\r\n");
            ArrayList<String> rfined=new ArrayList();
            for (String catName : catNames) {
                if(!catName.equals("")){
                System.out.println(catName);
                rfined.add(catName);
                }
            }
              
            String catsNames[] = request.getParameter("cat_s_names").split("\r\n");
            ArrayList<String> rfined1=new ArrayList();
            for (String catName : catsNames) {
                if(!catName.equals("")){
                System.out.println(catName);
                rfined1.add(catName);
                }
            }
            DescGenerator.cat_names_in= rfined.toArray(new String[1]);
            DescGenerator.cat_s_names_in= rfined1.toArray(new String[1]);
            DescGenerator.dates_in= request.getParameter("date_s");
            int []r={listId};
            DescGenerator.cl_id_in=r;
            DescGenerator.getProducts(137);

        } catch (Exception e) {
            e.printStackTrace();

        }
        return "addList";
    }

    @RequestMapping(value = {"allpages"})
    public String allPages(Model model, String cat_id, String brandName, String cl_id, String type, String htmldesc) {
        try {

        } catch (Exception e) {
            e.printStackTrace();

        }
        return "allpages";
    }

    @RequestMapping(value = {"add_cat"})
    public String addCat(Model model, String cat_id, String brandName, String cl_id, String type, String htmldesc) {
        try {

        } catch (Exception e) {
            e.printStackTrace();

        }
        return "add_cat";
    }

    @RequestMapping(value = {"savedesc"})
    public @ResponseBody
    String saveDescriptionNew(Model model, String cat_id, String brandName, String cl_id, String type, String htmldesc, String product_id) {
        try {
            int clId = 0, productId = 0;
            if (cl_id != null && !cl_id.equals("")) {
                clId = Integer.parseInt(cl_id);
            }
            if (product_id != null && !product_id.equals("")) {
                productId = Integer.parseInt(product_id);
            }

            if (brandName != null && !brandName.equals("")) {
                pHelper.updateBDesc(brandName, htmldesc, Integer.parseInt(cat_id));
            } else if (clId > 0) {
                if (productId > 0) {
                    pHelper.updateCL_PDesc(productId, clId, htmldesc, Integer.parseInt(cat_id));
                } else {
                    pHelper.updateCL_Desc(clId, htmldesc, Integer.parseInt(cat_id));
                }
            } else {
                if (productId > 0) {
                    pHelper.updatePDesc(productId, htmldesc, Integer.parseInt(cat_id), "short_desc");
                } else {
                    pHelper.updateCDesc(htmldesc, Integer.parseInt(cat_id));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return "hi";
    }
}
