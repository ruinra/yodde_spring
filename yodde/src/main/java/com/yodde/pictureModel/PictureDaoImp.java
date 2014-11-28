package com.yodde.pictureModel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PictureDaoImp implements PictureDao {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
	
	@Override
	public int getMaxPictureId() {
		int value = 0;
		
		try{
			session=sqlSessionFactory.openSession();
			value=session.selectOne("getMaxPictureId");
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("getMaxPictureId Error");
		}finally{
			session.close();
		}
		
		return value;
	}

	@Override
	public int insertPicture(PictureDto picture) {
		int value=0;
		
		try{
			session=sqlSessionFactory.openSession();
			value=session.insert("insertPicture", picture);
			value=session.selectOne("getMaxPictureId");
			session.commit();			
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("insertPicture Error");
		}finally{
			session.close();
		}
		return value;
	}
	
	@Override
	public String getFilePath(int pictureId) {
		String filePath = null;
		
		try{
			session=sqlSessionFactory.openSession();
			filePath=session.selectOne("getFilePath", pictureId);
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("getFilePath Error");
		}finally{
			session.close();
		}
		
		return filePath;
	}

	@Override
	public List<PictureDto> select7Picture(int storeId) {
		List<PictureDto> pictureList = null;
		
		try{
			session=sqlSessionFactory.openSession();
			pictureList=session.selectList("select7Picture", storeId);
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("select7Picture Error");
		}finally{
			session.close();
		}
		
		return pictureList;
	}

	@Override
	public List<PictureDto> selectListPicture(int storeId) {
		List<PictureDto> pictureList = null;
		
		try{
			session=sqlSessionFactory.openSession();
			pictureList=session.selectList("selectListPicture", storeId);
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("selectListPicture Error");
		}finally{
			session.close();
		}
		
		return pictureList;
	}
	
}
