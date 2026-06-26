/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Apply;
import DAO.DBContext;
import model.*;

/**
 *
 * @author Admin
 */
public class ApplyDAO extends DBContext {

    public List<Apply> getAllApply() {

        List<Apply> list = new ArrayList<>();

        String sql = "select ja.application_id, ja.user_id, u.full_name, j.title_job, "
                + "c.name_company, ja.resume_id "
                + "from job_application ja "
                + "join users u on ja.user_id = u.user_id "
                + "join jobs j on ja.job_id = j.job_id "
                + "join company c on j.company_id = c.company_id "
                + "join cv r on ja.resume_id = r.resume_id";

        try {

            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Apply apply = new Apply();

                apply.setApplicationId(rs.getInt("application_id"));
                apply.setUserId(rs.getInt("user_id"));
                apply.setFullName(rs.getString("full_name"));
                apply.setTitleJob(rs.getString("title_job"));
                apply.setNameCompany(rs.getString("name_company"));
                apply.setResumeId(rs.getInt("resume_id"));

                list.add(apply);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void deleteApplication(int id) {

        String sql = "delete from job_application where application_id = ?";

        try {

            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void insertApplication(int jobId, int userId, int resumeId) {
        String sql = "insert into job_application (job_id, user_id, resume_id) values (?, ?, ?)";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, jobId);
            ps.setInt(2, userId);
            ps.setInt(3, resumeId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Apply> getApplyByEducation(String education) {

    List<Apply> list = new ArrayList<>();

    String sql = "select ja.application_id, ja.user_id, u.full_name, j.title_job, "
            + "c.name_company, ja.resume_id, r.education_cv "
            + "from job_application ja "
            + "join users u on ja.user_id = u.user_id "
            + "join jobs j on ja.job_id = j.job_id "
            + "join company c on j.company_id = c.company_id "
            + "join cv r on ja.resume_id = r.resume_id "
            + "where r.education_cv = ?";

    try {
        Connection conn = DBContext.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, education);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Apply apply = new Apply();

            apply.setApplicationId(rs.getInt("application_id"));
            apply.setUserId(rs.getInt("user_id"));
            apply.setFullName(rs.getString("full_name"));
            apply.setTitleJob(rs.getString("title_job"));
            apply.setNameCompany(rs.getString("name_company"));
            apply.setResumeId(rs.getInt("resume_id"));

            list.add(apply);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}

}
