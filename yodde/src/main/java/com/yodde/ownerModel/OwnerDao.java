package com.yodde.ownerModel;

public interface OwnerDao {
	public int ownerJoin(OwnerDto ownerDto);
	public int ownerJoinAuth(OwnerDto ownerDto);
	public OwnerDto selectOwner(String id);
}
