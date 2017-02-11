/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.dao;

import java.util.HashMap;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author PRASAD
 */
@Component
public class DAOUtils implements InitializingBean {

    @Autowired
    ProductHelper pHelper;
    @Autowired
    ListGenerator lHelper;
    @Autowired
    ServletContext servletContext;

    private HashMap catPatternMap;

    /**
     * @return the catPatternMap
     */
    public HashMap getCatPatternMap() {
        return catPatternMap;
    }

    /**
     * @param catPatternMap the catPatternMap to set
     */
    public void setCatPatternMap(HashMap catPatternMap) {
        this.catPatternMap = catPatternMap;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        catPatternMap = pHelper.getCatPatterns(null);
        servletContext.setAttribute("menu", lHelper.generateCat(0));
    }

}
