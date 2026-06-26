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
import model.Job;
import DAO.DBContext;
import model.*;

/**
 *
 * @author Admin
 */
public class CVDAO extends DBContext {

    public void insertCV(CV cv) {

        String sql = """
            insert into cv
            ( user_id, name_cv, avatar_cv, full_name_cv, position_cv, phone, dob, gender, email,
             website_cv, location_cv, career_goals_cv, education_cv,
             experience_cv, certificate_cv, skills_cv, hobbies_cv)
            values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
            """;

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, cv.getUserId());
            ps.setString(2, cv.getNameCv());
            ps.setString(3, cv.getAvatarCv());
            ps.setString(4, cv.getFullNameCv());
            ps.setString(5, cv.getPositionCv());
            ps.setString(6, cv.getPhone());
            ps.setDate(7, cv.getDob());
            ps.setString(8, cv.getGender());
            ps.setString(9, cv.getEmail());
            ps.setString(10, cv.getWebsiteCv());
            ps.setString(11, cv.getLocationCv());
            ps.setString(12, cv.getCareerGoalsCv());
            ps.setString(13, cv.getEducationCv());
            ps.setString(14, cv.getExperienceCv());
            ps.setString(15, cv.getCertificateCv());
            ps.setString(16, cv.getSkillsCv());
            ps.setString(17, cv.getHobbiesCv());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<CV> getListCV(int userId) {

        List<CV> list = new ArrayList<>();
        String sql = "select resume_id, avatar_cv, name_cv, full_name_cv, position_cv from cv where user_id = ?";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CV cv = new CV();

                cv.setResumeId(rs.getInt("resume_id"));
                cv.setAvatarCv(rs.getString("avatar_cv"));
                cv.setNameCv(rs.getString("name_cv"));
                cv.setFullNameCv(rs.getString("full_name_cv"));
                cv.setPositionCv(rs.getString("position_cv"));

                list.add(cv);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void deleteCV(int id, int userId) {

        String sql = "delete from cv where resume_id = ? and user_id = ?";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);
            ps.setInt(2, userId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public CV getCVById(int id, int userId) {

        String sql = "select * from cv where resume_id = ? and user_id = ?";
        CV cv = null;

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);
            ps.setInt(2, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                cv = new CV();

                cv.setResumeId(rs.getInt("resume_id"));
                cv.setUserId(rs.getInt("user_id"));

                cv.setAvatarCv(rs.getString("avatar_cv"));
                cv.setNameCv(rs.getString("name_cv"));
                cv.setFullNameCv(rs.getString("full_name_cv"));
                cv.setPositionCv(rs.getString("position_cv"));
                cv.setPhone(rs.getString("phone"));
                cv.setGender(rs.getString("gender"));
                cv.setEmail(rs.getString("email"));
                cv.setWebsiteCv(rs.getString("website_cv"));
                cv.setLocationCv(rs.getString("location_cv"));

                cv.setCareerGoalsCv(rs.getString("career_goals_cv"));
                cv.setEducationCv(rs.getString("education_cv"));
                cv.setExperienceCv(rs.getString("experience_cv"));
                cv.setCertificateCv(rs.getString("certificate_cv"));
                cv.setSkillsCv(rs.getString("skills_cv"));
                cv.setHobbiesCv(rs.getString("hobbies_cv"));

                cv.setDob(rs.getDate("dob"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cv;
    }

    public void updateCV(CV cv) {

        String sql = "update cv set "
                + "name_cv = ?, "
                + "avatar_cv = ?, "
                + "full_name_cv = ?, "
                + "position_cv = ?, "
                + "phone = ?, "
                + "dob = ?, "
                + "gender = ?, "
                + "email = ?, "
                + "website_cv = ?, "
                + "location_cv = ?, "
                + "career_goals_cv = ?, "
                + "education_cv = ?, "
                + "experience_cv = ?, "
                + "certificate_cv = ?, "
                + "skills_cv = ?, "
                + "hobbies_cv = ? "
                + "where resume_id = ? and user_id = ?";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, cv.getNameCv());
            ps.setString(2, cv.getAvatarCv());
            ps.setString(3, cv.getFullNameCv());
            ps.setString(4, cv.getPositionCv());
            ps.setString(5, cv.getPhone());
            ps.setDate(6, cv.getDob());
            ps.setString(7, cv.getGender());
            ps.setString(8, cv.getEmail());
            ps.setString(9, cv.getWebsiteCv());
            ps.setString(10, cv.getLocationCv());
            ps.setString(11, cv.getCareerGoalsCv());
            ps.setString(12, cv.getEducationCv());
            ps.setString(13, cv.getExperienceCv());
            ps.setString(14, cv.getCertificateCv());
            ps.setString(15, cv.getSkillsCv());
            ps.setString(16, cv.getHobbiesCv());

            ps.setInt(17, cv.getResumeId());
            ps.setInt(18, cv.getUserId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
