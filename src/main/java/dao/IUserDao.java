package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.IUser;

@Repository
public interface IUserDao {
	public void insertIUser(IUser IUser);
	public List<IUser> checkloginname(@Param("user_loginname")String user_loginname);
	public List<IUser> login(IUser user);
	public List<IUser> getDetailByid(@Param("User_id")String User_id);
	public void updateIUser(IUser iUser);
	public void deleteIUser(@Param("User_id")String User_id);
	public List<IUser> getListByPage(@Param("start")int start,@Param("length")int length);
	public int getCount();
	public List<IUser> checkLoginNameAndUser_id(@Param("user_loginname")String user_loginname,@Param("user_id")String User_id);
}
