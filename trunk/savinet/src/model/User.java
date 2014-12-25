/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author imdadareeph
 */
public class User {

    private int userId;
    private String userName;
    private String firstName;
    private String email;
    private Date dob;
    private String gender;
    private String password;
    private String phone;
    private String address;
    private String country;
    private String hobby;
    private String game;
    private String education;
    private String actCode;
    private FileItem image;
    private Vector<Post> posts;
    private Map errors;

    public Map getErrors() {
        return errors;
    }

    public void setErrors(Map errors) {
        this.errors = errors;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        if (userName.equals("") || userName == null) {
            getErrors().put("uname", "Please Fill User Name");
        } else {
            this.userName = userName;
        }
    }

    public FileItem getImage() {

        return image;

    }

    public void setImage(FileItem image) {

        if (image == null) {
            getErrors().put("image", "Please upload an image");
        }
        this.image = image;

    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        if (firstName.equals("") || firstName == null) {
            getErrors().put("fname", "Please fill First Name");
        } else {
            this.firstName = firstName;
        }
    }

    /**
     * @return the dob
     */
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        if (email.equals("") || email == null) {
            getErrors().put("email", "Please fill Email");
        }else if(!emailValidator(email)){
            getErrors().put("email", "Email address is not valid");
        }else {
            this.email = email;
        }
    }

    public Date getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(Date dob) {
        if (dob == null) {
            getErrors().put("dob", "Please fill Date of Birth");
        } else {
            this.dob = dob;
        }
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        
        if (password.equals("") || password == null) {
            getErrors().put("pwd", "Please fill Password");
            this.password ="";
            
        } else {
            this.password = password;
        }
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        if (phone.equals("") || phone == null) {
            getErrors().put("phone", "Please fill Phone");
        } else {
            this.phone = phone;
        }
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * @return the hobby
     */
    public String getHobby() {
        return hobby;
    }

    /**
     * @param hobby the hobby to set
     */
    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    /**
     * @return the game
     */
    public String getGame() {
        return game;
    }

    /**
     * @param game the game to set
     */
    public void setGame(String game) {
        this.game = game;
    }

    /**
     * @return the education
     */
    public String getEducation() {
        return education;
    }

    /**
     * @param education the education to set
     */
    public void setEducation(String education) {
        this.education = education;
    }

   

    public String getActCode() {
        return actCode;
    }

    public void setActCode(String actCode) {
        this.actCode = actCode;
    }

    public boolean emailValidator(String email) {

        Pattern p = Pattern.compile("[a-zA-Z]*[0-9]*@[a-zA-Z]*.[a-zA-Z]*");
        Matcher m = p.matcher(email);
        boolean b = m.matches();
        return b;
    }

    public Vector<Post> getPosts() {
        return posts;
    }

    public void setPosts(Vector<Post> posts) {
        this.posts = posts;
    }
    
}
