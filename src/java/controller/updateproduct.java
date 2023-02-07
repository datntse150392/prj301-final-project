/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ListProductDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.ListProduct;
import model.Product;

/**
 *
 * @author nguyenthanhdat
 */
public class updateproduct extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateproduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateproduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        // Get Product by pid_ipdate
        int pid_update = Integer.parseInt(request.getParameter("pid_update"));
        Product p = new Product();
        ProductDAO productDAO = new ProductDAO();
        p = productDAO.getProductbyPid(pid_update);

        // Get all List name of Product
        ListProductDAO listProductDAO = new ListProductDAO();
        ArrayList<ListProduct> listproduct = listProductDAO.getListNameOfProduct();
        request.setAttribute("listproduct", listproduct);
        request.setAttribute("product", p);
        request.getRequestDispatcher("updateproduct.jsp").forward(request, response);
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
        // L?y thông tin t? updateproduct.jsp d? update thông tin s?n ph?m l?i
        int update_pid = Integer.parseInt(request.getParameter("update_pid"));
        String update_name = request.getParameter("update_name");
        float update_price = Float.parseFloat(request.getParameter("update_price"));
        int update_lid = Integer.parseInt(request.getParameter("update_lid"));

        ProductDAO productDAO = new ProductDAO();
        productDAO.updatebyProductID(update_name, update_price, update_lid, update_pid);
        response.sendRedirect("allproduct");
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
