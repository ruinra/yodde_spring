package com.yodde.memberModel;

import org.springframework.stereotype.Component;

@Component
public class MemberDto {
	private String email;
	private String password;
	private String zipcode;
	private String nickname;
	private String profilePic;
	private int memberLv;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getNickName() {
		return nickname;
	}
	public void setNickName(String nickName) {
		this.nickname = nickName;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	public int getMemberLv() {
		return memberLv;
	}
	public void setMemberLv(int memberLv) {
		this.memberLv = memberLv;
	}	
}
