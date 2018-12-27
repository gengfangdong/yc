package service;

import entity.DatatablesViewPage;
import entity.Teaching;

public interface TeachingService {
	public void insertTeaching(Teaching teaching);
	//DataTables 
	public DatatablesViewPage<Teaching> GetlistPage(int start,int length);
	//根据id获取教材详情
	public Teaching getTeachingDetailByid(String teaching_id);
	//修改教材
	public void updateTeaching(Teaching teaching);
	//删除教材
	public void deleteTeaching(String teaching_id);
}
