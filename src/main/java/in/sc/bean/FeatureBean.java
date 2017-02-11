/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.bean;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.logging.Logger;

/**
 *
 * @author PRASAD
 */
public class FeatureBean implements Comparable<FeatureBean> {

    @Override
    public String toString() {
        return "FeatureBean{" + "featureGroup=" + featureGroup + ", featureName=" + featureName + '}';
    }

    private String featureGroup;
    private String featureName;
    private String glyphicons;
    private int featureId;
    private String featureTable;
    private ArrayList filterVals;
    private int productId;

    /**
     * @return the featureGroup
     */
    public String getFeatureGroup() {
        return featureGroup;
    }

    /**
     * @param featureGroup the featureGroup to set
     */
    public void setFeatureGroup(String featureGroup) {
        this.featureGroup = featureGroup;
    }

    /**
     * @return the featureName
     */
    public String getFeatureName() {
        return featureName;
    }

    /**
     * @param featureName the featureName to set
     */
    public void setFeatureName(String featureName) {
        this.featureName = featureName;
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

    @Override
    public int compareTo(FeatureBean o) {
        if (this.featureId > o.featureId) {
            return 1;
        } else {
            return 0;
        }
    }

    /**
     * @return the filterVals
     */
    public ArrayList getFilterVals() {
        return filterVals;
    }

    /**
     * @param filterVals the filterVals to set
     */
    public void setFilterVals(ArrayList filterVals) {
        this.filterVals = filterVals;
    }

    /**
     * @return the glyphicons
     */
    public String getGlyphicons() {
        return glyphicons;
    }

    /**
     * @param glyphicons the glyphicons to set
     */
    public void setGlyphicons(String glyphicons) {
        this.glyphicons = glyphicons;
    }

}
