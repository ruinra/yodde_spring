package com.yodde.pictureModel;

import java.util.List;

public interface PictureDao {
	public int					getMaxPictureId();
	public int					insertPicture(PictureDto picture);
	public String				getFilePath(int pictureId);
	public List<PictureDto> 	select7Picture(int storeId);
	public List<PictureDto>		selectListPicture(int storeId);
}
