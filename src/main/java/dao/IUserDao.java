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
}
