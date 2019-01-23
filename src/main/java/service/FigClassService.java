package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.EUser;
import entity.FigClass;
import entity.FigClassVo;
import entity.FigClassshowVo;
import entity.FigUser;
import entity.Figfile;
import entity.IUser;
import entity.LayuiDataTable;
import entity.MemProjectVo;

public interface FigClassService {
	public void insertFig(FigClass figClass,List<Figfile> figfiles);
	public FigClass getDetailByid(String FigClass_id);
	public FigClassVo getDetail(String FigClass_id);
	public LayuiDataTable<FigClassshowVo> getListBypage(String isbm,String status,String caogery,int page,int limit,String user_id);
	public int importUser(List<EUser> eUsers,String figClass_id,String User_id);
	public void applyFig(FigUser figUser);
	public void deleteFigClass(String figclass_id, String user_id);
	public String getByfilename(String filename);
	public void updateReview(String figclass_id, String review_result, String updater, String updatetime,String FigClass_remark);
	public List<EUser> getListUserByid(String user_id, String figclass_id);
	public LayuiDataTable<MemProjectVo> getMemProjectByuser(String caogery,String status,String user_id,int page,int limit);
	public void deleteFig(String figclass_id, IUser iuser);
	public int getCountByid(String FigClass_id);
	public void updateFig(FigClass figClass);
	public void startScheduledFig();
	public int getlaveNum(String figClass_id);
	public void cancelFiu(String fiu_id);
	public LayuiDataTable<FigUser> getPage(int start,int limit,String figClass_id);
	public List<FigUser> getBynoPage(String figClass_id);
	public void updateStatus(FigClass figClass);
	public FigUser getfiguser(String figclass_id,String user_id);
	public LayuiDataTable<FigClassshowVo> getListBypage1(String string,
			String status, String caogery, int page, int limit, String string2,
			String classname, String starttime, String endtime);
}
