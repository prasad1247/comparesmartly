/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.main;

import in.sc.bean.FeatureBean;
import in.sc.bean.ProductBean;
import in.sc.dao.DAOUtils;
import in.sc.dao.ListGenerator;
import in.sc.dao.ProductHelper;
import static in.sc.dao.ProductHelper.featureTable;
import static in.sc.dao.ProductHelper.from;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author PRASAD
 */
@Controller
public class CategoryController {

    @Autowired
    ProductHelper pHelper;

    @Autowired
    ListGenerator lHelper;

    @Autowired
    DAOUtils daoutils;
    @Autowired
    ServletContext servletContext;

    private String singleMobile(HashMap inputMap, Model model) {

        ArrayList<ProductBean> productdata = (ArrayList) pHelper.getProductDetails(inputMap);
        if (productdata.size() > 0) {
            ProductBean pBean = productdata.get(0);
            inputMap.put(featureTable, pBean.getFeatureTable());
            inputMap.put("src_id", pBean.getFeatureSrcId());
            inputMap.put("product_id", pBean.getFeatureId());
            HashMap fIdMap = pHelper.getFeatureMap(inputMap);
            HashMap pFeatureMap = pHelper.getProductFeatures(inputMap);
            HashMap idToFMap = fIdMap;

            inputMap.put(featureTable, "product_feature_map");
            inputMap.put("src_id", 4);
            inputMap.put("product_id", pBean.getProductId());
            HashMap gfIdMap = pHelper.getFeatureMap(inputMap);
            HashMap gpFeatureMap = pHelper.getProductFeatures(inputMap);
            HashMap generateMap = pHelper.generateFMap(pBean, "specific");
            HashMap gidToFMap = gfIdMap;
            model.addAttribute("idToFMap", idToFMap);

            model.addAttribute("pFeatureMap", pFeatureMap);
            model.addAttribute("gidToFMap", gidToFMap);
            model.addAttribute("gpFeatureMap", gpFeatureMap);
            model.addAttribute("generateMap", generateMap);
            ArrayList catList = (ArrayList) lHelper.getListsDetails(0, (int) inputMap.get(ProductHelper.category));
            HashMap alterMap = new HashMap();
            alterMap.put(ProductHelper.category, pBean.getCategoryid());
            alterMap.put(ProductHelper.maxprice, pBean.getNewPrice() + 2000);
            alterMap.put(ProductHelper.minprice, pBean.getNewPrice() - 2000);
            alterMap.put(ProductHelper.from, 0);
            alterMap.put(ProductHelper.to, 4);
            alterMap.put("gFeatureMap", gfIdMap);

            ArrayList alternateList = (ArrayList) pHelper.getProductLists1(alterMap);
            model.addAttribute("alternateList", alternateList);
            model.addAttribute("pBean", pBean);
            model.addAttribute("pList", productdata);
            model.addAttribute("catList", catList);
        } else {
            throw new CategoryController.ResourceNotFoundException();
        }
        return "product_1";
    }

