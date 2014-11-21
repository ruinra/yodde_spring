package com.yodde.storeModel;

public interface StoreDao {
	public int isExistStore(StoreDto store);
	public StoreDto selectStoreByStoreId(int storeId);
	public int insertStore(StoreDto store);
}
