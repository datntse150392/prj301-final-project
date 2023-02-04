/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin_Account;

/**
 *
 * @author nguyenthanhdat
 */
public class Admin_AccountDAO extends DBContext {
    // Get Admin_Account by AdminID
    public Admin_Account getAccountByUsername_Password(String username, String password) {
        try {
            String sql = "SELECT * FROM admin_account where username = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Admin_Account account = new Admin_Account(rs.getInt("adminid"), rs.getString("username"), rs.getString("password"), rs.getString("displayname"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Admin_AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    // Get Admin_Account & Address by AdminID
    public Admin_Account getAccount_AddressByAdminID(int adminid) {
        try {
            String sql = "SELECT * FROM admin_account, address WHERE admin_account.address_id = address.address_id AND admin_account.adminid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, adminid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Admin_Account account = new Admin_Account(rs.getInt("adminid"), rs.getString("username"), rs.getString("password"), rs.getString("displayname"), rs.getString("address"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Admin_AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
