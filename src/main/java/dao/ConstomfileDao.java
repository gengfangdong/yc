package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entity.Constomfile;

@Repository
@Transactional
public interface ConstomfileDao {
	public void insertBatch(List<Constomfile> constomfiles);
	public List<Constomfile> getConstomFilesByid(@Param("Constom_id")String constom_id);
	public void deleteConstom(@Param("Constom_id")String constom_id);
	public List<String> getByfilename(@Param("filename")String filename);
}
