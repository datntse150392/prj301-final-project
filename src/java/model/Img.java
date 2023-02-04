/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguyenthanhdat
 */
public class Img {
    private int imgid;
    private String address_link;
    private String name;

    public Img() {
    }

    public Img(int imgid, String address_link, String name) {
        this.imgid = imgid;
        this.address_link = address_link;
        this.name = name;
    }

    public int getImgid() {
        return imgid;
    }

    public void setImgid(int imgid) {
        this.imgid = imgid;
    }

    public String getAddress_link() {
        return address_link;
    }

    public void setAddress_link(String address_link) {
        this.address_link = address_link;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
