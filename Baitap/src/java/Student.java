
import dal.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Admin
 */
public class Student extends DBContext {

    private int id;
    private String lastName;
    private String firstName;
    private LocalDate date;

    public Student() {
        connect();

    }

    public Student(int id, String lastName, String firstName, LocalDate date) {
        this.id = id;
        this.lastName = lastName;
        this.firstName = firstName;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
    Connection cnn;
    PreparedStatement stm;
    ResultSet rs;

    private void connect() {
        cnn = super.connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Connect fail");
        }
    }

    ArrayList<Student> getStudent() {
        ArrayList<Student> data = new ArrayList<Student>();
        try {
            String strSQL = "select * from Student";
            stm = cnn.prepareCall(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String fName = rs.getString(2);
                String lName = rs.getString(3);
                java.sql.Date sqlDate = rs.getDate(4);
                LocalDate localDate = sqlDate.toLocalDate();

                data.add(new Student(id, fName, lName, localDate));
            }
        } catch (Exception e) {
            System.out.println("getCustomers:" + e.getMessage());
        }
        return data;
    }

    

    public void addStudent(String lastName, String firstName, LocalDate date) {
        String strSQL = "INSERT INTO Student(LastName, FirstMidName, EnrollmentDate)\n"
                + "VALUES (?, ?, ?)";
        try {
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, lastName);
            stm.setString(2, firstName);
            stm.setDate(3, java.sql.Date.valueOf(date));
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    int editProduct(Student p) {
        String strSQL = "UPDATE Student\n"
                + "SET LastName=?, FirstMidName=?, EnrollmentDate=?\n"
                + "WHERE ID = ?";
        int x = 0;
        try {

            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, p.getLastName());
            stm.setString(2, p.getFirstName());
            stm.setDate(3, java.sql.Date.valueOf(p.getDate()));

            stm.setInt(4, p.getId());
            x = stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return x;

    }
    
    String deleteStudentById(String ids) {
    int id = Integer.parseInt(ids);
    try {
        String query = "DELETE FROM Student WHERE Id = ?";
        stm = cnn.prepareStatement(query);
        stm.setInt(1, id);

        int rows = stm.executeUpdate();
        if (rows > 0) {
            return "OKE";
        } else {
            return "DELETE FAIL";
        }
    } catch (Exception e) {
        return "Lỗi xóa student";
    }
}


}
