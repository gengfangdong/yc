package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.User_Figclass;

@Repository
public interface User_FigClassDao {
	public void insertUser_Fig(List<User_Figclass> user_Figclass);
	public int getCountByid(@Param("User_id")String User_id,@Param("FigClass_id")String FigClass_id);
	public List<String> getuserlist(@Param("User_id")String User_id,@Param("FigClass_id")String FigClass_id);
	public List<String> getUserByid(@Param("FigClass_id")String figClass_id);
}
