package service;

import java.util.List;


import entity.ApplyUnit;

public interface ApplyUnitService {
	public void insertApplyUnit(ApplyUnit Applyunit);
	public ApplyUnit getApplyUnitDetail(String Applyunit_id);
	public void update(ApplyUnit applyUnit);
	public void deleteapplyunit(String applyunit_id);
}
