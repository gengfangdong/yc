package service;

import entity.DatatablesViewPage;
import entity.Rules;

public interface RulesService {
	public void insertRules(Rules rules);
	//DataTables 
	public DatatablesViewPage<Rules> GetlistPage(int start,int length);
	//根据id获取新闻详情
	public Rules getRulesDetailByid(String rules_id);
	//修改新闻
	public void updateRules(Rules rules);
	//删除新闻
	public void deleteRules(String rules_id);
	//查询所有通知
	public DatatablesViewPage<Rules> findAllRules();
}
