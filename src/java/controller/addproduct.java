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
public class addproduct extends HttpServlet {

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
            out.println("<title>Servlet addproduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addproduct at " + request.getContextPath() + "</h1>");
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
        ListProductDAO listProductDAO = new ListProductDAO();
        ArrayList<ListProduct> listproduct = listProductDAO.getListNameOfProduct();
        request.setAttribute("listproduct", listproduct);
        request.getRequestDispatcher("addproduct.jsp").forward(request, response);
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
            request.setAttribute("msg", "T??n qu?? d??i ho???c gi?? nh??? h??n 0, m???i b???n nh???p l???i!");
        } else {
            ProductDAO productDAO = new ProductDAO();;
            productDAO.addProduct(add_name, add_price, add_count, add_lid);
            request.setAttribute("listproduct", listproduct);
            request.setAttribute("msg", "???? th??m s???n ph???m th??nh c??ng");
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
