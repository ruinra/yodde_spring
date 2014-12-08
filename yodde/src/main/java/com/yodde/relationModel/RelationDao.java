package com.yodde.relationModel;

import java.util.List;

import com.yodde.memberModel.MemberDto;
import com.yodde.storeModel.StoreDto;

public interface RelationDao {
	public int checkFollowStore(String store, String email);
	public int unfollowStore(String store, String email);
	public int followStore(String store, String email);
	
	public int checkFollowMember(String follower, String following);
	public int unfollowMember(String follower, String following);
	public int followMember(String follower, String following);
	
	public List<StoreDto> selectFollowingStore(String email);
	public List<MemberDto> selectFollowingMember(String email);
	public List<RelationDto> selectFollowerMember(String email);
	
	public int getfollowingStoreCnt(String email);
	public int getFollowingCnt(String email);
	public int getFollowerCnt(String email);
}
