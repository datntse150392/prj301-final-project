/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ImgDAO;
import dal.ListProductDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Img;
import model.ListProduct;
import model.Product;

/**
 *
 * @author nguyenthanhdat
 */
public class list_product2 extends HttpServlet {

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
            out.println("<title>Servlet list_product2</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet list_product2 at " + request.getContextPath() + "</h1>");
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
        // get number_loadmore
        int number_loadmore;
        if (request.getParameter("number_loadmore") == null) {
            number_loadmore = 4;
            request.setAttribute("number_loadmore", number_loadmore);
        } else {
            number_loadmore = Integer.parseInt(request.getParameter("number_loadmore"));
            number_loadmore = number_loadmore + 3;
            request.setAttribute("number_loadmore", number_loadmore);
        }
        ProductDAO productDAO = new ProductDAO();
        ListProductDAO listproductDAO = new ListProductDAO();
        ImgDAO imgDAO = new ImgDAO();
        ArrayList<Product> list_product = productDAO.getListOfProductbyLoadMore(number_loadmore);
        ArrayList<ListProduct> listname_product = listproductDAO.getListNameOfProduct();
        ArrayList<Img> list_img = imgDAO.getListImg();

        request.setAttribute("list_product", list_product);
        request.setAttribute("listname_product", listname_product);
        request.setAttribute("list_img", list_img);

        request.getRequestDispatcher("list_product2.jsp").forward(request, response);
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
        processRequest(request, response);
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
