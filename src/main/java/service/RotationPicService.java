package service;

import entity.DatatablesViewPage;
import entity.RotationPic;

public interface RotationPicService {
	public void insertRotationPic(RotationPic RotationPic);
	//DataTables 
	public DatatablesViewPage<RotationPic> GetlistPage(int start,int length);
	//根据id获取轮播图片详情
	public RotationPic getRotationPicDetailByid(String RotationPic_id);
	//修改轮播图片
	public void updateRotationPic(RotationPic RotationPic);
	//删除轮播图片
	public void deleteRotationPic(String RotationPic_id);
	public DatatablesViewPage<RotationPic> findAllRotation();
}
