/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguyenthanhdat
 */
public class Admin_Account {
    private int adminid;
    private String username;
    private String password;
    private String displayname;
    private String address;

    public Admin_Account() {
    }

    public Admin_Account(int adminid, String username, String password, String displayname) {
        this.adminid = adminid;
        this.username = username;
        this.password = password;
        this.displayname = displayname;
    }

    public Admin_Account(int adminid, String username, String password, String displayname, String address) {
        this.adminid = adminid;
        this.username = username;
        this.password = password;
        this.displayname = displayname;
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public int getAdminid() {
        return adminid;
    }

    public void setAdminid(int adminid) {
        this.adminid = adminid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname;
    }
    

    
}
