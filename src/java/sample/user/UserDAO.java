/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;


/**
 *
 * @author HuyRaw
 */
public class UserDAO {
    
    private static final String LOGIN = " SELECT fullName, roleID,  birthday, phone, email, status"
            + " FROM tblUsers WHERE userID=? AND password=?";
    private static final String GET_LIST_USER =" SELECT userID, fullName, roleID, birthday, phone, email, status"
            + " FROM tblUsers WHERE fullName like ?";
    private static final String DELETE_USER = "UPDATE tblUsers SET status = 0 WHERE userID = ?";
    private static final String CHECK_DUPLICATE_EMAIL = "SELECT email from tblUsers WHERE email = ?";
    private static final String CHECK_DUPLICATE_USERID = "SELECT userID from tblUsers WHERE userID = ?";
    private static final String CREATE_USER = "INSERT INTO tblUsers (userID, fullName, password, roleID, birthDay, phone, email, status )"
                    + " VALUES (?, ?, ?, ? ,? ,? ,? , ?) ";
    private static final String UPDATE_USER = "UPDATE tblUsers SET fullName = ?, email = ?, phone = ?, birthday = ?, roleID = ?, status = ? WHERE userID = ?";
    
    
    
    Connection conn = null;
    PreparedStatement ptm = null;
    ResultSet rs = null;
    
    
    
    public UserDTO checkLogin (String userID, String password) throws SQLException  {
        UserDTO user = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    Date birthDate = rs.getDate("birthday");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    int status = rs.getInt("status");
                    user = new UserDTO(userID, fullName, password, roleID, birthDate, phone, email, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return user;
    }
    
    
    public List<UserDTO> getListUser (String search) throws SQLException {
        List<UserDTO> listUser =  new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(GET_LIST_USER);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()){
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String roleID = rs.getString("roleID");
                    Date birthDate = rs.getDate("birthday");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    int status = rs.getInt("status");
                    listUser.add(new UserDTO(userID, fullName, password, roleID, birthDate, phone, email, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return listUser;
    } 
    
    public boolean deleteUser (String userID) throws SQLException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if ( conn != null ) {
              ptm = conn.prepareStatement(DELETE_USER);
              ptm.setString(1, userID);
              result = ptm.executeUpdate() > 0 ? false : true;
            } 
        }  catch (Exception e) {
            e.printStackTrace();
        } finally {        
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return result;
    } 
    
    public boolean checkDuplicateEmail (String email) throws SQLException   {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if ( conn != null){
                ptm = conn.prepareStatement(CHECK_DUPLICATE_EMAIL);
                ptm.setString(1, email);
               rs = ptm.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if (ptm != null ) ptm.close();;
            if (conn != null ) conn.close();;
            
        }
        return result;
    }
    
    public boolean checkDuplicateUserID (String userID) throws SQLException   {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if ( conn != null){
                ptm = conn.prepareStatement(CHECK_DUPLICATE_USERID);
                ptm.setString(1, userID);
                 rs = ptm.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if (ptm != null ) ptm.close();;
            if (conn != null ) conn.close();;
            
        }
        return result;
    }
    
    public boolean createUser (UserDTO user) throws SQLException{
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_USER);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getPassword());
                ptm.setString(4, "US");
                ptm.setDate(5, user.getBirthday());
                ptm.setString(6, user.getPhone());
                ptm.setString(7, user.getEmail());
                ptm.setInt(8, 1);
                result = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
            if (ptm != null ) ptm.close();;
            if (conn != null ) conn.close();; 
        }
        return result;
    }
    
    public boolean updateUser (UserDTO user) throws SQLException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(UPDATE_USER);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getEmail());
                ptm.setString(3, user.getPhone());
                ptm.setDate(4, user.getBirthday());
                ptm.setString(5, user.getRoleID());
                ptm.setInt(6, user.getStatus());
                ptm.setString(7, user.getUserID());
                result = ptm.executeUpdate() > 0;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if (ptm != null ) ptm.close();;
            if (conn != null ) conn.close();; 
        }
        return result;
    }
    
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        try {
            System.out.println(dao.checkDuplicateUserID("user1"));
            System.out.println(dao.checkDuplicateEmail("ruacon130@gmail.com"));
        } catch (Exception e) {
        }
    }
}
