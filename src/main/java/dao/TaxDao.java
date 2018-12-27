package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.Tax;

@Repository
public interface TaxDao {
	public void insertTax(Tax tax);
	public int getTaxCount();
	public List<Tax> getTaxAllBypage(@Param("start")int start,@Param("length")int length);
	public Tax getTaxDetailByid(@Param("tax_id")String tax_id);
	public void updateTax(Tax tax);
	public void deleteTax(@Param("tax_id")String tax_id);
}
