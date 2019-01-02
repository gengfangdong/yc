package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.User_Constom;

@Repository
public interface User_ConstomDao {
	public void insertBatch(List<User_Constom> user_ConstomList);
	public List<String> getListUserByid(@Param("user_id")String user_id,@Param("constom_id")String constom_id);
	
}