    private String productList(String unique_id, Model model, HashMap inputMap) {

        inputMap.put(featureTable, "product_feature_map");
        inputMap.put("src_id", 4);
        inputMap.put(ProductHelper.getFilterVals, 4);
        HashMap gFeatureMap = pHelper.getFeatureMap(inputMap);
        inputMap.put("gFeatureMap", gFeatureMap);

        try {
            if (inputMap.get("filterQ") != null) {
                HashMap reqMap = generateRequestMap((String) inputMap.get("filterQ"), gFeatureMap);
                inputMap.putAll(reqMap);
                model.addAttribute("filterQ", inputMap.get("filterQ"));
            }
            ArrayList data = (ArrayList) pHelper.getProductLists1(inputMap);
//            if (inputMap.containsKey(pHelper.brandname)) {
//                model.addAttribute("brandName", ((ArrayList) inputMap.get("brandName")).get(0));
//            }
            ArrayList catList = (ArrayList) lHelper.getListsDetails(0, (int) inputMap.get(ProductHelper.category));
            if (data.size() > 0) {
                model.addAttribute("pBean", data.get(0));
            }
            model.addAttribute("dataList", data);
            model.addAttribute("cat_id", inputMap.get(ProductHelper.category));
            model.addAttribute("bMap", pHelper.selectBrand((int) inputMap.get(ProductHelper.category)));
            model.addAttribute("gFeatureMap", gFeatureMap);
            model.addAttribute("catList", catList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "category_1";
    }

    private HashMap generateRequestMap(String filterQ, HashMap fMap) {
        HashMap reqMap = new HashMap();
        String[] split = filterQ.split(",");
        ArrayList filterList = null;
        for (int i = 0; i < split.length; i++) {
            String data = split[i].split("=")[0];
            String val = split[i].split("=")[1];
            if (reqMap.containsKey(data)) {
                filterList = (ArrayList) reqMap.get(data);
            } else {
                filterList = new ArrayList();
            }
            filterList.add(val);
            reqMap.put(data, filterList);
        }

        if (reqMap.containsKey("price")) {
            ArrayList<String> priceList = (ArrayList) reqMap.get("price");
            int minPrice = 1000000000, maxPrice = 0, tMin = 0, tMax = 0;
            for (String o : priceList) {
                String t[] = o.split("-");
                tMin = Integer.parseInt(t[0]);
                tMax = Integer.parseInt(t[2]);
                if (tMin < minPrice) {
                    minPrice = tMin;
                }
                if (tMax > maxPrice) {
                    maxPrice = tMax;
                }
            }
            reqMap.put(ProductHelper.minprice, minPrice);
            reqMap.put(ProductHelper.maxprice, maxPrice);
        }
        StringBuilder whereC = new StringBuilder();
        for (int i = 1; i < 16; i++) {
            if (reqMap.containsKey("f" + i)) {
                FeatureBean fBean = (FeatureBean) fMap.get("f" + i);
                ArrayList<String> fList = fBean.getFilterVals();
                whereC.append(" AND (");
                ArrayList<String> selfList = (ArrayList) reqMap.get("f" + i);
                int putOr = 0;
                for (String o : fList) {
                    for (String o1 : selfList) {
                        if (o.contains(o1)) {
                            if (putOr > 0) {
                                whereC.append(" OR ");
                            }
                            whereC.append(o.split("#")[1]);
                            putOr++;
                        }
                    }
                }
                whereC.append(" ) ");
            }
            reqMap.put(ProductHelper.whereclause, whereC.toString());
        }

        return reqMap;
    }

    private String getHome(Model model, HashMap inputMap) {
        inputMap.put(ProductHelper.from, 0);
        inputMap.put(ProductHelper.to, 6);
        ArrayList data = (ArrayList) pHelper.getProductLists1(inputMap);
        model.addAttribute("populer", data);
        inputMap.put(ProductHelper.to, 4);
        model.addAttribute("bMap", pHelper.selectBrand((int) inputMap.get(ProductHelper.category)));
        ArrayList<String> priceList = (ArrayList) pHelper.getFilterVals(99, (int) inputMap.get(ProductHelper.category));
        int i = 0;
        HashMap priceMap = new HashMap();
        for (String p : priceList) {
            inputMap.put(ProductHelper.whereclause, " and " + p.split("#")[1]);
            data = (ArrayList) pHelper.getProductLists1(inputMap);
            priceMap.put(p.split("#")[0], data);
            i++;
        }
        data = (ArrayList) lHelper.getListsDetails(0, (int) inputMap.get(ProductHelper.category));
        model.addAttribute("catLists", data);
        model.addAttribute("priceMap", priceMap);
        ArrayList catList = (ArrayList) pHelper.getCategoryDetails((int) inputMap.get(ProductHelper.category));
        ProductBean catBean = (ProductBean) catList.get(0);
        model.addAttribute("cat_details", catBean);
        return "cat_home";
    }

    class ResourceNotFoundException extends RuntimeException {
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handleResourceNotFoundException() {
//        System.out.println("");
        return "error-404";
    }

    @RequestMapping(value = {"mobile/mobiles-in-india"})
    public String getMainHome(Model model) {
        int category_id = 1;
        int country_id = 1;
        try {
//            model.addAttribute("category_id", category_id);
//            model.addAttribute("country_id", country_id);
            return "index";
        } catch (Exception e) {
            e.printStackTrace();
            throw new CategoryController.ResourceNotFoundException();
        }
    }

    @RequestMapping(value = {"{category:[a-zA-Z0-9-]+}/{url:[a-zA-Z0-9-]+}"})
    public String getParseUrl(Model model, @PathVariable String category, @PathVariable String url, HttpServletRequest request, @RequestParam(required = false) String filterQ) {
        String unique_id = null;
        String page = null;
        int found = 0;
        HashMap inputMap = new HashMap();
        HashMap catPatternMap = daoutils.getCatPatternMap();
        int pageNo = 1;
        if (request.getParameter("p") != null) {
            pageNo = Integer.parseInt(request.getParameter("p"));
        }
        int from = ((pageNo - 1) * 20);
        inputMap.put(ProductHelper.from, from);
        request.setAttribute("pageNo", (pageNo + 1));
        try {
            if (catPatternMap.containsKey(category)) {
                LinkedList pList = (LinkedList) catPatternMap.get(category);
                inputMap.put(ProductHelper.category, pList.get(0));
                for (int i = 1; i < 5; i++) {
                    Pattern pa = Pattern.compile((String) pList.get(i));
                    Matcher matcher = pa.matcher(url);
                    if (matcher.matches()) {
                        found++;
                        if (i == 2) {
                            unique_id = matcher.group(1);
                            inputMap.put(ProductHelper.unique_id, unique_id);
                            page = singleMobile(inputMap, model);
                            break;
                        }
                        if (i == 3) {
                            String brandName = matcher.group(1);
                            ArrayList bbList = new ArrayList();
                            bbList.add(brandName);
                            inputMap.put(ProductHelper.brandname, bbList);
                            model.addAttribute(ProductHelper.brandname, brandName);
                            page = productList(unique_id, model, inputMap);

                            break;
                        }
                        if (i == 1) {
                            inputMap.put("filterQ", filterQ);
                            page = productList(unique_id, model, inputMap);
                            break;
                        }
                        if (i == 4) {
                            inputMap.put("filterQ", filterQ);
                            page = getHome(model, inputMap);
                            break;
                        }

                    }
                }
                if (found == 0) {
                    String cUrl = request.getRequestURL().toString();
                    cUrl = cUrl.substring(cUrl.lastIndexOf("/") + 1);
                    ArrayList<ProductBean> list = (ArrayList) lHelper.getListsDetails(0, 0);
                    for (ProductBean pb : list) {
                        if (pb.getUrl().equals(cUrl)) {
                            inputMap.put(ProductHelper.catListId, pb.getProductId());
                            inputMap.put("filterQ", filterQ);
                            page = productList(unique_id, model, inputMap);
                            model.addAttribute(ProductHelper.catListId, pb.getProductId());
                            break;
                        }
                    }
                }
            }
            if (request.getParameter("isAdmin") == null && page.equals("category_1")) {
                page = "category_2";
            }
            return page;
        } catch (Exception e) {
            e.printStackTrace();
            throw new CategoryController.ResourceNotFoundException();
        }
    }

    @RequestMapping(value = {"{category:[a-zA-Z0-9-]+}/", "{category:[a-zA-Z0-9-]+}"})
    public String getParseCat(Model model, @PathVariable String category, HttpServletRequest request, @RequestParam(required = false) String filterQ) {
        String unique_id = null;
        String page = "error-404";
        int found = 0;
        HashMap inputMap = new HashMap();
        HashMap catPatternMap = daoutils.getCatPatternMap();
        try {
            if (catPatternMap.containsKey(category)) {
                LinkedList pList = (LinkedList) catPatternMap.get(category);
                inputMap.put(ProductHelper.category, pList.get(0));
                inputMap.put("filterQ", filterQ);
                page = productList(unique_id, model, inputMap);
            }
            if (request.getParameter("isAdmin") == null && page.equals("category_1")) {
                page = "category_2";
            }
            return page;
        } catch (Exception e) {
            e.printStackTrace();
            throw new CategoryController.ResourceNotFoundException();
        }
    }

}
