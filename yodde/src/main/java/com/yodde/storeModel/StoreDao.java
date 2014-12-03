package com.yodde.storeModel;

import java.util.List;

public interface StoreDao {
	public int isExistStore(StoreDto store);
	public StoreDto selectStoreByStoreId(int storeId);
	public int insertStore(StoreDto store);
	public int insertStoreInfo(int storeId);
	public int updateStoreFile(StoreDto storeDto);
	public StoreInfoDto selectStoreInfo(int storeId);
	public int updateStoreInfo(StoreInfoDto storeInfo);
	public int updateStore(StoreDto storeDto);
	public List<StoreDto> selectRecentReviewName(String email);
}
