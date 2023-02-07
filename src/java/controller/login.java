/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.Admin_AccountDAO;
import dal.User_AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

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
        
        // Get username va password tu cookie
        // Vi cookie la mot mang nên chúng ta se lay ra tung cai roi so sanh
        Cookie arrcookie[] = request.getCookies();
        for (Cookie o : arrcookie) {
            if(o.getName().equals("username")) {
                request.setAttribute("username", o.getValue());
            }
            if(o.getName().equals("password")) {
                request.setAttribute("password", o.getValue());
            }         
        }
        // Set username va password toi trang login.jsp
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Admin_AccountDAO accountDAO = new Admin_AccountDAO();
        User_AccountDAO user_accountDAO = new User_AccountDAO();

        Admin_Account admin_account = new Admin_Account();
        User_Account user_account = new User_Account();

        admin_account = accountDAO.getAccountByUsername_Password(username, password);
        user_account = user_accountDAO.getUser_AccountByUsername_Password(username, password);
        if (admin_account != null) {
            session.setAttribute("admin", admin_account);
            // Luu username và password vào cookie
            Cookie u = new Cookie("username", username);
            Cookie p = new Cookie("password", password);

            // Set thoi gian luu tren cookie
            u.setMaxAge(60);
            p.setMaxAge(60);

            // Luu p va u lên trên trình duyet
            response.addCookie(u);
            response.addCookie(p);

            // chuyen huong ve trang chu
            response.sendRedirect("homepage");
        } else if (user_account != null) {
            session.setAttribute("user_account", user_account);
            // Luu username và password vào cookie
            Cookie u = new Cookie("username", username);
            Cookie p = new Cookie("password", password);

            // Set thoi gian luu tren cookie
            u.setMaxAge(60);
            p.setMaxAge(60);

            // Luu p va u lên trên trình duyet
            response.addCookie(u);
            response.addCookie(p);

            // chuyen huong ve trang chu
            response.sendRedirect("homepage");
        } else {
            request.setAttribute("msg", "Username or Password is incorret!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
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
