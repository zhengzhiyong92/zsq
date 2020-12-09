package com.cykj.bean;


import java.util.Date;

public class Admin {
    private int adminid;
    private String username;
    private String pwd;
    private String tel;
    private String email;
    private String edu;
    private String ocu;
    private String sex;
    private Date rgtime;
    private int integral;
    private int uploadcount;
    private int downloadcount;
    private String state;
    public Admin(){

    }

    public Admin(int adminid, String username, String pwd, String tel, String email, String edu, String ocu, String sex, Date rgtime, int integral, int uploadcount, int downloadcount, String state) {
        this.adminid = adminid;
        this.username = username;
        this.pwd = pwd;
        this.tel = tel;
        this.email = email;
        this.edu = edu;
        this.ocu = ocu;
        this.sex = sex;
        this.rgtime = rgtime;
        this.integral = integral;
        this.uploadcount = uploadcount;
        this.downloadcount = downloadcount;
        this.state = state;
    }

    public int getAdminid() {
        return adminid;
    }

    public void setAdminid(int adminid) {
        this.adminid = adminid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEdu() {
        return edu;
    }

    public void setEdu(String edu) {
        this.edu = edu;
    }

    public String getOcu() {
        return ocu;
    }

    public void setOcu(String ocu) {
        this.ocu = ocu;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getRgtime() {
        return rgtime;
    }

    public void setRgtime(Date rgtime) {
        this.rgtime = rgtime;
    }

    public int getIntegral() {
        return integral;
    }

    public void setIntegral(int integral) {
        this.integral = integral;
    }

    public int getUploadcount() {
        return uploadcount;
    }

    public void setUploadcount(int uploadcount) {
        this.uploadcount = uploadcount;
    }

    public int getDownloadcount() {
        return downloadcount;
    }

    public void setDownloadcount(int downloadcount) {
        this.downloadcount = downloadcount;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
