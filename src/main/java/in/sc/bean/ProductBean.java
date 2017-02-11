/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;

/**
 *
 * @author hp
 */
public class ProductBean {
    private int productId;
    private String uniqueId;
    private String retailerDataId;
    private String productName;
    private String brandUrl;
    private String bUrl;
    private String catUrl;
    private String pUrl;
    private String homeurl;
    private String uniqueName;
    private int categoryid;
    private int countryid;
    private String categoryName;
    private String inStock;
    private HashMap featureMap;
    private MetaBean mbean;
    private ReviewBean rbean;
    @Override
    public String toString() {
        return "ProductBean{" + "productId=" + productId + ", uniqueId=" + uniqueId + ", productName=" + productName + ", brandUrl=" + brandUrl + ", b_Url=" + bUrl + ", catUrl=" + catUrl + ", myurl=" + pUrl + ", homeurl=" + homeurl + ", uniqueName=" + uniqueName + ", categoryid=" + categoryid + ", retailerId=" + retailerId + ", imgLink=" + imgLink + ", priceDate=" + priceDate + ", newPrice=" + newPrice + ", oldPrice=" + oldPrice + ", brandId=" + brandId + ", brandName=" + brandName + ", imgPath=" + imgPath + '}';
    }

    
    private String retailerId;
    private String seller;
    private String imgLink;
    private Date priceDate;
    private int newPrice;
    private int oldPrice;
    private int brandId;
    private String brandName;
    private int sellerCount;
    private String retailer;
    private String retailerAdds;
    private String retailerLogo;
    private String sellerUrl;
    private String imgPath;
    private String pdesc;
    private String bUniqueName;
    private String cUniqueName;
    private String sCatName;
    private String CatDesc;
    private String brandCatDesc;
    private String brandDesc;
    private int brandrating;
    private String brandimg;
    private LinkedList simList;
    private String featureTable;
    private int featureId;
    private int featureSrcId;
    private HashMap gFeatureMap;
    private int specScore;
    private HashMap filterMap;
    private ArrayList pListDesc;

    /**
     * @return the productId
     */
    public int getProductId() {
        return productId;
    }

    /**
     * @param productId the productId to set
     */
    public void setProductId(int productId) {
        this.productId = productId;
    }

    /**
     * @return the uniqueId
     */
    public String getUniqueId() {
        return uniqueId;
    }

    /**
     * @param uniqueId the uniqueId to set
     */
    public void setUniqueId(String uniqueId) {
        this.uniqueId = uniqueId;
    }

    /**
     * @return the productName
     */
    public String getProductName() {
        return productName;
    }

    /**
     * @param productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return brandUrl;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.brandUrl = url;
    }

    /**
     * @return the retailerId
     */
    public String getRetailerId() {
        return retailerId;
    }

    /**
     * @param retailerId the retailerId to set
     */
    public void setRetailerId(String retailerId) {
        this.retailerId = retailerId;
    }

    /**
     * @return the seller
     */
    public String getSeller() {
        return seller;
    }

    /**
     * @param seller the seller to set
     */
    public void setSeller(String seller) {
        this.seller = seller;
    }

    /**
     * @return the imgLink
     */
    public String getImgLink() {
        return imgLink;
    }

