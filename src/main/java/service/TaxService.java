package service;

import entity.DatatablesViewPage;
import entity.Tax;

public interface TaxService {
	public void insertTax(Tax tax);
	//DataTables 
	public DatatablesViewPage<Tax> GetlistPage(int start,int length);
	//根据id获取领税详情
	public Tax getTaxDetailByid(String tax_id);
	//修改领税
	public void updateTax(Tax tax);
	//删除领税
	public void deleteTax(String tax_id);
}
