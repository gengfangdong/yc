package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.RotationPic;

@Repository
public interface RotationPicDao {
	public void insertRotationPic(RotationPic RotationPic);
	public int getRotationPicCount();
	public List<RotationPic> getRotationPicAllBypage(@Param("start")int start,@Param("length")int length);
	public RotationPic getRotationPicDetailByid(@Param("RotationPic_id")String RotationPic_id);
	public void updateRotationPic(RotationPic RotationPic);
	public void deleteRotationPic(@Param("RotationPic_id")String RotationPic_id);
	public List<RotationPic> findAllRotation();
	public int findAllRotationcount();
}
