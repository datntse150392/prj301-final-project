/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguyenthanhdat
 */
public class Product {
    private int pid;
    private String pname;
    private float price;
    private int count;
    private int lid;
    private int imgid;

    public Product() {
    }

    public Product(String pname, float price, int count ,int lid) {
        this.pname = pname;
        this.price = price;
        this.count = count;
        this.lid = lid;
    }

    public Product(int pid, String pname, float price, int count, int lid) {
        this.pid = pid;
        this.pname = pname;
        this.price = price;
        this.count = count;
        this.lid = lid;
    }

    public Product(String pname, float price, int count, int lid, int imgid) {
        this.pname = pname;
        this.price = price;
        this.count = count;
        this.lid = lid;
        this.imgid = imgid;
    }

    public int getImgid() {
        return imgid;
    }

    public void setImgid(int imgid) {
        this.imgid = imgid;
    }
    
    

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }
  
}
