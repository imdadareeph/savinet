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
import java.util.Vector;

/**
 *
 * @author imdadareeph
 */
public class CommentTable {

    MyConnector myCon;
    Statement stmt;
    Connection connection;
    String error;
    PreparedStatement pstmt;

    public CommentTable() {
        myCon = new MyConnector();
        try {
            connection = myCon.connect();

        } catch (Exception e) {

            setError("connection error");
        }
    }

 
    public void insertComment(Comment c) {


        String psql = "";
        try {

            psql = "insert into comments(PostId,UserId,Content,CommDate) values(?,?,?,?)";

            pstmt = connection.prepareStatement(psql);
            
            pstmt.setInt(1, c.getPostId());
            pstmt.setInt(2, c.getUserId());
            pstmt.setString(3, c.getContent());
            pstmt.setTimestamp(4, c.getCommDate());

            pstmt.executeUpdate();
            pstmt.close();
        }catch (SQLException se) {

            setError(" Err with Sql " + se.getMessage());
        }


    }

    public Vector<Comment> getCommentsByPostId(int pid){

        Vector all = new Vector();
        String sql = "";
        try {

            //sql = "select * from comments where PostId = '"+pid+"' order by CommDate DESC";
            sql = "select u.FirstName,c.* from comments c,users u where c.UserId = u.UserId and PostId = '"+pid+"' order by CommDate DESC";

            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            

            while(rs.next()){
                Comment c = new Comment();
                c.setCommentId(rs.getInt("CommId"));
                c.setUserId(rs.getInt("UserId"));
                c.setFirstName(rs.getString("FirstName"));
                c.setContent(rs.getString("Content"));
                c.setCommDate(rs.getTimestamp("CommDate"));
                all.add(c);
            }
            

        }catch (Exception se) {

            setError(" Err with Sql " + se.getMessage());
            return all;
        }
        return all;

    }

    
    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    public void deleteComment(int commentId){
    String sql="delete from comments where CommId='"+commentId+"'";
        try {
            stmt=connection.createStatement();
            stmt.executeUpdate(sql);
        } catch (Exception se) {
            setError(" Err with Sql " + se.getMessage());
        }
    }
}
