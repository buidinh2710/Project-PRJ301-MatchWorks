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

/**
 *
 * @author Admin
 */
public class SaveJobDAO extends DBContext {

    public boolean isJobSaved(int userId, int jobId) {
        String sql = "SELECT 1 FROM savedjobs WHERE user_id = ? AND job_id = ?";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, jobId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean saveJob(int userId, int jobId) {
        if (isJobSaved(userId, jobId)) {
            return false;
        }

        String sql = "INSERT INTO savedjobs (user_id, job_id) VALUES (?, ?)";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, jobId);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void unsaveJob(int userId, int jobId) {
        String sql = "DELETE FROM savedjobs WHERE user_id = ? AND job_id = ?";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, jobId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Integer> getSavedJobIds(int userId) {
        List<Integer> list = new ArrayList<>();
        String sql = "SELECT job_id FROM savedjobs WHERE user_id = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(rs.getInt("job_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
