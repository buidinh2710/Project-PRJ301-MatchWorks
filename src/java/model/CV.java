/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class CV {
    private int resumeId;
    private int userId;
    private String nameCv;
    private String avatarCv;
    private String fullNameCv;
    private String positionCv;
    private String phone;
    private Date dob;
    private String gender;
    private String email;
    private String websiteCv;
    private String locationCv;
    private String careerGoalsCv;
    private String educationCv;
    private String experienceCv;
    private String certificateCv;
    private String skillsCv;
    private String hobbiesCv;

    public CV() {
    }
    

    public CV(String nameCv, String avatarCv, String fullNameCv, String positionCv, String phone, Date dob, String gender, String email, String websiteCv, String locationCv, String careerGoalsCv, String educationCv, String experienceCv, String certificateCv, String skillsCv, String hobbiesCv) {
        this.nameCv = nameCv;
        this.avatarCv = avatarCv;
        this.fullNameCv = fullNameCv;
        this.positionCv = positionCv;
        this.phone = phone;
        this.dob = dob;
        this.gender = gender;
        this.email = email;
        this.websiteCv = websiteCv;
        this.locationCv = locationCv;
        this.careerGoalsCv = careerGoalsCv;
        this.educationCv = educationCv;
        this.experienceCv = experienceCv;
        this.certificateCv = certificateCv;
        this.skillsCv = skillsCv;
        this.hobbiesCv = hobbiesCv;
    }

    public int getResumeId() {
        return resumeId;
    }

    public void setResumeId(int resumeId) {
        this.resumeId = resumeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getNameCv() {
        return nameCv;
    }

    public void setNameCv(String nameCv) {
        this.nameCv = nameCv;
    }

    public String getAvatarCv() {
        return avatarCv;
    }

    public void setAvatarCv(String avatarCv) {
        this.avatarCv = avatarCv;
    }

    public String getFullNameCv() {
        return fullNameCv;
    }

    public void setFullNameCv(String fullNameCv) {
        this.fullNameCv = fullNameCv;
    }

    public String getPositionCv() {
        return positionCv;
    }

    public void setPositionCv(String positionCv) {
        this.positionCv = positionCv;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWebsiteCv() {
        return websiteCv;
    }

    public void setWebsiteCv(String websiteCv) {
        this.websiteCv = websiteCv;
    }

    public String getLocationCv() {
        return locationCv;
    }

    public void setLocationCv(String locationCv) {
        this.locationCv = locationCv;
    }

    public String getCareerGoalsCv() {
        return careerGoalsCv;
    }

    public void setCareerGoalsCv(String careerGoalsCv) {
        this.careerGoalsCv = careerGoalsCv;
    }

    public String getEducationCv() {
        return educationCv;
    }

    public void setEducationCv(String educationCv) {
        this.educationCv = educationCv;
    }

    public String getExperienceCv() {
        return experienceCv;
    }

    public void setExperienceCv(String experienceCv) {
        this.experienceCv = experienceCv;
    }

    public String getCertificateCv() {
        return certificateCv;
    }

    public void setCertificateCv(String certificateCv) {
        this.certificateCv = certificateCv;
    }

    public String getSkillsCv() {
        return skillsCv;
    }

    public void setSkillsCv(String skillsCv) {
        this.skillsCv = skillsCv;
    }

    public String getHobbiesCv() {
        return hobbiesCv;
    }

    public void setHobbiesCv(String hobbiesCv) {
        this.hobbiesCv = hobbiesCv;
    }
}
