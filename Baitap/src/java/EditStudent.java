/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/EditStudent"})
public class EditStudent extends HttpServlet {

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
            out.println("<title>Servlet EditStudent</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditStudent at " + request.getContextPath() + "</h1>");
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
        String idr = request.getParameter("id");
        int id = Integer.parseInt(idr);
        Student p = new Student();
        List<Student> data = p.getStudent();
        Student find = null;
        for (Student pr : data) {
            if (pr.getId() == id) {
                find = pr;
                break;
            }
        }
        request.setAttribute("student", find);
        request.getRequestDispatcher("EditStudent.jsp").forward(request, response);
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
        String idr = request.getParameter("id");
        int id = Integer.parseInt(idr);
        Student p = new Student();
        Student c = new Student();
        List<Student> data = p.getStudent();
        Student find = null;
        for (Student pr : data) {
            if (pr.getId() == id) {
                find = pr;
                break;
            }
        }
        p.setId(id);
        String fname = request.getParameter("firstName");
        String lname = request.getParameter("lastName");
        String date = request.getParameter("date");
        LocalDate datee = LocalDate.parse(date);

        p.setFirstName(fname);
        p.setLastName(lname);
        p.setDate(datee);
        int k = c.editProduct(p);
        response.sendRedirect("StudentServlet");
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
