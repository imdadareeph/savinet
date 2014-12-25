/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;
import java.util.logging.Logger;

/**
 *
 * @author imdadareeph
 */
public class PostTable {

    MyConnector myCon;
    Statement stmt;
    Connection connection;
    String error;
    PreparedStatement pstmt;

    public PostTable() {
        myCon = new MyConnector();
        try {
            connection = myCon.connect();

        } catch (Exception e) {

            setError("connection error");
        }
    }

 
    public void insertPost(Post p) {


        String psql = "";
        try {

            psql = "insert into posts(Title,Content,UserId,PostedDate) values(?,?,?,?)";

            pstmt = connection.prepareStatement(psql);
            
            pstmt.setString(1, p.getTitle());
            pstmt.setString(2, p.getContent());
            pstmt.setInt(3, p.getUserId());
            pstmt.setTimestamp(4, p.getPostedDate());


            pstmt.executeUpdate();
            pstmt.close();
        }catch (SQLException se) {

            setError(" Err with Sql " + se.getMessage());
        }


    }

    public Vector<Post> getPostsByUserId(int uid){
 
       // Map all = new HashMap();
        Vector all = new Vector();
        //Post[] all = null;
        String sql = "";
        try {

            sql = "select * from posts where UserId = '"+uid+"' order by PostId DESC limit 5";
 
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            //all = new Post[rs.getFetchSize()+1];
            
            while(rs.next()){
                Post p = new Post();
                p.setUserId(rs.getInt("UserId"));
                p.setPostId(rs.getInt("PostId"));
                p.setTitle(rs.getString("Title"));
                p.setContent(rs.getString("Content"));
                p.setPostedDate(rs.getTimestamp("PostedDate"));
                all.add(p);
            }
            

        }catch (SQLException se) {

            setError(" Err with Sql " + se.getMessage());
            return all;
        }
        return all;

    }
    public Post getPostById(int pid){
        Post p = new Post();
        String sql = "";
        try {
            sql = "select * from posts where PostId = '"+pid+"'";

            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                p.setPostId(rs.getInt("PostId"));
                p.setUserId(rs.getInt("UserId"));
                p.setTitle(rs.getString("Title"));
                p.setContent(rs.getString("Content"));
                p.setPostedDate(rs.getTimestamp("PostedDate"));
            }
        }catch (SQLException se) {

            setError(" Err with Sql " + se.getMessage());
            return p;
        }
        return p;
    }
    
    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    public void deletePost(int postId){
        String sql = "delete from posts where PostId='"+postId+"'";
        try{
            stmt = connection.createStatement();
            stmt.executeUpdate(sql);
        }catch(SQLException se){
            setError(" Err with Sql " + se.getMessage());
        }
    }


}
