/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguyenthanhdat
 */
public class User_Account {
    private int userid;
    private String username;
    private String password;
    private String displayname;
    private String address;

    public User_Account() {
    }

    public User_Account(int userid, String username, String password, String displayname) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.displayname = displayname;
    }

    public User_Account(int userid, String username, String password, String displayname, String address) {
        this.userid = userid;
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

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
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
