/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author imdadareeph
 */
public class Follow {
    private int followId;
    private int userId;
    private int followerId;
    private User user;
    private User follower;
    private UserTable utable = new UserTable();
    public int getFollowId() {
        return followId;
    }

    public void setFollowId(int followId) {
        this.followId = followId;
    }

    public int getFollowerId() {
        return followerId;
    }

    public void setFollowerId(int followerId) {
        setFollower(utable.getUserById(followerId));
        this.followerId = followerId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        setUser(utable.getUserById(userId));
        this.userId = userId;
    }

    public User getFollower() {
        return follower;
    }

    private void setFollower(User follower) {
        this.follower = follower;
    }

    public User getUser() {
        return user;
    }

    private void setUser(User user) {
        this.user = user;
    }
    

}