    /**
     * @param imgLink the imgLink to set
     */
    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }

    /**
     * @return the priceDate
     */
    public Date getPriceDate() {
        return priceDate;
    }

    /**
     * @param priceDate the priceDate to set
     */
    public void setPriceDate(Date priceDate) {
        this.priceDate = priceDate;
    }

    /**
     * @return the newPrice
     */
    public int getNewPrice() {
        return newPrice;
    }

    /**
     * @param newPrice the newPrice to set
     */
    public void setNewPrice(int newPrice) {
        this.newPrice = newPrice;
    }

    /**
     * @return the oldPrice
     */
    public int getOldPrice() {
        return oldPrice;
    }

    /**
     * @param oldPrice the oldPrice to set
     */
    public void setOldPrice(int oldPrice) {
        this.oldPrice = oldPrice;
    }

    /**
     * @return the brandId
     */
    public int getBrandId() {
        return brandId;
    }

    /**
     * @param brandId the brandId to set
     */
    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    /**
     * @return the brandName
     */
    public String getBrandName() {
        return brandName;
    }

    /**
     * @param brandName the brandName to set
     */
    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    /**
     * @return the sellerCount
     */
    public int getSellerCount() {
        return sellerCount;
    }

    /**
     * @param sellerCount the sellerCount to set
     */
    public void setSellerCount(int sellerCount) {
        this.sellerCount = sellerCount;
    }

    /**
     * @return the retailer
     */
    public String getRetailer() {
        return retailer;
    }

    /**
     * @param retailer the retailer to set
     */
    public void setRetailer(String retailer) {
        this.retailer = retailer;
    }

    /**
     * @return the retailerAdds
     */
    public String getRetailerAdds() {
        return retailerAdds;
    }

    /**
     * @param retailerAdds the retailerAdds to set
     */
    public void setRetailerAdds(String retailerAdds) {
        this.retailerAdds = retailerAdds;
    }

    /**
     * @return the retailerLogo
     */
    public String getRetailerLogo() {
        return retailerLogo;
    }

    /**
     * @param retailerLogo the retailerLogo to set
     */
    public void setRetailerLogo(String retailerLogo) {
        this.retailerLogo = retailerLogo;
    }

    /**
     * @return the uniqueName
     */
    public String getUniqueName() {
        return uniqueName;
    }

    /**
     * @param uniqueName the uniqueName to set
     */
    public void setUniqueName(String uniqueName) {
        this.uniqueName = uniqueName;
    }

    /**
     * @return the sellerUrl
     */
    public String getSellerUrl() {
        return sellerUrl;
    }

    /**
     * @param sellerUrl the sellerUrl to set
     */
    public void setSellerUrl(String sellerUrl) {
        this.sellerUrl = sellerUrl;
    }

    /**
     * @return the categoryid
     */
    public int getCategoryid() {
        return categoryid;
    }

    /**
     * @param categoryid the categoryid to set
     */
    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    /**
     * @return the imgPath
     */
    public String getImgPath() {
        return imgPath;
    }

    /**
     * @param imgPath the imgPath to set
     */
    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    /**
     * @return the myurl
     */
    public String getpUrl() {
        return pUrl;
    }

    /**
     * @param myurl the myurl to set
     */
    public void setpUrl(String myurl) {
        this.pUrl = myurl;
    }

    /**
     * @return the catUrl
     */
    public String getCatUrl() {
        return catUrl;
    }

    /**
     * @param catUrl the catUrl to set
     */
    public void setCatUrl(String catUrl) {
        this.catUrl = catUrl;
    }

    /**
     * @return the homeurl
     */
    public String getHomeurl() {
        return homeurl;
    }

    /**
     * @param homeurl the homeurl to set
     */
    public void setHomeurl(String homeurl) {
        this.homeurl = homeurl;
    }

    /**
     * @return the b_Url
     */
    public String getbUrl() {
        return bUrl;
    }

    /**
     * @param bUrl the b_Url to set
     */
    public void setbUrl(String bUrl) {
        this.bUrl = bUrl;
    }

    /**
     * @return the categoryName
     */
    public String getCategoryName() {
        return categoryName;
    }

    /**
     * @param categoryName the categoryName to set
     */
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    /**
     * @return the featureMap
     */
    public HashMap getFeatureMap() {
        return featureMap;
    }

    /**
     * @param featureMap the featureMap to set
     */
    public void setFeatureMap(HashMap featureMap) {
        this.featureMap = featureMap;
    }

    /**
     * @return the mbean
     */
    public MetaBean getMbean() {
        return mbean;
    }

    /**
     * @param mbean the mbean to set
     */
    public void setMbean(MetaBean mbean) {
        this.mbean = mbean;
    }

    /**
     * @return the countryid
     */
    public int getCountryid() {
        return countryid;
    }

    /**
     * @param countryid the countryid to set
     */
    public void setCountryid(int countryid) {
        this.countryid = countryid;
    }

    /**
     * @return the pdesc
     */
    public String getPdesc() {
        return pdesc;
    }

    /**
     * @param pdesc the pdesc to set
     */
    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    /**
     * @return the bUniqueName
     */
    public String getbUniqueName() {
        return bUniqueName;
    }

    /**
     * @param bUniqueName the bUniqueName to set
     */
    public void setbUniqueName(String bUniqueName) {
        this.bUniqueName = bUniqueName;
    }

    /**
     * @return the sCatName
     */
    public String getsCatName() {
        return sCatName;
    }

    /**
     * @param sCatName the sCatName to set
     */
    public void setsCatName(String sCatName) {
        this.sCatName = sCatName;
    }

    /**
     * @return the cUniqueName
     */
    public String getcUniqueName() {
        return cUniqueName;
    }

    /**
     * @param cUniqueName the cUniqueName to set
     */
    public void setcUniqueName(String cUniqueName) {
        this.cUniqueName = cUniqueName;
    }

    /**
     * @return the CatDesc
     */
    public String getCatDesc() {
        return CatDesc;
    }

    /**
     * @param CatDesc the CatDesc to set
     */
    public void setCatDesc(String CatDesc) {
        this.CatDesc = CatDesc;
    }

    /**
     * @return the brandCatDesc
     */
    public String getBrandCatDesc() {
        return brandCatDesc;
    }

    /**
     * @param brandCatDesc the brandCatDesc to set
     */
    public void setBrandCatDesc(String brandCatDesc) {
        this.brandCatDesc = brandCatDesc;
    }

    /**
     * @return the rbean
     */
    public ReviewBean getRbean() {
        return rbean;
    }

    /**
     * @param rbean the rbean to set
     */
    public void setRbean(ReviewBean rbean) {
        this.rbean = rbean;
    }

    /**
     * @return the brandDesc
     */
    public String getBrandDesc() {
        return brandDesc;
    }

    /**
     * @param brandDesc the brandDesc to set
     */
    public void setBrandDesc(String brandDesc) {
        this.brandDesc = brandDesc;
    }

    /**
     * @return the brandrating
     */
    public int getBrandrating() {
        return brandrating;
    }

    /**
     * @param brandrating the brandrating to set
     */
    public void setBrandrating(int brandrating) {
        this.brandrating = brandrating;
    }

    /**
     * @return the brandimg
     */
    public String getBrandimg() {
        return brandimg;
    }

    /**
     * @param brandimg the brandimg to set
     */
    public void setBrandimg(String brandimg) {
        this.brandimg = brandimg;
    }

    /**
     * @return the retailerDataId
     */
    public String getRetailerDataId() {
        return retailerDataId;
    }

    /**
     * @param retailerDataId the retailerDataId to set
     */
    public void setRetailerDataId(String retailerDataId) {
        this.retailerDataId = retailerDataId;
    }

    /**
     * @return the inStock
     */
    public String getInStock() {
        return inStock;
    }

    /**
     * @param inStock the inStock to set
     */
    public void setInStock(String inStock) {
        this.inStock = inStock;
    }

    /**
     * @return the simList
     */
    public LinkedList getSimList() {
        return simList;
    }

    /**
     * @param simList the simList to set
     */
    public void setSimList(LinkedList simList) {
        this.simList = simList;
    }

    /**
     * @return the featureTable
     */
    public String getFeatureTable() {
        return featureTable;
    }

    /**
     * @param featureTable the featureTable to set
     */
    public void setFeatureTable(String featureTable) {
        this.featureTable = featureTable;
    }

    /**
     * @return the featureId
     */
    public int getFeatureId() {
        return featureId;
    }

    /**
     * @param featureId the featureId to set
     */
    public void setFeatureId(int featureId) {
        this.featureId = featureId;
    }

    /**
     * @return the featureSrcId
     */
    public int getFeatureSrcId() {
        return featureSrcId;
    }

    /**
     * @param featureSrcId the featureSrcId to set
     */
    public void setFeatureSrcId(int featureSrcId) {
        this.featureSrcId = featureSrcId;
    }

    /**
     * @return the gFeatureMap
     */
    public HashMap getgFeatureMap() {
        return gFeatureMap;
    }

    /**
     * @param gFeatureMap the gFeatureMap to set
     */
    public void setgFeatureMap(HashMap gFeatureMap) {
        this.gFeatureMap = gFeatureMap;
    }

    /**
     * @return the specScore
     */
    public int getSpecScore() {
        return specScore;
    }

    /**
     * @param specScore the specScore to set
     */
    public void setSpecScore(int specScore) {
        this.specScore = specScore;
    }

    /**
     * @return the filterMap
     */
    public HashMap getFilterMap() {
        return filterMap;
    }

    /**
     * @param filterMap the filterMap to set
     */
    public void setFilterMap(HashMap filterMap) {
        this.filterMap = filterMap;
    }

    /**
     * @return the pListDesc
     */
    public ArrayList getpListDesc() {
        return pListDesc;
    }

    /**
     * @param pListDesc the pListDesc to set
     */
    public void setpListDesc(ArrayList pListDesc) {
        this.pListDesc = pListDesc;
    }
    
}
