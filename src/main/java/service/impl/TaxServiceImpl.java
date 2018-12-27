package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.TaxDao;
import service.TaxService;
import entity.DatatablesViewPage;
import entity.Tax;

/**
 * @author my
 *
 */
@Service
public class TaxServiceImpl implements TaxService{

	@Autowired
	private TaxDao taxDao;
	public void insertTax(Tax tax) {
		// TODO Auto-generated method stub
		taxDao.insertTax(tax);
	}
	public DatatablesViewPage<Tax> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<Tax> datatablesViewPage = new DatatablesViewPage<Tax>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<Tax> taxList = new ArrayList<Tax>();
		
		taxList = taxDao.getTaxAllBypage(start, start+length);
		
		recordsTotal = taxDao.getTaxCount();
		recordsFiltered = taxDao.getTaxCount();
		
		datatablesViewPage.setData(taxList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public Tax getTaxDetailByid(String tax_id) {
		// TODO Auto-generated method stub
		
		return taxDao.getTaxDetailByid(tax_id);
	}
	public void updateTax(Tax tax) {
		// TODO Auto-generated method stub
		taxDao.updateTax(tax);
	}
	public void deleteTax(String tax_id) {
		// TODO Auto-generated method stub
		taxDao.deleteTax(tax_id);
	}
	
	
	
}
