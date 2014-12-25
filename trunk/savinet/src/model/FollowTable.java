/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author imdadareeph
 */
public class FollowTable {

    MyConnector myCon;
    Statement stmt;
    Connection connection;
    String error;
    PreparedStatement pstmt;

    public FollowTable() {
        myCon = new MyConnector();
        try {
            connection = myCon.connect();

        } catch (Exception e) {

            setError("connection error");
        }
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }


    public void insertFollow(Follow f) {


        String psql = "";
        if(!isFollow(f.getUserId(), f.getFollowerId())){
        try {

            psql = "insert into follows(UserId,FollowerId) values(?,?)";

            pstmt = connection.prepareStatement(psql);

            pstmt.setInt(1, f.getUserId());
            pstmt.setInt(2, f.getFollowerId());

            pstmt.executeUpdate();
            pstmt.close();
        }catch (SQLException se) {

            setError(" Err with Sql " + se.getMessage());
        }
        }

    }
    public void deleteFollow(Follow f){
        String psql = "";
        try {

            psql = "delete from follows where UserId=? and FollowerId=?";

            pstmt = connection.prepareStatement(psql);

            pstmt.setInt(1, f.getUserId());
            pstmt.setInt(2, f.getFollowerId());

            pstmt.executeUpdate();
            pstmt.close();
        }catch (SQLException se) {

            setError(" Err with Sql " + se.getMessage());
        }
    }
    public boolean isFollow(int userId,int followerId){
        
        String sql = "select count(*) as count from follows where UserId='"+userId+"' and FollowerId='"+followerId+"'";
        try{
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            if(rs.next()&& rs.getInt("count") != 0){
                return true;
            }
        }catch(Exception e){
            return false;
        }
       return false;
    }
    public Vector<Follow> getFollowersByUserId(int uid){

       // Map all = new HashMap();
        Vector all = new Vector();
        //Post[] all = null;
        String sql = "";
        try {

            sql = "select * from follows where UserId = '"+uid+"'";

            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            //all = new Post[rs.getFetchSize()+1];

            while(rs.next()){
                Follow f = new Follow();
                f.setFollowerId(rs.getInt("FollowerId"));
                all.add(f);
            }


        }catch (SQLException se) {

            setError(" Err with Sql " + se.getMessage());
            return all;
        }
        return all;

    }
    public Vector<Follow> getUsersByFollowerId(int fid){

       // Map all = new HashMap();
        Vector all = new Vector();
        //Post[] all = null;
        String sql = "";
        try {

            sql = "select * from follows where FollowerId = '"+fid+"'";

            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            //all = new Post[rs.getFetchSize()+1];

            while(rs.next()){
                Follow f = new Follow();
                f.setUserId(rs.getInt("UserId"));
                all.add(f);
            }


        }catch (SQLException se) {

            setError(" Err with Sql " + se.getMessage());
            return all;
        }
        return all;

    }
    

}
