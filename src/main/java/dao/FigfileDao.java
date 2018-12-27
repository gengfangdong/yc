package dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import entity.Figfile;

@Repository
public interface FigfileDao {
	public void insertBatch(List<Figfile> figfiles);
}
