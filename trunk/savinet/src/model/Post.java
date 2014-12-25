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
public class Post {

    private int postId;
    private int userId;
    private String title;
    private String content;
    private Timestamp postedDate;
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

    
    

    /**
     * @return the title
     */
    public String getTitle() {

        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        if (title.equals("")||title == null) {
            getErrors().put("title", "Please give title");
        } else {
            this.title = title;
        }
        
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
    public Timestamp getPostedDate() {
        return postedDate;
    }

    /**
     * @param postedDate the postedDate to set
     */
    public void setPostedDate(Timestamp postedDate) {
        this.postedDate = postedDate;
    }

    
   
}
