/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguyenthanhdat
 */
public class Purchase_history {
    private int purchase_history_id;
    private String name;
    private int count;
    private float price;
    private String address_link;
    private int userid;
    private int pid;

    public Purchase_history() {
    }

    public Purchase_history(int purchase_history_id, String name, int count, float price, String address_link, int userid, int pid) {
        this.purchase_history_id = purchase_history_id;
        this.name = name;
        this.count = count;
        this.price = price;
        this.address_link = address_link;
        this.userid = userid;
        this.pid = pid;
    }

    public Purchase_history(String name, int count, float price, String address_link, int userid, int pid) {
        this.name = name;
        this.count = count;
        this.price = price;
        this.address_link = address_link;
        this.userid = userid;
        this.pid = pid;
    }
    
    

    public int getPurchase_history_id() {
        return purchase_history_id;
    }

    public void setPurchase_history_id(int purchase_history_id) {
        this.purchase_history_id = purchase_history_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getAddress_link() {
        return address_link;
    }

    public void setAddress_link(String address_link) {
        this.address_link = address_link;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
    
    
}
