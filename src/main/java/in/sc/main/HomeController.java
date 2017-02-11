/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.main;

import in.sc.bean.FeatureBean;
import in.sc.dao.ListGenerator;
import in.sc.dao.ProductHelper;
import static in.sc.dao.ProductHelper.category;
import static in.sc.dao.ProductHelper.country;
import static in.sc.dao.ProductHelper.featureTable;
import static in.sc.dao.ProductHelper.from;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author Asus
 */
@Controller
public class HomeController {

    @Autowired
    ProductHelper pHelper;
    @Autowired
    ListGenerator lHelper;

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

    class ResourceNotFoundException extends RuntimeException {
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handleResourceNotFoundException() {
//        System.out.println("");
        return "error-404";
    }

    @RequestMapping(value = {"/", "home"})
    public String getMainHome(Model model) {
        HashMap inputMap = new HashMap();
        inputMap.put(ProductHelper.from, 0);
        inputMap.put(ProductHelper.to, 6);
        System.out.println("in Home");
        try {
            inputMap.put(ProductHelper.category, 137);
            ArrayList data = (ArrayList) pHelper.getProductLists1(inputMap);
            model.addAttribute("phones", data);
            inputMap.put(ProductHelper.category, 180);
            ArrayList tvdata = (ArrayList) pHelper.getProductLists1(inputMap);
            model.addAttribute("tvs", tvdata);
            inputMap.put(ProductHelper.category, 193);
            ArrayList pbdata = (ArrayList) pHelper.getProductLists1(inputMap);
            model.addAttribute("pbs", pbdata);
            inputMap.put(ProductHelper.category, 212);
            ArrayList headdata = (ArrayList) pHelper.getProductLists1(inputMap);
            model.addAttribute("headphones", headdata);
            return "home";
        } catch (Exception e) {
            e.printStackTrace();
            throw new ResourceNotFoundException();
        }
    }

    @RequestMapping(value = {"aboutus"})
    public String getAboutUs(Model model) {
        try {
            return "aboutus";
        } catch (Exception e) {
            e.printStackTrace();
            throw new ResourceNotFoundException();
        }
    }

    @RequestMapping(value = {"termsofuse"})
    public String getTerms(Model model) {
        try {

            return "terms";
        } catch (Exception e) {
            e.printStackTrace();
            throw new ResourceNotFoundException();
        }
    }

    @RequestMapping(value = {"privacypolicy"})
    public String getPrivacyPol(Model model) {
        try {
            return "privacy";
        } catch (Exception e) {
            e.printStackTrace();
            throw new ResourceNotFoundException();
        }
    }

    @RequestMapping(value = {"admin-product"})
    public String getAdminProduct(Model model) {
        int category_id = 1;
        int country_id = 1;
        try {
//            model.addAttribute("category_id", category_id);
//            model.addAttribute("country_id", country_id);
            return "admin_product";
        } catch (Exception e) {
            e.printStackTrace();
            throw new ResourceNotFoundException();
        }
    }

    @RequestMapping(value = {"post_points"})
    public @ResponseBody
    String getPostPoints(Model model, HttpServletRequest request) {
        int category_id = 1;
        int country_id = 1;
        try {
//            System.out.println(request.getParameter("product"));
//            System.out.println(request.getParameter("p1"));
//            System.out.println(request.getParameter("p2"));
//            System.out.println(request.getParameter("p3"));
//            System.out.println(request.getParameter("p4"));
//            System.out.println(request.getParameter("points5"));
//            System.out.println(request.getParameter("s"));
//            System.out.println(request.getParameter("sUrl"));
            HashMap<String, Object> pMap = new HashMap();
            pMap.put("product_id", request.getParameter("product"));
            pMap.put("points1", request.getParameter("p1"));
            pMap.put("points2", request.getParameter("p2"));
            pMap.put("points3", request.getParameter("p3"));
            pMap.put("points4", request.getParameter("p4"));
            pMap.put("points5", request.getParameter("points5"));
            pMap.put("points_src", request.getParameter("s"));
            pMap.put("points_url", request.getParameter("sUrl"));
            pHelper.submitPoints(pMap);
            return "Submitted Successfully";
        } catch (Exception e) {
            e.printStackTrace();
            throw new ResourceNotFoundException();
        }
    }

    @RequestMapping(value = {"category"})
    public String getCategiryProduct(Model model, @RequestParam(required = false) String filterQ) {
        try {
            HashMap a = new HashMap();
            ArrayList brandL = new ArrayList();
            brandL.add("apple");
            a.put(category, 137);
            a.put(country, 1);
            a.put(from, 0);
            a.put(featureTable, "product_feature_map");
            a.put("src_id", 4);
            try {
                if (filterQ != null) {
                    HashMap reqMap = generateRequestMap(filterQ, pHelper.getFeatureMap(a));
                    a.putAll(reqMap);
                    model.addAttribute("filterQ", filterQ);
                }

                ArrayList data = (ArrayList) pHelper.getProductLists1(a);

                model.addAttribute("dataList", data);
                model.addAttribute("bMap", pHelper.selectBrand((int) a.get(category)));
                model.addAttribute("gFeatureMap", pHelper.getFeatureMap(a));

            } catch (Exception e) {
                e.printStackTrace();
            }

//            model.addAttribute("country_id", country_id);
            return "category_1";
        } catch (Exception e) {
            e.printStackTrace();
            throw new ResourceNotFoundException();
        }
    }

    @RequestMapping(value = {"product"})
    public String getProduct(Model model) {
        int category_id = 1;
        int country_id = 1;
        try {
//            model.addAttribute("category_id", category_id);
//            model.addAttribute("country_id", country_id);
            return "product";
        } catch (Exception e) {
            e.printStackTrace();
            throw new ResourceNotFoundException();
        }
    }


}
