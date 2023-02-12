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
import java.util.List;
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
@WebServlet(name = "Display_AllProduct", urlPatterns = {"/allproduct"})
public class Display_AllProduct extends HttpServlet {

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
        // get index_page
        String index_page = request.getParameter("index_page");
        // check nếu index_page == null tức là trang sẽ chạy vào 1 đầu tiên
        if (index_page == null) {
            index_page = "1";
        }
        // chuyển type String vè int
        int index = Integer.parseInt(index_page);

        // Đếm số lượng tất cả sản phẩm trong cửa hàng và với mỗi trang sẽ có nhiều nhất 6 sản phẩm
        ProductDAO productDAO = new ProductDAO();
        int count_product = productDAO.get_number_total_product();
        int endPage = count_product / 6;
        if (endPage % 6 != 0) {
            endPage++;  // tức là nếu 67/6 sẽ ra 11 trang và dư 1 sản phẩm -> ta cộng trang page lên 1 thành 12 và trang 12 sẽ chứa 1 sản phẩm
        }

        // lấy giá trị sắp xếp và kiểm tra 
        List<Product> list = productDAO.getListOfProductbyIndex(index);
        String sort_option = request.getParameter("sort_option");
        if(sort_option == null) {
            list = productDAO.getListOfProductbyIndex(index);
        }
        else if (sort_option.equalsIgnoreCase("price_down")) {
            list = productDAO.getProduct_by_cost_down(index);
            request.setAttribute("sort_option", sort_option);
        } else if (sort_option.equalsIgnoreCase("price_up")) {
            list = productDAO.getProduct_by_cost_up(index);
            request.setAttribute("sort_option", sort_option);
        }

        // Lấy danh mục sản phẩm
        ListProductDAO listproductDAO = new ListProductDAO();
        ArrayList<ListProduct> listname_product = listproductDAO.getListNameOfProduct();
        // Lấy danh sách hình ảnh của từng sản phẩm
        ImgDAO imgDAO = new ImgDAO();
        ArrayList<Img> list_img = imgDAO.getListImg();

        // set dữ liệu 
        request.setAttribute("list_product", list);
        request.setAttribute("listname_product", listname_product);
        request.setAttribute("list_img", list_img);
        request.setAttribute(("endPage"), endPage);
        // gửi dữ liệu về trang jsp
        request.getRequestDispatcher("product_test.jsp").forward(request, response);
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
