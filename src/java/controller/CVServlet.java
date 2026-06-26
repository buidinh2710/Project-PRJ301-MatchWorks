/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.CVDAO;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;
import java.util.List;
import model.CV;
import model.User;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class CVServlet extends HttpServlet {

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
            out.println("<title>Servlet CVServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CVServlet at " + request.getContextPath() + "</h1>");
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

        String action = request.getParameter("action");

        CVDAO dao = new CVDAO();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        int userId = user.getUserId();

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteCV(id, userId);
            response.sendRedirect("cv");
            return;
        }

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            CV cv = dao.getCVById(id, userId);
            request.setAttribute("cv", cv);
            request.setAttribute("action", "update");
            request.setAttribute("resumeId", id);
            request.getRequestDispatcher("/views/tao-CV.jsp").forward(request, response);

            return;
        }

        if ("detail".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            CV cv = dao.getCVById(id, userId);
            request.setAttribute("cv", cv);
            request.getRequestDispatcher("/views/xem-cv.jsp").forward(request, response);
            return;
        }

        List<CV> list = dao.getListCV(userId);

        request.setAttribute("listCV", list);

        request.getRequestDispatcher("/views/quan-ly-cv.jsp").forward(request, response);
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

        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        int userId = user.getUserId();

        if ("update".equals(action)) {

            int resumeId = Integer.parseInt(request.getParameter("resumeId"));
            String nameCv = request.getParameter("nameCv");

            Part filePart = request.getPart("avatarCv");
            String oldAvatar = request.getParameter("oldAvatar");
            String fileName = null;

            if (filePart != null && filePart.getSize() > 0) {
                fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
                String rootPath = getServletContext().getRealPath("");
                String uploadPath = rootPath + "static" + File.separator + "images" + File.separator + "Pic-CV";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                filePart.write(uploadPath + File.separator + fileName);
            } else {
                fileName = oldAvatar;
            }
            if (fileName == null || fileName.isEmpty()) {
                request.setAttribute("error", "Bạn chưa tải ảnh lên!!");
                request.getRequestDispatcher("/views/tao-CV.jsp").forward(request, response);
                return;
            }

            String fullName = request.getParameter("fullName");
            String positionCv = request.getParameter("positionCv");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String websiteCv = request.getParameter("websiteCv");
            String locationCv = request.getParameter("locationCv");
            String email = request.getParameter("email");

            String careerGoalsCv = request.getParameter("careerGoalsCv");
            String educationCv = request.getParameter("educationCv");
            String experienceCv = request.getParameter("experienceCv");
            String certificateCv = request.getParameter("certificateCv");
            String skillsCv = request.getParameter("skillsCv");
            String hobbiesCv = request.getParameter("hobbiesCv");

            String dateStr = request.getParameter("date");
            Date dob = null;

            if (dateStr != null && !dateStr.isEmpty()) {
                dob = Date.valueOf(dateStr);
            }

            CV cv = new CV();

            cv.setResumeId(resumeId);
            cv.setNameCv(nameCv);
            cv.setAvatarCv(fileName);
            cv.setFullNameCv(fullName);
            cv.setPositionCv(positionCv);
            cv.setPhone(phone);
            cv.setDob(dob);
            cv.setGender(gender);
            cv.setEmail(email);
            cv.setWebsiteCv(websiteCv);
            cv.setLocationCv(locationCv);
            cv.setCareerGoalsCv(careerGoalsCv);
            cv.setEducationCv(educationCv);
            cv.setExperienceCv(experienceCv);
            cv.setCertificateCv(certificateCv);
            cv.setSkillsCv(skillsCv);
            cv.setHobbiesCv(hobbiesCv);
            cv.setUserId(userId);

            CVDAO dao = new CVDAO();
            dao.updateCV(cv);
        }

        if ("insert".equals(action)) {

            String nameCv = request.getParameter("nameCv");
            Part filePart = request.getPart("avatarCv");
            String oldAvatar = request.getParameter("oldAvatar");
            String fileName = null;
            if (filePart != null && filePart.getSize() > 0) {
                fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
                String rootPath = getServletContext().getRealPath("");
                String uploadPath = rootPath + "static" + File.separator + "images" + File.separator + "Pic-CV";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                filePart.write(uploadPath + File.separator + fileName);
            } else {
                fileName = oldAvatar;
            }
            if (fileName == null || fileName.isEmpty()) {
                request.setAttribute("error", "Bạn chưa tải ảnh lên!!");
                request.getRequestDispatcher("/views/tao-CV.jsp").forward(request, response);
                return;
            }

            String fullName = request.getParameter("fullName");
            String positionCv = request.getParameter("positionCv");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String websiteCv = request.getParameter("websiteCv");
            String locationCv = request.getParameter("locationCv");
            String email = request.getParameter("email");

            String careerGoalsCv = request.getParameter("careerGoalsCv");
            String educationCv = request.getParameter("educationCv");
            String experienceCv = request.getParameter("experienceCv");
            String certificateCv = request.getParameter("certificateCv");
            String skillsCv = request.getParameter("skillsCv");
            String hobbiesCv = request.getParameter("hobbiesCv");

            String dateStr = request.getParameter("date");
            Date dob = null;

            if (dateStr != null && !dateStr.isEmpty()) {
                dob = Date.valueOf(dateStr);
            }

            CV cv = new CV();

            cv.setUserId(userId);

            cv.setNameCv(nameCv);
            cv.setAvatarCv(fileName);
            cv.setFullNameCv(fullName);
            cv.setPositionCv(positionCv);
            cv.setPhone(phone);
            cv.setDob(dob);
            cv.setGender(gender);
            cv.setEmail(email);
            cv.setWebsiteCv(websiteCv);
            cv.setLocationCv(locationCv);
            cv.setCareerGoalsCv(careerGoalsCv);
            cv.setEducationCv(educationCv);
            cv.setExperienceCv(experienceCv);
            cv.setCertificateCv(certificateCv);
            cv.setSkillsCv(skillsCv);
            cv.setHobbiesCv(hobbiesCv);

            CVDAO dao = new CVDAO();
            dao.insertCV(cv);
        }

        response.sendRedirect(request.getContextPath() + "/views/cv");
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
