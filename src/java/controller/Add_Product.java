/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ListProductDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ListProduct;

/**
 *
 * @author nguyenthanhdat
 */
@WebServlet(name = "Add_Product", urlPatterns = {"/addproduct"})
public class Add_Product extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ListProductDAO listProductDAO = new ListProductDAO();
        ArrayList<ListProduct> listproduct = listProductDAO.getListNameOfProduct();
        request.setAttribute("listproduct", listproduct);
        request.getRequestDispatcher("addproduct.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         ListProductDAO listProductDAO = new ListProductDAO();
        ArrayList<ListProduct> listproduct = listProductDAO.getListNameOfProduct();
        request.setAttribute("listproduct", listproduct);

        String add_name = request.getParameter("add_name");
        float add_price = Float.parseFloat(request.getParameter("add_price"));
        int add_count = Integer.parseInt(request.getParameter("add_count"));
        int add_lid = Integer.parseInt(request.getParameter("add_lid"));

        if (add_name.length() > 100 || add_price <= 0) {
            request.setAttribute("msg", "Tên quá dài hoặc giá nhỏ hơn 0, mời bạn nhập lại!");
        } else {
            ProductDAO productDAO = new ProductDAO();;
            productDAO.addProduct(add_name, add_price, add_count, add_lid);
            request.setAttribute("listproduct", listproduct);
            request.setAttribute("msg", "Đã thêm sản phẩm thành công");
        }

        request.getRequestDispatcher("addproduct.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
