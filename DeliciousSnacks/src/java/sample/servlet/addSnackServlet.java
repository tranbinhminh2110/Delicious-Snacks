/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.dao.CategoriesDAO;
import sample.dao.SnackDAO;

/**
 *
 * @author TRI
 */
public class addSnackServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String name = request.getParameter("txtname");
            int price = Integer.parseInt(request.getParameter("txtprice"));
            String imgpath = request.getParameter("txtimage");
            String description = request.getParameter("txtdescription:");
            int status = Integer.parseInt(request.getParameter("txtstatus"));
            String cateName = request.getParameter("txtcateName");
            String thongbao = "Add Snack successfully!!";
            String thongbao2 = "Add Snack Error!!";
                boolean check = SnackDAO.insertSnack(name, price, imgpath, description, status, CategoriesDAO.getCateIDByName(cateName));
                if (check) {
                    request.setAttribute("report", thongbao);
                    request.getRequestDispatcher("AddSnack.jsp").forward(request, response);
                } else {
                    request.setAttribute("report", thongbao2);
                    request.getRequestDispatcher("AddSnack.jsp").forward(request, response);
                }
            

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
