package service;

import java.util.List;

import entity.EUser;
import entity.FigClass;
import entity.FigClassVo;
import entity.FigClassshowVo;
import entity.Figfile;
import entity.LayuiDataTable;

public interface FigClassService {
	public void insertFig(FigClass figClass,List<Figfile> figfiles);
	public FigClass getDetailByid(String FigClass_id);
	public FigClassVo getDetail(String FigClass_id);
	public LayuiDataTable<FigClassshowVo> getListBypage(String status,String caogery,int page,int limit,String user_id);
	public int importUser(List<EUser> eUsers,String figClass_id,String User_id);
}
