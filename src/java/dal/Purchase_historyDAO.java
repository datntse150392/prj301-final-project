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
import model.Purchase_history;


/**
 *
 * @author nguyenthanhdat
 */
public class Purchase_historyDAO extends DBContext {
    
    // Add pruchase to the list Purchase_historyDAO
    public void addPurchase(Purchase_history p) {
        try {           
            String sql = "INSERT INTO purchase_history (name, count, price ,address_link, userid, pid) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setInt(2, p.getCount());
            ps.setFloat(3, p.getPrice());
            ps.setString(4, p.getAddress_link());
            ps.setInt(5, p.getUserid());
            ps.setInt(6, p.getPid());
                    
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // Get list puchase by userid
    public ArrayList<Purchase_history> getAllPurchase_historybyUserID(int userid) {
        try {
            String sql = "SELECT * FROM purchase_history where userid = ? ORDER BY purchase_history_id DESC LIMIT 2";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userid);
            ArrayList<Purchase_history> list = new ArrayList<>();
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Purchase_history p = new Purchase_history();
                p.setPurchase_history_id(rs.getInt("purchase_history_id"));
                p.setName(rs.getString("name"));
                p.setCount(rs.getInt("count"));
                p.setPrice(rs.getFloat("price"));
                p.setAddress_link(rs.getString("address_link"));
                p.setUserid(rs.getInt("userid"));
                p.setPid(rs.getInt("pid"));
                
                list.add(p);
            }
            
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Purchase_historyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
