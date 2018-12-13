package service;

import entity.DatatablesViewPage;
import entity.About;

public interface AboutService {
	public void insertAbout(About about);
	//DataTables 
	public DatatablesViewPage<About> GetlistPage(int start,int length);
	//根据id获取关于我们详情
	public About getAboutDetailByid(String about_id);
	//修改关于我们
	public void updateAbout(About about);
	//删除关于我们
	public void deleteAbout(String about_id);
}
