/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.Admin_AccountDAO;
import dal.User_AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin_Account;
import model.User_Account;

/**
 *
 * @author nguyenthanhdat
 */
@WebServlet(name = "account_setting", urlPatterns = {"/account_setting"})
public class account_setting extends HttpServlet {

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
            out.println("<title>Servlet account_setting</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet account_setting at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        // Lay account hien tai tu seesion ( admin account or user account )
        Admin_Account admin_account = (Admin_Account) session.getAttribute("admin");
        Admin_AccountDAO admin_accountDAO = new Admin_AccountDAO();

        User_Account user_account = (User_Account) session.getAttribute("user_account");
        User_AccountDAO user_accountDAO = new User_AccountDAO();
 
        // check xem account co ton tai chua
        if (admin_account != null) {
            admin_account = admin_accountDAO.getAccount_AddressByAdminID(admin_account.getAdminid());
            request.setAttribute("admin_account", admin_account);
            request.getRequestDispatcher("account_setting.jsp").forward(request, response);
        } 
        if (user_account != null) {       
            user_account = user_accountDAO.getAccount_AddressByUserID(user_account.getUserid());
            request.setAttribute("user_account", user_account);
            request.getRequestDispatcher("account_setting.jsp").forward(request, response);
        }
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
