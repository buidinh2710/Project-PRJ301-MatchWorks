package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Job;
import DAO.DBContext;

public class JobDAO {

    public int countSearchJobs(String keyword, String city, String salary, String experience) {

        String sql = """
        SELECT COUNT(*)
        FROM jobs j
        JOIN company c ON j.company_id = c.company_id
        JOIN company_city city ON c.city_id = city.city_id
        WHERE
        j.title_job LIKE ?
        AND city.city_name LIKE ?
        AND j.salary_job LIKE ?
        AND j.experience_job LIKE ?
        """;

        try {

            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + city + "%");
            ps.setString(3, "%" + salary + "%");
            ps.setString(4, "%" + experience + "%");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public List<Job> searchJobs(String keyword, String city,
            String salary, String exp,
            int page) {

        List<Job> list = new ArrayList<>();

        String sql = """
    SELECT j.job_id, j.title_job, j.salary_job, j.experience_job,
               c.name_company, city.city_name
        FROM jobs j
        JOIN company c ON j.company_id = c.company_id
        JOIN company_city city ON c.city_id = city.city_id
        WHERE
            j.title_job LIKE ?
        AND city.city_name LIKE ?
        AND j.salary_job LIKE ?
        AND j.experience_job LIKE ?
        ORDER BY j.job_id
        OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY
    """;

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + city + "%");
            ps.setString(3, "%" + salary + "%");
            ps.setString(4, "%" + exp + "%");

            ps.setInt(5, (page - 1) * 6);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Job job = new Job();

                job.setJobId(rs.getInt("job_id"));
                job.setTitleJob(rs.getString("title_job"));
                job.setSalaryJob(rs.getString("salary_job"));
                job.setExperienceJob(rs.getString("experience_job"));
                job.setCompanyName(rs.getString("name_company"));
                job.setCityName(rs.getString("city_name"));

                list.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Job getJobById(int id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = """
        SELECT 
        j.job_id,
        j.title_job,
        j.salary_job,
        j.experience_job,
        j.description_job,
        j.requirement_job,
        j.benefit_job,
        j.hiring_quantity,

        c.company_id,
        c.name_company,
        c.avt_company,             
        caci.category_name,
        city.city_name,

        CONCAT(c.location_id, ' ', city.city_name) AS company_address

        FROM jobs j
        JOIN company c ON j.company_id = c.company_id
        JOIN company_city city ON c.city_id = city.city_id
        JOIN field_company fc ON c.company_id = fc.company_id
        JOIN company_category caci ON fc.category_id = caci.category_id
        WHERE j.job_id = ?
        """;

        try {

            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {

                Job job = new Job();

                job.setJobId(rs.getInt("job_id"));
                job.setCompanyId(rs.getInt("company_id"));
                job.setCompanyName(rs.getString("name_company"));
                job.setCityName(rs.getString("city_name"));
                job.setCategoryName(rs.getString("category_name"));
                job.setCompanyAddress(rs.getString("company_address"));
                job.setAvtCompany(rs.getString("avt_company"));
                job.setTitleJob(rs.getString("title_job"));
                job.setDescriptionJob(rs.getString("description_job"));
                job.setRequirementJob(rs.getString("requirement_job"));
                job.setBenefitJob(rs.getString("benefit_job"));

                job.setSalaryJob(rs.getString("salary_job"));
                job.setExperienceJob(rs.getString("experience_job"));

                job.setHiringQuantity(rs.getInt("hiring_quantity"));

                return job;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Job> getAllJobs() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Job> list = new ArrayList<>();

        String sql = """
        SELECT j.job_id,
               j.title_job,
               j.salary_job,
               j.experience_job,
               c.company_id,
               c.name_company,
               city.city_name
        FROM jobs j
        JOIN company c ON j.company_id = c.company_id
        JOIN company_city city ON c.city_id = city.city_id
        ORDER BY j.job_id DESC
        """;

        try {

            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                Job job = new Job();

                job.setJobId(rs.getInt("job_id"));
                job.setTitleJob(rs.getString("title_job"));
                job.setSalaryJob(rs.getString("salary_job"));
                job.setExperienceJob(rs.getString("experience_job"));
                job.setCompanyId(rs.getInt("company_id"));
                job.setCompanyName(rs.getString("name_company"));
                job.setCityName(rs.getString("city_name"));

                list.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void saveJob(int userId, int jobId) {
        Connection conn = null;
        String check = "SELECT * FROM savedjob WHERE userId=? AND jobId=?";
        String insert = "INSERT INTO savedjob(userId,jobId) VALUES(?,?)";

        try {
            PreparedStatement ps = conn.prepareStatement(check);
            ps.setInt(1, userId);
            ps.setInt(2, jobId);

            ResultSet rs = ps.executeQuery();

            if (!rs.next()) { // chưa lưu
                PreparedStatement ps2 = conn.prepareStatement(insert);
                ps2.setInt(1, userId);
                ps2.setInt(2, jobId);
                ps2.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void removeJob(int userId, int jobId) {
        Connection conn = null;
        String sql = "DELETE FROM savedjob WHERE userId=? AND jobId=?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, jobId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Job> getTopJobsFilter(String type, String value) {
        List<Job> list = new ArrayList<>();

        String sql = """
        SELECT TOP 6
            j.job_id,
            j.title_job,
            j.salary_job,
            j.experience_job,
            c.name_company,
            city.city_name
        FROM jobs j
        JOIN company c ON j.company_id = c.company_id
        JOIN company_city city ON c.city_id = city.city_id
        WHERE 1=1
    """;

        // filter động
        if (type.equals("salary") && !value.equals("Tất cả")) {
            sql += " AND j.salary_job = ?";
        }

        if (type.equals("exp") && !value.equals("Tất cả")) {
            sql += " AND j.experience_job = ?";
        }

        sql += " ORDER BY j.job_id DESC";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            if (!value.equals("Tất cả")) {
                ps.setString(1, value);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Job j = new Job();
                j.setJobId(rs.getInt("job_id"));
                j.setTitleJob(rs.getString("title_job"));
                j.setSalaryJob(rs.getString("salary_job"));
                j.setExperienceJob(rs.getString("experience_job"));
                j.setCompanyName(rs.getString("name_company"));
                j.setCityName(rs.getString("city_name"));
                list.add(j);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<Job> searchChatbot(String keyword, String city, String category) {
        List<Job> list = new ArrayList<>();

        try {
            java.sql.Connection conn = DBContext.getConnection();

            String sql = "SELECT j.job_id, j.title_job, j.salary_job, "
                    + "c.name_company, city.city_name, caci.category_name "
                    + "FROM jobs j "
                    + "JOIN company c ON j.company_id = c.company_id "
                    + "JOIN company_city city ON c.city_id = city.city_id "
                    + "JOIN field_company fc ON c.company_id = fc.company_id "
                    + "JOIN company_category caci ON fc.category_id = caci.category_id "
                    + "WHERE 1=1 ";

            if (!keyword.isEmpty()) {
                sql += " AND j.title_job LIKE ? ";
            }
            if (!city.isEmpty()) {
                sql += " AND city.city_name LIKE ? ";
            }
            if (!category.isEmpty()) {
                sql += " AND caci.category_name LIKE ? ";
            }

            PreparedStatement ps = conn.prepareStatement(sql);

            int index = 1;
            if (!keyword.isEmpty()) {
                ps.setString(index++, "%" + keyword + "%");
            }
            if (!city.isEmpty()) {
                ps.setString(index++, "%" + city + "%");
            }
            if (!category.isEmpty()) {
                ps.setString(index++, "%" + category + "%");
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Job(
                        rs.getInt("job_id"),
                        rs.getString("title_job"),
                        rs.getString("salary_job"),
                        rs.getString("name_company"),
                        rs.getString("city_name")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    public static List<Job> searchFull(String keyword, String city, String exp) {
        List<Job> list = new ArrayList<>();

        try {
            Connection conn = DBContext.getConnection();

            String sql = "SELECT j.job_id, j.title_job, j.salary_job, "
                    + "c.name_company, city.city_name "
                    + "FROM jobs j "
                    + "JOIN company c ON j.company_id = c.company_id "
                    + "JOIN company_city city ON c.city_id = city.city_id "
                    + "WHERE 1=1 ";

            if (!keyword.isEmpty()) {
                sql += " AND (LOWER(j.title_job) LIKE ? "
                        + "OR LOWER(j.description_job) LIKE ?) ";
            }
            if (!city.isEmpty()) {
                sql += " LOWER(city.city_name)? ";
            }

            if (!exp.isEmpty()) {
                sql += " AND LOWER(j.experience_job) LIKE ? ";
            }

            PreparedStatement ps = conn.prepareStatement(sql);

            int i = 1;
            if (!keyword.isEmpty()) {
                String key = "%" + keyword.toLowerCase() + "%";
                ps.setString(i++, key);
                ps.setString(i++, key);
            }
            if (!city.isEmpty()) {
                String ct = "%" + city.toLowerCase() + "%";
                ps.setString(i++, ct);
                ps.setString(i++, ct);
            }
            if (!exp.isEmpty()) {
                String e = "%" + exp.toLowerCase() + "%";
                ps.setString(i++, e);
                ps.setString(i++, e);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Job(
                        rs.getInt("job_id"),
                        rs.getString("title_job"),
                        rs.getString("salary_job"),
                        rs.getString("name_company"),
                        rs.getString("city_name")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Job> searchJob(String keyword, String city, String exp) {
        List<Job> list = new ArrayList<>();

        String sql = """
    SELECT j.job_id, j.title_job, j.salary_job, j.experience_job,
               c.name_company, city.city_name
        FROM jobs j
        JOIN company c ON j.company_id = c.company_id
        JOIN company_city city ON c.city_id = city.city_id
        WHERE
            j.title_job LIKE ?
        AND city.city_name LIKE ?
        AND j.experience_job LIKE ?
        ORDER BY j.job_id
    """;
        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + city + "%");
            ps.setString(3, "%" + exp + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Job(
                        rs.getInt("job_id"),
                        rs.getString("title_job"),
                        rs.getString("salary_job"),
                        rs.getString("name_company"),
                        rs.getString("city_name")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Job> searchByCity(String city) {
        List<Job> list = new ArrayList<>();

        try {
            Connection conn = DBContext.getConnection();

            String sql = "SELECT j.job_id, j.title_job, j.salary_job, "
                    + "c.name_company, city.city_name "
                    + "FROM jobs j "
                    + "JOIN company c ON j.company_id = c.company_id "
                    + "JOIN company_city city ON c.city_id = city.city_id "
                    + "WHERE LOWER(city.city_name) LIKE ?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + removeAccent(city.toLowerCase()) + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Job(
                        rs.getInt("job_id"),
                        rs.getString("title_job"),
                        rs.getString("salary_job"),
                        rs.getString("name_company"),
                        rs.getString("city_name")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static String removeAccent(String s) {
        String temp = java.text.Normalizer.normalize(s, java.text.Normalizer.Form.NFD);
        return temp.replaceAll("\\p{M}", "");
    }

    public List<Job> getAppliedJobs(int userId) {
        List<Job> list = new ArrayList<>();
        String sql = """
            select j.job_id, j.title_job, j.experience_job, j.salary_job,
                   c.name_company, cc.city_name
            from job_application ja
            inner join jobs j on ja.job_id = j.job_id
            inner join company c on j.company_id = c.company_id
            inner join company_city cc on c.city_id = cc.city_id
            where ja.user_id = ?
            order by ja.application_id desc
        """;

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Job job = new Job();

                job.setJobId(rs.getInt("job_id"));
                job.setTitleJob(rs.getString("title_job"));
                job.setSalaryJob(rs.getString("salary_job"));
                job.setExperienceJob(rs.getString("experience_job"));
                job.setCompanyName(rs.getString("name_company"));
                job.setCityName(rs.getString("city_name"));

                list.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Job> getSavedJobs(int userId) {
        List<Job> list = new ArrayList<>();

        String sql = """
        select j.job_id, j.title_job, j.experience_job, j.salary_job,
               c.name_company, cc.city_name
        from savedjobs sj
        inner join jobs j on sj.job_id = j.job_id
        inner join company c on j.company_id = c.company_id
        inner join company_city cc on c.city_id = cc.city_id
        where sj.user_id = ?
        order by sj.savejobs_id desc
    """;

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Job job = new Job();

                job.setJobId(rs.getInt("job_id"));
                job.setTitleJob(rs.getString("title_job"));
                job.setSalaryJob(rs.getString("salary_job"));
                job.setExperienceJob(rs.getString("experience_job"));
                job.setCompanyName(rs.getString("name_company"));
                job.setCityName(rs.getString("city_name"));

                list.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
