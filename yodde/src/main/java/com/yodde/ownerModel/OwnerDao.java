package com.yodde.ownerModel;

import com.yodde.storeModel.StoreDto;
import com.yodde.storeModel.StoreInfoDto;

public interface OwnerDao {
	public int ownerJoin(OwnerDto ownerDto);
	public int ownerJoinAuth(OwnerDto ownerDto);
	public OwnerDto selectOwner(String id);
	public int updateOwnerFile(OwnerDto ownerDto);
	public int updateOwner(OwnerDto ownerDto);
	public int  deleteOwner(OwnerDto ownerDto);
	
}
