/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Objects;

/**
 *
 * @author Asus
 */
public class Emp {

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + this.id;
        hash = 79 * hash + Objects.hashCode(this.name);
        hash = 79 * hash + this.sal;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Emp other = (Emp) obj;
        if (this.id != other.id) {
            return false;
        }
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        if (this.sal != other.sal) {
            return false;
        }
        return true;
    }
    
    private int id;
    private String name;
    private int sal;
    private String loc;
    private String address;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the sal
     */
    public int getSal() {
        return sal;
    }

    /**
     * @param sal the sal to set
     */
    public void setSal(int sal) {
        this.sal = sal;
    }

    /**
     * @return the loc
     */
    public String getLoc() {
        return loc;
    }

    /**
     * @param loc the loc to set
     */
    public void setLoc(String loc) {
        this.loc = loc;
    }

    public Emp(int id, String name, int sal, String loc, String address) {
        this.id = id;
        this.name = name;
        this.sal = sal;
        this.loc = loc;
        this.address = address;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    @Override
    public String toString() {
        return "Emp{" + "id=" + id + ", name=" + name + ", sal=" + sal + ", loc=" + loc + ", address=" + address + '}';
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }
    
    public static void main(String[] args) {
        Emp e=new Emp(1,"a",1000,"pune","sun");
        Emp e1=new Emp(1,"a",2000,"mum","chem");
        HashSet s=new HashSet();
        s.add(e);s.add(e1);
        ArrayList aarr=new ArrayList();
        for(int i=0;i<aarr.size();i++)
        {
        }
        
        for (Object s1 : s) {
            System.out.println(s1);
        }
    }
}