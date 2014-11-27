package com.yodde.relationModel;

public interface RelationDao {
	public int checkFollowStore(String store, String email);
	public int unfollowStore(String store, String email);
	public int followStore(String store, String email);
}
