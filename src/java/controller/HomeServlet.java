/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CompanyDAO;
import DAO.JobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Company;
import model.Job;

/**
 *
 * @author ADMIN
 */
public class HomeServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
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
        CompanyDAO dao = new CompanyDAO();

        String category = request.getParameter("category");
        String page = request.getParameter("page");

        if (category == null) {
            category = "all";
        }

        int index = 1;

        if (page != null) {
            index = Integer.parseInt(page);
        }

        List<Company> list;

        int total;

        if (category.equals("all")) {
            list = dao.getCompanyByPage(index);
            total = dao.countCompany();
        } else {
            list = dao.getCompanyByCategory(category, index);
            total = dao.countCompanyByCategory(category);
        }

        int endPage = total / 6;

        if (total % 6 != 0) {
            endPage++;
        }
        String filterType = request.getParameter("filterType");
        String filterValue = request.getParameter("filterValue");

        if (filterType == null) {
            filterType = "salary";
        }
        if (filterValue == null) {
            filterValue = "Tất cả";
        }

        JobDAO dao1 = new JobDAO();
        List<Job> jobs = dao1.getTopJobsFilter(filterType, filterValue);

        request.setAttribute("jobs", jobs);
        request.setAttribute("filterType", filterType);
        request.setAttribute("filterValue", filterValue);
        request.setAttribute("companyList", list);
        request.setAttribute("endPage", endPage);
        request.setAttribute("category", category);
        request.setAttribute("currentPage", index);

        request.getRequestDispatcher("/views/Home.jsp").forward(request, response);
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
