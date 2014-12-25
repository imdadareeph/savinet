/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author imdadareeph
 */
public class UserTable {

    MyConnector myCon;
    Statement stmt;
    Connection connection;
    String error;
    PreparedStatement pstmt;
    int SessionId;

    public int getSessionId() {
        return SessionId;
    }

    public void setSessionId(int SessionId) {
        this.SessionId = SessionId;
    }

    public UserTable() {
        myCon = new MyConnector();
        try {
            connection = myCon.connect();

        } catch (Exception e) {

            setError("connection error");
        }
    }

    public void amIExists(User u) {
        String sql = "select count(*) as count from users where UserName = '" + u.getUserName() + "'";
        try {
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next() && rs.getInt("count") != 0) {
                u.getErrors().put("userExist", "The user name already exist !");
            }
            stmt.close();
        } catch (SQLException se) {
            setError("Sql error on user name checking !" + se.getMessage());
        }


    }

    public void insertMe(User u) {


        String psql = "";

        try {

            psql = "insert into users(UserName,Gender,Dob,FirstName,Email,Password,Phone,Address,Country,Hobby,Game,Education,ActCode,Image)" + " values('" + u.getUserName() + "','" + u.getGender() + "','" + u.getDob() + "','" + u.getFirstName() + "','" + u.getEmail() + "','" + getMd5Digest(u.getPassword()) + "','" + u.getPhone() + "','" + u.getAddress() + "','" + u.getCountry() + "','" + u.getHobby() + "','" + u.getGame() + "','" + u.getEducation() + "','" + u.getActCode() + "',?)";


            pstmt = connection.prepareStatement(psql);

            pstmt.setBinaryStream(1, u.getImage().getInputStream(), (int) (u.getImage().getSize()));
            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException se) {

            setError(" Err with Sql " + psql + "::::" + se.getMessage());
        } catch (FileNotFoundException fe) {

            setError(" Err with File " + fe.getMessage());
        } catch (IOException ioe) {

            setError(" Err with IO " + ioe.getMessage());
        } catch (Exception e) {

            setError(" Err with insert " + e.getMessage() + "error statement" + psql);
        }


    }

    public boolean loginMe(String uname, String pwd) {
        pwd = getMd5Digest(pwd);
        String sql = "select UserId from users where UserName ='" + uname + "' and Password ='" + pwd + "'";
        try {
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                setSessionId(rs.getInt("UserId"));
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    static String getMd5Digest(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            return number.toString(16);
        } catch (NoSuchAlgorithmException e) {
            return input;
        }
    }

    public byte[] getUserImageById(int userId) {
        String sql = "select image from users where UserId='" + userId + "'";
        try {
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                return rs.getBytes("image");
            } else {
                return null;
            }
        } catch (Exception e) {
            setError("err on query" + e.getMessage());
            return null;
        }

    }

    public User getUserById(int userId) {
        User user = new User();
        PostTable post = new PostTable();
        String sql = "select * from users where UserId='"+ userId + "'";
        try {
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                user.setUserId(rs.getInt("UserId"));
                user.setUserName(rs.getString("UserName"));
                user.setFirstName(rs.getString("FirstName"));
                user.setEmail(rs.getString("Email")); //Check the email format
                user.setAddress(rs.getString("Address"));
                user.setCountry(rs.getString("Country"));
                user.setDob(rs.getDate("Dob"));
                user.setGame(rs.getString("Game"));
                user.setEducation(rs.getString("Education"));
                user.setGender(rs.getString("Gender"));
                user.setPhone(rs.getString("Phone"));
                user.setHobby(rs.getString("Hobby"));
                user.setPosts(post.getPostsByUserId(userId));

            } else {
                return null;
            }
        } catch (Exception e) {
            setError("err on query" + e.getMessage());
            return null;
        }
        return user;
    }

    public Vector<User> searchUserByName(String str) {
        String sql="select UserId from users where UserName like '%"+str+"%'";
         Vector users = new Vector();
        try{
        stmt=connection.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        int userId=0;
        User user=null;
        while(rs.next()){
            userId=rs.getInt("UserId");
            user=getUserById(userId);
            users.add(user);
        }
        }catch(Exception e){
         return null;
        }
        return users;
    }
}

