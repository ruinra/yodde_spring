package com.yodde.storeModel;

import org.springframework.stereotype.Component;

@Component
public class StoreInfoDto {
	private int storeId;      
	private int reservation;
	private int delivery;
	private int takeOut;
	private int creditCard;
	private int parking;
	private int group1;
	private int toilet;
	private int wifi;
	private int tv;
	private int seating;
	private int kids;
	private int driveThrough;
	private int total;

	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	public int getReservation() {
		return reservation;
	}
	public void setReservation(int reservation) {
		this.reservation = reservation;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public int getTakeOut() {
		return takeOut;
	}
	public void setTakeOut(int takeOut) {
		this.takeOut = takeOut;
	}
	public int getCreditCard() {
		return creditCard;
	}
	public void setCreditCard(int creditCard) {
		this.creditCard = creditCard;
	}
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	public int getGroup1() {
		return group1;
	}
	public void setGroup1(int group1) {
		this.group1 = group1;
	}
	public int getToilet() {
		return toilet;
	}
	public void setToilet(int toilet) {
		this.toilet = toilet;
	}
	public int getWifi() {
		return wifi;
	}
	public void setWifi(int wifi) {
		this.wifi = wifi;
	}
	public int getTv() {
		return tv;
	}
	public void setTv(int tv) {
		this.tv = tv;
	}
	public int getSeating() {
		return seating;
	}
	public void setSeating(int seating) {
		this.seating = seating;
	}
	public int getKids() {
		return kids;
	}
	public void setKids(int kids) {
		this.kids = kids;
	}
	public int getDriveThrough() {
		return driveThrough;
	}
	public void setDriveThrough(int driveThrough) {
		this.driveThrough = driveThrough;
	}
}
