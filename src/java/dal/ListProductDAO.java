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
import model.ListProduct;

/**
 *
 * @author nguyenthanhdat
 */
public class ListProductDAO extends DBContext {
    // Get all List of Name Product
    public ArrayList<ListProduct> getListNameOfProduct() {
        try {
            String sql = "SELECT * FROM listproduct";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            ArrayList<ListProduct> list = new  ArrayList<>();
            while(rs.next()) {
                ListProduct lprodcut = new ListProduct();
                lprodcut.setLid(rs.getInt("lid"));
                lprodcut.setLname(rs.getString("name"));
                
                list.add(lprodcut);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ListProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;      
    }
    
    // Get namelistproduct by id
    public ListProduct getNameListOfProduct(int lid) {
        try {
            String sql = "SELECT * FROM listproduct WHERE lid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lid);
            ResultSet rs = ps.executeQuery();
            
            ListProduct lprodcut = new ListProduct();         
            while(rs.next()) {
                lprodcut.setLid(rs.getInt("lid"));
                lprodcut.setLname(rs.getString("name"));
            }
            return lprodcut;
        } catch (SQLException ex) {
            Logger.getLogger(ListProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;      
    }
}
