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
import model.Address;

/**
 *
 * @author nguyenthanhdat
 */
public class AddressDAO extends DBContext{
    // Get all address
    public ArrayList<Address> getAlladdress() {
        try {
            String sql = "SELECT * FROM address";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<Address> list = new ArrayList<>();
            while (rs.next()) {
                Address a = new Address();
                a.setAddress_id(rs.getInt("address_id"));
                a.setAddress(rs.getString("address"));
                list.add(a);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ListProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
