/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.JobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONObject;

/**
 *
 * @author Admin
 */
public class ChatbotServlet extends HttpServlet {

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
            out.println("<title>Servlet ChatbotServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChatbotServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String message = request.getParameter("message");

        String keyword = "";
        String city = "";
        String exp = "";

        try {
            String msg = message.toLowerCase();

            // ================= 🧠 1. CALL AI =================
            String aiJson = callAI(msg);
            System.out.println("AI JSON: " + aiJson);

            // ================= 🧠 2. PARSE AI =================
            try {
                JSONObject obj = new JSONObject(aiJson);

                keyword = obj.optString("keyword", "").trim();
                city = obj.optString("city", "").trim();
                exp = obj.optString("experience", "").trim();

            } catch (Exception e) {
                System.out.println("❌ JSON lỗi → fallback");
            }

            // ================= 🔥 3. FALLBACK CITY =================
            if (city.isEmpty()) {
                if (msg.contains("hà nội") || msg.contains("ha noi")) {
                    city = "Hà Nội";
                } else if (msg.contains("hồ chí minh") || msg.contains("hcm")) {
                    city = "TP. Hồ Chí Minh";
                } else if (msg.contains("đà nẵng") || msg.contains("da nang")) {
                    city = "Đà Nẵng";
                }
            }

            // ================= 🔥 4. FALLBACK EXPERIENCE =================
            if (exp.isEmpty()) {
                if (msg.contains("1 năm")) {
                    exp = "1 năm";
                } else if (msg.contains("2 năm")) {
                    exp = "2 năm";
                } else if (msg.contains("3 năm")) {
                    exp = "3 năm";
                }
            }

            // ================= 🔥 5. FIX KEYWORD =================
            if (keyword.isEmpty()) {
                keyword = cleanKeyword(message);
            }

            // 👉 nếu user chỉ nhập "hà nội" → keyword phải rỗng
            if (keyword.equalsIgnoreCase(city.toLowerCase())) {
                keyword = "";
            }

            // ================= 🧪 DEBUG =================
            System.out.println("FINAL keyword: " + keyword);
            System.out.println("FINAL city: " + city);
            System.out.println("FINAL exp: " + exp);

            // ================= 🚫 CHẶN RÁC =================
            if (keyword.isEmpty() && city.isEmpty()) {
                out.println("⚠️ Hãy nhập rõ hơn (VD: việc làm IT tại Hà Nội)");
                return;
            }

            // ================= 📊 6. QUERY =================
            JobDAO dao = new JobDAO();
            var jobs = dao.searchChatbot(keyword, city, "");

            // 👉 fallback nếu rỗng
            if (jobs.isEmpty() && !city.isEmpty()) {
                jobs = dao.searchByCity(city);
            }

            // ================= 🎯 7. OUTPUT =================
            if (jobs.isEmpty()) {
                out.println("😢 Không tìm thấy job phù hợp<br> Thử tìm kiếm lại ...");
//                out.println("👉 keyword: " + keyword + "<br>");
//                out.println("👉 city: " + city + "<br>");
//                out.println("👉 exp: " + exp);
            } else {
                out.println("🔥 Tìm thấy " + jobs.size() + " công việc gần giống tiêu chí bạn đang tìm:<br>");

                for (var j : jobs) {
                    out.println(
                            "<div class='chat-job' onclick=\"goDetail(" + j.getJobId() + ")\">"
                            + "👉 <b>" + j.getTitleJob() + "</b><br>"
                            + "🏢 " + j.getCompanyName() + "<br>"
                            + "💰 " + j.getSalaryJob() + "<br>"
                            + "📍 " + j.getCityName()
                            + "</div>"
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("⚠️ Lỗi hệ thống!");
        }
    }

    public static String cleanKeyword(String message) {
        String msg = message.toLowerCase();

        msg = msg.replace("tìm việc", "")
                .replace("việc làm", "")
                .replace("công việc", "")
                .replace("tại", "")
                .replace("ở", "")
                .replace("kinh nghiệm", "")
                .replaceAll("\\d+ năm", "");

        // ❌ bỏ city
        msg = msg.replace("hà nội", "")
                .replace("ha noi", "")
                .replace("đà nẵng", "")
                .replace("da nang", "")
                .replace("hồ chí minh", "")
                .replace("hcm", "");

        return msg.trim();
    }

    private String callAI(String message) {
        try {
            String apiKey = "YOUR_API_KEY";

            URL url = new URL("https://api.openai.com/v1/chat/completions");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + apiKey);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String prompt
                    = "Bạn là AI chuyên phân tích nhu cầu tìm việc.\n"
                    + "Hãy hiểu NGỮ NGHĨA, không chỉ keyword.\n"
                    + "\n"
                    + "Quy tắc:\n"
                    + "- keyword: nghề nghiệp (VD: backend, frontend, java, marketing, kế toán)\n"
                    + "- city: địa điểm (Hà Nội, Đà Nẵng, TP. Hồ Chí Minh)\n"
                    + "- experience: số năm hoặc level (intern, fresher, junior, senior)\n"
                    + "\n"
                    + "Hiểu mapping:\n"
                    + "- backend = java, nodejs, spring\n"
                    + "- frontend = react, html, css\n"
                    + "- intern = 0 năm\n"
                    + "- fresher = 0-1 năm\n"
                    + "\n"
                    + "Chỉ trả JSON:\n"
                    + "{\"keyword\":\"\",\"city\":\"\",\"experience\":\"\"}\n"
                    + "\nCâu: " + message;

            String body = "{ \"model\": \"gpt-4.1-mini\", \"messages\": ["
                    + "{\"role\":\"user\",\"content\":\"" + prompt + "\"}"
                    + "]}";

            conn.getOutputStream().write(body.getBytes("UTF-8"));

            int status = conn.getResponseCode();

            BufferedReader br;

            // 🔥 QUAN TRỌNG: đọc đúng stream
            if (status >= 200 && status < 300) {
                br = new BufferedReader(
                        new InputStreamReader(conn.getInputStream(), "UTF-8"));
            } else {
                br = new BufferedReader(
                        new InputStreamReader(conn.getErrorStream(), "UTF-8"));
            }

            StringBuilder result = new StringBuilder();
            String line;

            while ((line = br.readLine()) != null) {
                result.append(line);
            }

            String json = result.toString();

            System.out.println("API RAW: " + json);

            JSONObject full = new JSONObject(json);

            // 🔥 CHECK ERROR
            if (full.has("error")) {
                System.out.println("API ERROR: "
                        + full.getJSONObject("error").getString("message"));
                return fallbackParse(message);
            }

            // 🔥 CHECK choices tồn tại
            if (!full.has("choices")) {
                return fallbackParse(message);
            }

            String content = full.getJSONArray("choices")
                    .getJSONObject(0)
                    .getJSONObject("message")
                    .getString("content");

            // 🔥 VALIDATE JSON
            if (!content.trim().startsWith("{")) {
                return fallbackParse(message);
            }

            return content;

        } catch (Exception e) {
            e.printStackTrace();
            return fallbackParse(message);
        }
    }

    private String fallbackParse(String message) {
        message = message.toLowerCase();

        String keyword = "";
        String city = "";
        String exp = "";

        if (message.contains("hà nội") || message.contains("ha noi")) {
            city = "Hà Nội";
        }

        if (message.contains("hồ chí minh") || message.contains("hcm")) {
            city = "TP. Hồ Chí Minh";
        }

        if (message.contains("1 năm")) {
            exp = "1 năm";
        }

        if (message.contains("2 năm")) {
            exp = "2 năm";
        }

        return "{ \"keyword\":\"" + keyword + "\", "
                + "\"city\":\"" + city + "\", "
                + "\"experience\":\"" + exp + "\" }";
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
