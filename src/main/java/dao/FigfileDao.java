package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.Figfile;

@Repository
public interface FigfileDao {
	public void insertBatch(List<Figfile> figfiles);
	public List<Figfile> getListByid(@Param("FigClass_id")String figClass_id);
}
