package model;

public class Job {

    private int jobId;
    private int companyId;
    private String companyName;
    private String cityName;
    private String categoryName;
    private String companyAddress;
    private String titleJob;
    private String descriptionJob;
    private String requirementJob;
    private String benefitJob;
    private String salaryJob;
    private String experienceJob;
    private boolean applyStatus;
    private boolean saveStatus;
    private int hiringQuantity;
    private String avtCompany;

    public Job() {
    }

    public Job(int jobId, String titleJob, String salaryJob, String companyName, String cityName) {
        this.jobId = jobId;
        this.titleJob = titleJob;
        this.salaryJob = salaryJob;
        this.companyName = companyName;
        this.cityName = cityName;
    }

    public Job(int jobId, String companyName, String cityName, String categoryName, String companyAddress, String titleJob, String descriptionJob, int companyId, int hiringQuantity, String requirementJob, String benefitJob, String salaryJob, String experienceJob, boolean saveStatus) {
        this.jobId = jobId;
        this.companyId = companyId;
        this.companyName = companyName;
        this.cityName = cityName;
        this.categoryName = categoryName;
        this.companyAddress = companyAddress;
        this.titleJob = titleJob;
        this.descriptionJob = descriptionJob;
        this.requirementJob = requirementJob;
        this.benefitJob = benefitJob;
        this.salaryJob = salaryJob;
        this.experienceJob = experienceJob;
        this.applyStatus = applyStatus;
        this.saveStatus = saveStatus;
        this.hiringQuantity = hiringQuantity;
    }

    public Job(int jobId, int companyId, String titleJob, String salaryJob,
            String experienceJob) {
        this.jobId = jobId;
        this.companyId = companyId;
        this.titleJob = titleJob;
        this.salaryJob = salaryJob;
        this.experienceJob = experienceJob;
    }

    public String getAvtCompany() {
        return avtCompany;
    }

    public void setAvtCompany(String avtCompany) {
        this.avtCompany = avtCompany;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getTitleJob() {
        return titleJob;
    }

    public void setTitleJob(String titleJob) {
        this.titleJob = titleJob;
    }

    public String getDescriptionJob() {
        return descriptionJob;
    }

    public void setDescriptionJob(String descriptionJob) {
        this.descriptionJob = descriptionJob;
    }

    public String getRequirementJob() {
        return requirementJob;
    }

    public void setRequirementJob(String requirementJob) {
        this.requirementJob = requirementJob;
    }

    public String getBenefitJob() {
        return benefitJob;
    }

    public void setBenefitJob(String benefitJob) {
        this.benefitJob = benefitJob;
    }

    public String getSalaryJob() {
        return salaryJob;
    }

    public void setSalaryJob(String salaryJob) {
        this.salaryJob = salaryJob;
    }

    public String getExperienceJob() {
        return experienceJob;
    }

    public void setExperienceJob(String experienceJob) {
        this.experienceJob = experienceJob;
    }

    public boolean isApplyStatus() {
        return applyStatus;
    }

    public void setApplyStatus(boolean applyStatus) {
        this.applyStatus = applyStatus;
    }

    public boolean isSaveStatus() {
        return saveStatus;
    }

    public void setSaveStatus(boolean saveStatus) {
        this.saveStatus = saveStatus;
    }

    public int getHiringQuantity() {
        return hiringQuantity;
    }

    public void setHiringQuantity(int hiringQuantity) {
        this.hiringQuantity = hiringQuantity;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

}
