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
import model.Product;

/**
 *
 * @author nguyenthanhdat
 */
public class ProductDAO extends DBContext {

    // Khắc phục lại cart
    public ArrayList<Product> getListOfProduct() {
        try {
            String sql = "SELECT * FROM product";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("name"));
                p.setPrice(rs.getFloat("price"));
                p.setCount(rs.getInt("count"));
                p.setImgid(rs.getInt("imgid"));
                p.setLid(rs.getInt("lid"));

                list.add(p);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ListProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // get number total product
    public int get_number_total_product() {
        try {
            String sql = "SELECT * FROM product";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<Product> list = new ArrayList<>();
            int count = 0;
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("name"));
                p.setPrice(rs.getFloat("price"));
                p.setCount(rs.getInt("count"));
                p.setImgid(rs.getInt("imgid"));
                p.setLid(rs.getInt("lid"));

                list.add(p);
            }
            return count = list.size();
        } catch (SQLException ex) {
            Logger.getLogger(ListProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    // Lấy sản phẩm có giá giảm dần
    public ArrayList<Product> getProduct_by_cost_down(int index) {
        try {
            String sql = "SELECT * FROM product ORDER BY product.price DESC limit 6 offset ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();

            ArrayList<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("name"));
                p.setPrice(rs.getFloat("price"));
                p.setCount(rs.getInt("count"));
                p.setImgid(rs.getInt("imgid"));
                p.setLid(rs.getInt("lid"));

                list.add(p);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ListProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Lấy sản phẩm có giá tăng dần
    public ArrayList<Product> getProduct_by_cost_up(int index) {
        try {
            String sql = "SELECT * FROM `product` ORDER BY product.price ASC limit 6 offset ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();

            ArrayList<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("name"));
                p.setPrice(rs.getFloat("price"));
                p.setCount(rs.getInt("count"));
                p.setImgid(rs.getInt("imgid"));
                p.setLid(rs.getInt("lid"));

                list.add(p);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ListProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Get all List of Product
    public ArrayList<Product> getListOfProductbyIndex(int index) {
        try {
            String sql = "SELECT * FROM product limit 6 offset ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();

            ArrayList<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("name"));
                p.setPrice(rs.getFloat("price"));
                p.setCount(rs.getInt("count"));
                p.setImgid(rs.getInt("imgid"));
                p.setLid(rs.getInt("lid"));

                list.add(p);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ListProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Get Product by pid
    public Product getProductbyPid(int pid) {
        try {
            String sql = "SELECT * FROM product WHERE pid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();

            Product p = new Product();
            while (rs.next()) {
                p.setPid(pid);
                p.setPname(rs.getString("name"));
                p.setPrice(rs.getFloat("price"));
                p.setCount(rs.getInt("count"));
                p.setImgid(rs.getInt("imgid"));
                p.setLid(rs.getInt("lid"));

                return p;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Add Product
    public void addProduct(String pname, float price, int count, int lid) {
        try {
            String sql = "INSERT INTO product (name, price, count ,lid) VALUES (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pname);
            ps.setFloat(2, price);
            ps.setInt(3, count);
            ps.setInt(4, lid);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // delete Product by id
    public void deleteProductbyID(int pid) {
        try {
            String sql = "DELETE from product where pid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // Update Product by id
    public void updatebyProductID(String name, float price, int lid, int pid) {
        try {
            String sql = "UPDATE product SET name = ?, price = ?, lid = ? where pid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setFloat(2, price);
            ps.setInt(3, lid);
            ps.setInt(4, pid);

            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // Update count Product by id
    public void update_productcount(int update_count, int pid) {
        try {
            String sql = "UPDATE product SET count = count + ? where pid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, update_count);
            ps.setInt(2, pid);
            ps.execute();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Update count Product when user buy some Product
    public void update_productcountfromCart(int update_count, int pid) {
        try {
            String sql = "UPDATE product SET count =  ? where pid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, update_count);
            ps.setInt(2, pid);
            ps.execute();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        int count = p.get_number_total_product();
        System.out.println(count);
    }

}
