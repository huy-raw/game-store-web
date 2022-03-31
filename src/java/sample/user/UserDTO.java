/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Date;

/**
 *
 * @author HuyRaw
 */
public class UserDTO {
    private String userID;
    private String fullName;
    private String password;
    private String roleID;
    private Date birthday;
    private String phone;
    private String email;
    private int status;

    public UserDTO() {
    }

    public UserDTO(String userID, String fullName, String password, String roleID,  Date birthday, String phone, String email, int status) {
        this.userID = userID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }


    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userID=" + userID + ", fullName=" + fullName + ", password=" + password + ", roleID=" + roleID  + ", birthday=" + birthday + ", phone=" + phone + ", email=" + email + ", status=" + status + '}';
    }
   
     
    
}
