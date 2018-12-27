package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entity.EUser;
@Transactional
@Repository
public interface EUserDao {
	public void insertEuser(EUser eUser);
	public void updateEuser(EUser eUser);
	public void deleteEuser(@Param("EUser_id")String EUser_id);
	public List<EUser> getEuserBypage(@Param("start") int start,@Param("length")int length,@Param("user_id")String user_id);
	public int getcountBy(@Param("user_id")String user_id);
	public List<EUser> checkInum(@Param("EUser_indentitynumber")String EUser_indentitynumber,@Param("EUser_id")String EUser_id);
	public void insertByBatch(List<EUser> eUsers);
	public List<EUser> getDetail(@Param("Euser_id")String Euser_id);
	public List<EUser> getListBycreater(@Param("creater")String Creater);
	public void updatebatch(List<EUser> eUsers);
	public List<EUser> getList(@Param("User_id")String User_id);
}
