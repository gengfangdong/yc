package service;


import entity.ApplyShowVo;
import entity.DatatablesViewPage;

import java.util.List;

import entity.Apply;

public interface ApplyService {
	public void insertApply(Apply Apply);
	//DataTables 
	public DatatablesViewPage<Apply> GetlistPage(int start,int length);
	
	public Apply getApplyDetailByid(String Apply_id);
	
	public void updateApply(Apply Apply);
	
	public void deleteApply(String Apply_id);
	public DatatablesViewPage<ApplyShowVo> GetlistApplyShow(int start,
			int length);
	
	public void deleteapply(String Apply_id);
	public void updatestatus(String status,String Apply_id);
	public List<Apply> getProjectStatus(String user_id, String project_id);
	
}
