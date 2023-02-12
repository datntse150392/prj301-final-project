/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AddressDAO;
import dal.User_AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Address;
import model.User_Account;

/**
 *
 * @author nguyenthanhdat
 */
public class register extends HttpServlet {

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
            out.println("<title>Servlet register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet register at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        // Get all address sau do day ve trang register.jsp
        ArrayList<Address> list_address = new ArrayList<>();
        AddressDAO aDAO = new AddressDAO();
        list_address = aDAO.getAlladdress();
        request.setAttribute("list_address", list_address);
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        // Get cac parameter tu trang jsp
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");
        String displayname = (String)request.getParameter("displayname");
        int address_id = Integer.parseInt(request.getParameter("address_id"));

        ArrayList<User_Account> list_user_account = new ArrayList<>();
        User_AccountDAO user_AccountDAO = new User_AccountDAO();
        list_user_account = user_AccountDAO.getAllUser_Account();
        // Check xem account da ton tai chua
        boolean flag = true;
        for (int i = 0; i < list_user_account.size(); i++) {
            if (list_user_account.get(i).getUsername().equalsIgnoreCase(username)) {
                flag = false;
                break;
            }
        }

        if (flag == true) {
            if (re_password.equalsIgnoreCase(password)) {
                User_AccountDAO user_accountDAO = new User_AccountDAO();
                user_accountDAO.registerAccount(username, password, displayname, address_id);

                // lay dia chi de day ve jsp
                ArrayList<Address> list_address = new ArrayList<>();
                AddressDAO aDAO = new AddressDAO();
                list_address = aDAO.getAlladdress();
                request.setAttribute("list_address", list_address);
                request.setAttribute("msg", "Bạn đã đăng kí tài khoản thành công");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                // lay dia chi de day ve jsp
                ArrayList<Address> list_address = new ArrayList<>();
                AddressDAO aDAO = new AddressDAO();
                list_address = aDAO.getAlladdress();
                request.setAttribute("list_address", list_address);
                request.setAttribute("msg", "Mật khẩu không khớp, mời bạn nhập lại");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }

        if (flag == false) {
            // lay dia chi de day ve jsp
            ArrayList<Address> list_address = new ArrayList<>();
            AddressDAO aDAO = new AddressDAO();
            list_address = aDAO.getAlladdress();
            request.setAttribute("list_address", list_address);
            request.setAttribute("msg", "Tên tài khoản đã tồn tại");
            request.getRequestDispatcher("register.jsp").forward(request, response);
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
