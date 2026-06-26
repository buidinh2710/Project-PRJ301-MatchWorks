
package DAO;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    private static final String URL
            = "jdbc:sqlserver://localhost:1433;instanceName=MSSQLSERVER01;databaseName=MatchWorks;encrypt=true;trustServerCertificate=true";

    private static final String USERNAME = "sa";
    private static final String PASSWORD = "123";

    public static Connection getConnection() throws Exception {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    public static void main(String[] args) {
        try {
            Connection c = getConnection();
            System.out.println("Connected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

