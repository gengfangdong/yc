package service;

import entity.DatatablesViewPage;
import entity.Expert;

public interface ExpertService {
	public void insertExpert(Expert expert);
	//DataTables 
	public DatatablesViewPage<Expert> GetlistPage(int start,int length);
	//根据id获取专家详情
	public Expert getExpertDetailByid(String expert_id);
	//修改专家
	public void updateExpert(Expert expert);
	//删除专家
	public void deleteExpert(String expert_id);
	//查询所有专家
	public DatatablesViewPage<Expert> findAllExpert();
}
