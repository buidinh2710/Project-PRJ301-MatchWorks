package model;

public class Company {

    private int companyId;
    private String avtCompany;
    private String nameCompany;
    private String cityName;
    private String categoryName;
    private String companyAddress;
    private String descriptionCompany;
    private String locationId;
    private int cityId;
    private int totalJobs;

    public Company() {
    }

    public Company(int companyId, String avtCompany, String nameCompany,
            String descriptionCompany, String locationId, int cityId,
            String cityName, String categoryName, int totalJobs) {

        this.companyId = companyId;
        this.avtCompany = avtCompany;
        this.nameCompany = nameCompany;
        this.descriptionCompany = descriptionCompany;
        this.locationId = locationId;
        this.cityId = cityId;
        this.cityName = cityName;
        this.categoryName = categoryName;
        this.totalJobs = totalJobs;
    }

    public Company(int companyId, String avtCompany, String nameCompany, String categoryName, String companyAddress,String descriptionCompany) {
        this.companyId = companyId;
        this.avtCompany = avtCompany;
        this.nameCompany = nameCompany;
        this.categoryName = categoryName;
        this.companyAddress = companyAddress;
        this.descriptionCompany = descriptionCompany;
    }

    
    
    public Company(int companyId, String avtCompany, String nameCompany,
            String descriptionCompany, String locationId, int cityId) {
        this.companyId = companyId;
        this.avtCompany = avtCompany;
        this.nameCompany = nameCompany;
        this.descriptionCompany = descriptionCompany;
        this.locationId = locationId;
        this.cityId = cityId;
    }

    public Company(int companyId, String avtCompany, String nameCompany, String categoryName, int totalJobs) {
        this.companyId = companyId;
        this.avtCompany = avtCompany;
        this.nameCompany = nameCompany;
        this.categoryName = categoryName;
        this.totalJobs = totalJobs;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getTotalJobs() {
        return totalJobs;
    }

    public void setTotalJobs(int totalJobs) {
        this.totalJobs = totalJobs;
    }

    public int getCompanyId() {
        return companyId;
    }

    public String getAvtCompany() {
        return avtCompany;
    }

    public String getNameCompany() {
        return nameCompany;
    }

    public String getDescriptionCompany() {
        return descriptionCompany;
    }

    public String getLocationId() {
        return locationId;
    }

    public int getCityId() {
        return cityId;
    }
}
