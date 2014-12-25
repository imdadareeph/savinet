/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.Map;

/**
 *
 * @author imdadareeph
 */
public class Comment {
    private int commentId;
    private int postId;
    private int userId;
    private String firstName;
    private String content;
    private Timestamp commDate;
    private Map errors;

    public Map getErrors() {
        return errors;
    }

    public void setErrors(Map errors) {
        this.errors = errors;
    }
    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        if (content.equals("")||content == null) {
            getErrors().put("content", "Please give content");
        } else {
            this.content = content;
        }
        
    }

    /**
     * @return the postedDate
     */
    public Timestamp getCommDate() {
        return commDate;
    }

    /**
     * @param postedDate the postedDate to set
     */
    public void setCommDate(Timestamp commDate) {
        this.commDate = commDate;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }


    
   
}
