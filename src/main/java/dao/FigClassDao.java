package dao;

import org.springframework.stereotype.Repository;

import entity.FigClass;

@Repository
public interface FigClassDao {
	public void insertFig(FigClass figClass);
}
