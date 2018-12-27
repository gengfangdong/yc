package service;

import entity.DatatablesViewPage;
import entity.Culture;

public interface CultureService {
	public void insertCulture(Culture culture);
	//DataTables 
	public DatatablesViewPage<Culture> GetlistPage(int start,int length);
	//根据id获取培养详情
	public Culture getCultureDetailByid(String culture_id);
	//修改培养
	public void updateCulture(Culture culture);
	//删除培养
	public void deleteCulture(String culture_id);
}
