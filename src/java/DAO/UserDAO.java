package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import DAO.DBContext;

public class UserDAO {

    // Đăng ký
    public boolean register(User user) {
        String sql = "INSERT INTO users(role_id,gmail,password,full_name) VALUES(?,?,?,?)";

        try {

            Connection conn = DBContext.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, 3); // role mặc định
            ps.setString(2, user.getGmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getFullName());

            int result = ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Đăng nhập
    public User login(String gmail, String password) {

        String sql = "SELECT * FROM users WHERE gmail=? AND password=?";

        try {

            Connection conn = DBContext.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, gmail.trim());
            ps.setString(2, password.trim());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setRoleId(rs.getInt("role_id"));
                user.setGmail(rs.getString("gmail"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("full_name"));

                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public void updateUser(User user) {
        String sql;

        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            sql = "update users set full_name = ?, gmail = ?, password = ? where user_id = ?";
        } else {
            sql = "update users set full_name = ?, gmail = ? where user_id = ?";
        }

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getGmail());

            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                ps.setString(3, user.getPassword());
                ps.setInt(4, user.getUserId());
            } else {
                ps.setInt(3, user.getUserId());
            }

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
