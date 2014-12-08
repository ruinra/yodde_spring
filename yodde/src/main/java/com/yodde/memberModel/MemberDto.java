package com.yodde.memberModel;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class MemberDto {
	private String email;
	private String password;
	private String zipcode;
	private String nickName;
	private String profilePic;
	private int memberLv;
	
	private MultipartFile uploadfile;
	
	private int verificationCode;
	
	public int getVerificationCode() {
		return verificationCode;
	}
	public void setVerificationCode(int code) {
		this.verificationCode = code;
	}
	
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
	public int getMemberLv() {
		return memberLv;
	}
	public void setMemberLv(int memberLv) {
		this.memberLv = memberLv;
	}	
	
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
}
