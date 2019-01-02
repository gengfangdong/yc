package service;

import java.util.List;



import entity.ConstomVo;
import entity.Constomfile;
import entity.EUser;
import entity.Free_constom;
import entity.LayuiDataTable;

public interface ConstomService {
	public void insertConstom(Free_constom free_constom,List<Constomfile> constomfiles);
	public void updateReview(String Constom_id,String status,String updater,String updatetime);
	public Free_constom getDetailByid(String constom_id);
	public int ImportUser(List<EUser> eUsers,String Constom_id,String user_id);
	public LayuiDataTable<Free_constom> getListBypage(String status,String caogery,int page,int limit,String user_id);
	public ConstomVo getShow(String constom_id);
	public void deleteConstom(String Constom_id,String User_id);
	public void updateConstom(Free_constom free_constom);
	public String getByfilename(String filename);
	public List<EUser> getListUserByid(String user_id,String constom_id);
	
}
