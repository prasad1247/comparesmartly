package in.sc.download;

/***
 * The POJO for the product data.
 * Please refer to the instructions.txt
 *
 * @author vijay.v@flipkart.com
 * @version 1.0
 * Copyright (c) Flipkart India Pvt. Ltd.
 */

import java.lang.Double;
import java.lang.Float;
import java.lang.String;
import java.util.HashMap;

public class ProductInfo {

    /**
     * Below fields list is not a comprehensive one.
     *
     */

    private String id;
    private String title;
    private String description;
    private Double mrp;
    private Double sellingPrice;
    private String productUrl;
    private boolean inStock;
    private String brand;
    private String imgS;
    private String imgL;
    private String categorySpec;
    private HashMap speckMap;
    public boolean isInStock() {
        return inStock;
    }

    public void setInStock(boolean inStock) {
        this.inStock = inStock;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProductUrl() {
        return productUrl;
    }

    public void setProductUrl(String productUrl) {
        this.productUrl = productUrl;
    }

    public Double getMrp() {
        return mrp;
    }

    public void setMrp(Double mrp) {
        this.mrp = mrp;
    }

    public Double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(Double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    /**
     * @return the brand
     */
    public String getBrand() {
        return brand;
    }

    /**
     * @param brand the brand to set
     */
    public void setBrand(String brand) {
        this.brand = brand;
    }

    /**
     * @return the categorySpec
     */
    public String getCategorySpec() {
        return categorySpec;
    }

    /**
     * @param categorySpec the categorySpec to set
     */
    public void setCategorySpec(String categorySpec) {
        this.categorySpec = categorySpec;
    }

    /**
     * @return the imgS
     */
    public String getImgS() {
        return imgS;
    }

    /**
     * @param imgS the imgS to set
     */
    public void setImgS(String imgS) {
        this.imgS = imgS;
    }

    /**
     * @return the imgL
     */
    public String getImgL() {
        return imgL;
    }

    /**
     * @param imgL the imgL to set
     */
    public void setImgL(String imgL) {
        this.imgL = imgL;
    }

    /**
     * @return the speckMap
     */
    public HashMap getSpeckMap() {
        return speckMap;
    }

    /**
     * @param speckMap the speckMap to set
     */
    public void setSpeckMap(HashMap speckMap) {
        this.speckMap = speckMap;
    }
}
