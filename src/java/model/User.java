package model;

public class User {

    private int userId;
    private int roleId;
    private String gmail;
    private String password;
    private String fullName;
    private Integer companyId;

    public User() {}

    public User(int roleId, String gmail, String password, String fullName) {
        this.roleId = roleId;
        this.gmail = gmail;
        this.password = password;
        this.fullName = fullName;
    }

    public int getUserId() {
        return userId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getGmail() {
        return gmail;
    }

    public String getPassword() {
        return password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getCompanyId() {
        return companyId;
    }
}