package com.yodde.relationModel;

public class RelationDto {
   private String follower;
   private String followee;
   private String email;
   private String nickName;
   private String profilePic;   
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getNickName() {
      return nickName;
   }
   public void setNickName(String nickName) {
      this.nickName = nickName;
   }
   public String getProfilePic() {
      return profilePic;
   }
   public void setProfilePic(String profilePic) {
      this.profilePic = profilePic;
   }
   public String getFollower() {
      return follower;
   }
   public void setFollower(String follower) {
      this.follower = follower;
   }
   public String getFollowee() {
      return followee;
   }
   public void setFollowee(String followee) {
      this.followee = followee;
   }
}