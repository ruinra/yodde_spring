package com.yodde.storeModel;

import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class StoreDto {
	private int 	storeId;
	private String 	storeName;
	private String 	address;
	private String 	streetAddr;
	private Date 	openDate;
	private String 	serviceTime;
	private String 	mapId;
	private double	latitude;
	private double	longitude;
	private int 	status;
	private String	phoneNum;
	private String	homepage;
	private double	rate;
	private String	category1;
	private String	category2;
	private String	category3;
	private String profilePic;
	
	private MultipartFile uploadfile;
	
	
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStreetAddr() {
		return streetAddr;
	}
	public void setStreetAddr(String streetAddr) {
		this.streetAddr = streetAddr;
	}
	public Date getOpenDate() {
		return openDate;
	}
	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}
	public String getServiceTime() {
		return serviceTime;
	}
	public void setServiceTime(String serviceTime) {
		this.serviceTime = serviceTime;
	}
	public String getMapId() {
		return mapId;
	}
	public void setMapId(String mapId) {
		this.mapId = mapId;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
		
}
