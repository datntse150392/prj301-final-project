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
import model.Img;

/**
 *
 * @author nguyenthanhdat
 */
public class ImgDAO extends DBContext{
    // Get list img
    public ArrayList<Img> getListImg() {
        try {
            String sql = "SELECT * from img";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            ArrayList<Img> list = new ArrayList<>();
            while(rs.next()) {
                Img img = new Img();
                img.setImgid(rs.getInt("imgid"));
                img.setAddress_link(rs.getString("address_link"));
                img.setName(rs.getString("name"));
                
                list.add(img);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ImgDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
