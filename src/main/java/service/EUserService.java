package service;


import java.util.List;


import entity.EUser;
import entity.LayuiDataTable;

public interface EUserService {
	public void insertEUser(EUser eUser);
	public LayuiDataTable<EUser> getListBypage(int page, int limit,String user_id);
	public Boolean checkInu(String EUser_indentitynumber,String EUser_id);
	public EUser getDetailByid(String User_id);
	public void updateEUser(EUser eUser);
	public void deleteEUser(String User_id);
	public void insertByBatch(List<EUser> eUsers);
	public List<EUser> getList(String User_id);
}
