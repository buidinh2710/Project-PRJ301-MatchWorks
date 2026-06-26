package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Company;
import model.Job;

public class CompanyDAO extends DBContext {

    public List<Company> getCompanyByPage(String keyword, int index) {

        List<Company> list = new ArrayList<>();

        String sql = """
    SELECT c.company_id,c.avt_company,c.name_company,
    caci.category_name,
    COUNT(DISTINCT j.job_id) AS total_jobs
    FROM company c
    JOIN field_company fc ON c.company_id = fc.company_id
    JOIN company_category caci ON fc.category_id = caci.category_id
    LEFT JOIN jobs j ON c.company_id = j.company_id
    WHERE c.name_company LIKE ?
    GROUP BY c.company_id,c.avt_company,c.name_company,caci.category_name
    ORDER BY c.company_id
    OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY
    """;

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setInt(2, (index - 1) * 6);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Company c = new Company(
                        rs.getInt("company_id"),
                        rs.getString("avt_company"),
                        rs.getString("name_company"),
                        rs.getString("category_name"),
                        rs.getInt("total_jobs")
                );

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Company> getCompanyByPage(int index) {

        List<Company> list = new ArrayList<>();

        String sql = """
    SELECT c.company_id,c.avt_company,c.name_company,
    caci.category_name,
    COUNT(DISTINCT j.job_id) AS total_jobs
    FROM company c
    JOIN field_company fc ON c.company_id = fc.company_id
    JOIN company_category caci ON fc.category_id = caci.category_id
    LEFT JOIN jobs j ON c.company_id = j.company_id
    GROUP BY c.company_id,c.avt_company,c.name_company,caci.category_name
    ORDER BY c.company_id
    OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY
    """;

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Company c = new Company(
                        rs.getInt("company_id"),
                        rs.getString("avt_company"),
                        rs.getString("name_company"),
                        rs.getString("category_name"),
                        rs.getInt("total_jobs")
                );

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Company> getCompanyByCategory(String keyword, String category, int index) {

        List<Company> list = new ArrayList<>();

        String sql = """
    SELECT  
    c.company_id,
    c.avt_company,
    c.name_company,
    caci.category_name,
    COUNT(DISTINCT j.job_id) AS total_jobs
    FROM company c
    JOIN field_company fc ON c.company_id = fc.company_id
    JOIN company_category caci ON fc.category_id = caci.category_id
    LEFT JOIN jobs j ON c.company_id = j.company_id
    WHERE c.name_company LIKE ?
    AND caci.category_id = ?
    GROUP BY
    c.company_id,
    c.avt_company,
    c.name_company,
    caci.category_name
    ORDER BY c.company_id
    OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY
    """;

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setInt(2, Integer.parseInt(category));
            ps.setInt(3, (index - 1) * 6);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Company c = new Company(
                        rs.getInt("company_id"),
                        rs.getString("avt_company"),
                        rs.getString("name_company"),
                        rs.getString("category_name"),
                        rs.getInt("total_jobs")
                );

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Company> getCompanyByCategory(String category, int index) {

        List<Company> list = new ArrayList<>();

        String sql = """
    SELECT  
    c.company_id,
    c.avt_company,
    c.name_company,
    caci.category_name,
    COUNT(DISTINCT j.job_id) AS total_jobs
    FROM company c
    JOIN field_company fc ON c.company_id = fc.company_id
    JOIN company_category caci ON fc.category_id = caci.category_id
    LEFT JOIN jobs j ON c.company_id = j.company_id
    WHERE caci.category_id = ?
    GROUP BY
    c.company_id,
    c.avt_company,
    c.name_company,
    caci.category_name
    ORDER BY c.company_id
    OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY
    """;

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(category));
            ps.setInt(2, (index - 1) * 6);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Company c = new Company(
                        rs.getInt("company_id"),
                        rs.getString("avt_company"),
                        rs.getString("name_company"),
                        rs.getString("category_name"),
                        rs.getInt("total_jobs")
                );

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int countCompany(String keyword) {

        String sql = """
    SELECT COUNT(DISTINCT c.company_id)
    FROM company c
    WHERE c.name_company LIKE ?
    """;

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public int countCompany() {

        String sql = """
    SELECT COUNT(DISTINCT c.company_id)
    FROM company c
    """;

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public int countCompanyByCategory(String keyword, String category) {

        String sql = """
    SELECT COUNT(DISTINCT c.company_id)
    FROM company c
    JOIN field_company fc ON c.company_id = fc.company_id
    JOIN company_category caci ON fc.category_id = caci.category_id
    WHERE c.name_company LIKE ?
    AND caci.category_id = ?
    
    """;

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setInt(2, Integer.parseInt(category));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public int countCompanyByCategory(String category) {

        String sql = """
    SELECT COUNT(DISTINCT c.company_id)
    FROM company c
    JOIN field_company fc ON c.company_id = fc.company_id
    JOIN company_category caci ON fc.category_id = caci.category_id
    WHERE caci.category_id = ?
    
    """;

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(category));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public Company getCompanyById(int id) {

        String sql = """
        SELECT c.company_id,
               c.avt_company,
               c.name_company,caci.category_name,
               CONCAT(c.location_id, ' ', city.city_name) AS company_address,c.description_company
               
        FROM company c
        JOIN field_company fc ON c.company_id = fc.company_id
        JOIN company_city city ON c.city_id = city.city_id
        JOIN company_category caci ON fc.category_id = caci.category_id
        WHERE c.company_id = ?
        """;

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                return new Company(
                        rs.getInt("company_id"),
                        rs.getString("avt_company"),
                        rs.getString("name_company"),
                        rs.getString("category_name"),
                        rs.getString("company_address"),
                        rs.getString("description_company")
                );

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Job> getJobByCompany(int id) {
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
WHERE j.company_id = ?
ORDER BY j.job_id DESC
""";

        try {

            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

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
}
