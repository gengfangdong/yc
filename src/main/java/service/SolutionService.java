package service;

import entity.DatatablesViewPage;
import entity.Solution;

public interface SolutionService {
	public void insertSolution(Solution solution);
	//DataTables 
	public DatatablesViewPage<Solution> GetlistPage(int start,int length);
	//根据id获取解决详情
	public Solution getSolutionDetailByid(String solution_id);
	//修改解决
	public void updateSolution(Solution solution);
	//删除解决
	public void deleteSolution(String solution_id);
}
