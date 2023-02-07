/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ImgDAO;
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
import model.Img;
import model.ListProduct;
import model.Product;

/**
 *
 * @author nguyenthanhdat
 */
@WebServlet(name = "Display_ListProduct2", urlPatterns = {"/list_product3"})
public class Display_ListProduct2 extends HttpServlet {

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
