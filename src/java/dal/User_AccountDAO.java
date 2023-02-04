/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin_Account;
import model.Product;
import model.User_Account;

/**
 *
 * @author nguyenthanhdat
 */
public class User_AccountDAO extends DBContext{ 
    // Get User_Account by username_password
    public User_Account getUser_AccountByUsername_Password(String username, String password) {
        try {
            String sql = "SELECT * FROM user_account where username = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User_Account user_account = new User_Account(rs.getInt("userid"), rs.getString("username"), rs.getString("password"), rs.getString("displayname"));
                return user_account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Admin_AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    } 
    
    // Get User_Account by User_ID
    public User_Account getAccount_AddressByUserID(int userid) {
        try {
            String sql = "SELECT * FROM user_account, address WHERE user_account.address_id = address.address_id AND user_account.userid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User_Account account = new User_Account(rs.getInt("userid"), rs.getString("username"), rs.getString("password"), rs.getString("displayname"), rs.getString("address"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Admin_AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    // Get All user_account
    public ArrayList<User_Account> getAllUser_Account() {
        try {
            String sql = "SELECT * FROM user_account";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<User_Account> list = new ArrayList<>();
            while (rs.next()) {
                User_Account a = new User_Account();
                a.setUserid(rs.getInt("userid"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setDisplayname(rs.getString("displayname"));              
                list.add(a);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ListProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    // Register
    public void registerAccount(String username, String password, String displayname, int address_id) {
        try {
            String sql = "INSERT INTO user_account (username, password, displayname, address_id) VALUES (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, displayname);
            ps.setInt(4, address_id);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
