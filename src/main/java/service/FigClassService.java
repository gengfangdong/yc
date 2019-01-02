package service;

import java.util.List;

import entity.EUser;
import entity.FigClass;
import entity.FigClassVo;
import entity.FigClassshowVo;
import entity.Figfile;
import entity.LayuiDataTable;
import entity.MemProjectVo;

public interface FigClassService {
	public void insertFig(FigClass figClass,List<Figfile> figfiles);
	public FigClass getDetailByid(String FigClass_id);
	public FigClassVo getDetail(String FigClass_id);
	public LayuiDataTable<FigClassshowVo> getListBypage(String status,String caogery,int page,int limit,String user_id);
	public int importUser(List<EUser> eUsers,String figClass_id,String User_id);
	public void deleteFigClass(String figclass_id, String user_id);
	public String getByfilename(String filename);
	public void updateReview(String figclass_id, String review_result, String updater, String updatetime);
	public List<EUser> getListUserByid(String user_id, String figclass_id);
	public LayuiDataTable<MemProjectVo> getMemProjectByuser(String caogery,String status,String user_id,int page,int limit);
}
