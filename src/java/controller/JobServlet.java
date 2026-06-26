package controller;

import DAO.JobDAO;
import DAO.SaveJobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Job;
import model.User;

/**
 *
 * @author ADMIN
 */
public class JobServlet extends HttpServlet {

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
            out.println("<title>Servlet JobServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JobServlet at " + request.getContextPath() + "</h1>");
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
        User user = (User) session.getAttribute("user");
        if (user != null) {

            int userId = user.getUserId();
            List<Integer> savedJobIds = new ArrayList<>();

            if (user != null) {
                SaveJobDAO saveDao = new SaveJobDAO();
                savedJobIds = saveDao.getSavedJobIds(user.getUserId());
            }
            request.setAttribute("savedJobIds", savedJobIds);
        }

        String pageParam = request.getParameter("page");
        String keyword = request.getParameter("keyword");
        String city = request.getParameter("city");
        String salary = request.getParameter("salary");
        String exp = request.getParameter("experience");

        if (keyword == null) {
            keyword = "";
        }
        if (city == null) {
            city = "";
        }
        if (salary == null) {
            salary = "";
        }
        if (exp == null) {
            exp = "";
        }

        int page = 1;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        int pageSize = 6;

        JobDAO dao = new JobDAO();

        List<Job> jobs = dao.searchJobs(keyword, city, salary, exp, page);
// đếm tổng job
        int totalJobs = dao.countSearchJobs(keyword, city, salary, exp);
// tính tổng trang
        int totalPages = (int) Math.ceil((double) totalJobs / 6);
        request.setAttribute("jobs", jobs);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);

        request.setAttribute("keyword", keyword);
        request.setAttribute("city", city);
        request.setAttribute("salary", salary);
        request.setAttribute("experience", exp);

        request.getRequestDispatcher("/views/tim-kiem-viec.jsp")
                .forward(request, response);
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
