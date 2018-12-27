package dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import entity.User_Constom;

@Repository
public interface User_ConstomDao {
	public void insertBatch(List<User_Constom> user_ConstomList);
	
}
