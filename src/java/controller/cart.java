/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAO;
import dal.Purchase_historyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.Purchase_history;

/**
 *
 * @author nguyenthanhdat
 */
@WebServlet(name = "Cart", urlPatterns = {"/cart"})
public class Cart extends HttpServlet {

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
        HttpSession session = request.getSession();
        ArrayList<Purchase_history> list_purchase_history = new ArrayList<>();

        String name = request.getParameter("name");
        int count = Integer.parseInt(request.getParameter("count"));
        float price = Float.parseFloat(request.getParameter("price"));
        String address_link = request.getParameter("address_link");
        int userid = Integer.parseInt(request.getParameter("userid"));
        int pid = Integer.parseInt(request.getParameter("pid"));
        Purchase_history purchase_history = new Purchase_history(name, count, price, address_link, userid, pid);

        // Khai báo biến total_price cho phần tính tổng đơn hàng, nếu có sẽ set total_price thông qua session đã lưu vào
        // Còn nếu chưa có đơn hàng nào thì tự động khai báo = 0 và tiếp tục thực hiện chức năng + total_price
        float total_price = 0;
        if(session.getAttribute("total_price") != null) {
            total_price = (float) session.getAttribute("total_price");
        }
        // Check so luong ma khach hang them vao
        int type_page = Integer.parseInt(request.getParameter("type_page"));
        if (count <= 0) {
            request.setAttribute("msg", "Số lượng không được nhỏ hơn 0, mời bạn thêm lại số lượng");
            if (type_page == 1) {
                request.getRequestDispatcher("allproduct").forward(request, response);
            } else if (type_page == 2) {
                request.getRequestDispatcher("list_product1").forward(request, response);

            } else if (type_page == 3) {
                request.getRequestDispatcher("list_product2").forward(request, response);
            }
        }

        if (session.getAttribute("list_purchase_history") != null) {
            list_purchase_history = (ArrayList<Purchase_history>) session.getAttribute("list_purchase_history");

            // Neu ma trong gio hang da co san pham thi chung ta chi them so luong vao la duoc
            // gan 1 bien boolean de check xem co trung pid hay chua, neu trung thi set count bang so luong hien tai + so luong moi
            boolean flag = false;
            for (int i = 0; i < list_purchase_history.size(); i++) {
                if (list_purchase_history.get(i).getPid() == pid) {
                    int new_count = list_purchase_history.get(i).getCount() + count;
                    list_purchase_history.get(i).setCount(new_count);
                    total_price = total_price + list_purchase_history.get(i).getPrice();
                    flag = true;
                    break;
                }
            }
            // neu bien flag == false tuc la khong tim ra pid trung trong danh sach
            // thi chi can add them san pham can mua vao gio hang
            if (flag == false) {
                list_purchase_history.add(purchase_history);
                total_price = total_price + purchase_history.getPrice();
            }
        } else {
            list_purchase_history.add(purchase_history);
            total_price = total_price + purchase_history.getPrice();
        }

        session.setAttribute("list_purchase_history", list_purchase_history);
        request.setAttribute("msg", "Bạn vừa thêm sản phẩm thành công!");
        session.setAttribute("total_price", total_price);
        
        if (type_page == 1) {
            request.getRequestDispatcher("allproduct").forward(request, response);
        } else if (type_page == 2) {
            request.getRequestDispatcher("list_product1").forward(request, response);

        } else if (type_page == 3) {
            request.getRequestDispatcher("list_product2").forward(request, response);
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
        ArrayList<Purchase_history> list_purchase_history = (ArrayList<Purchase_history>) session.getAttribute("list_purchase_history");
        Purchase_historyDAO purchase_historyDAO = new Purchase_historyDAO();

        // Lay list Product de kiem tra xem so luong san pham trong gio hang co <= so luong san pham hien co khong
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> list_product = productDAO.getListOfProduct();
        boolean flag = true;
        for (int i = 0; i < list_purchase_history.size(); i++) {
            for (int j = 0; j < list_product.size(); j++) {
                if (list_purchase_history.get(i).getPid() == list_product.get(j).getPid()) {
                    if (list_purchase_history.get(i).getCount() > list_product.get(j).getCount()) {
                        flag = false;
                    }
                }
            }
        }
        // Check lai flag
        if (flag == true) {
            for (int i = 0; i < list_purchase_history.size(); i++) {
                purchase_historyDAO.addPurchase(list_purchase_history.get(i));
            }
            // Kiem tra neu thanh cong tru phai tru so luong trong kho hien tai
            for (int i = 0; i < list_purchase_history.size(); i++) {
                for (int j = 0; j < list_product.size(); j++) {
                    if (list_purchase_history.get(i).getPid() == list_product.get(j).getPid()) {
                        int new_count = list_product.get(j).getCount() - list_purchase_history.get(i).getCount();
                        productDAO.update_productcountfromCart(new_count, list_product.get(j).getPid());
                    }
                }
            }
            session.removeAttribute("list_purchase_history");
            session.removeAttribute("total_price");
            request.setAttribute("msg_purchase", "Bạn vừa thanh toán xong đơn hàng");
        } else {
            request.setAttribute("msg_purchase", "Đơn hàng có sản phẩm vượt quá số lượng hiện tại, mời bạn kiểm tra lại!");
        }

        request.getRequestDispatcher("cart.jsp").forward(request, response);

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
