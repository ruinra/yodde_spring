package com.yodde.pictureModel;

public interface PictureDao {
	public int		getMaxPictureId();
	public int		insertPicture(PictureDto picture);
	public String	getFilePath(int pictureId);
}
