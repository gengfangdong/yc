package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SolutionDao;
import service.SolutionService;
import entity.DatatablesViewPage;
import entity.Solution;

/**
 * @author my
 *
 */
@Service
public class SolutionServiceImpl implements SolutionService{

	@Autowired
	private SolutionDao solutionDao;
	public void insertSolution(Solution solution) {
		// TODO Auto-generated method stub
		solutionDao.insertSolution(solution);
	}
	public DatatablesViewPage<Solution> GetlistPage(int start,int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<Solution> datatablesViewPage = new DatatablesViewPage<Solution>();
		
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<Solution> solutionList = new ArrayList<Solution>();
		
		solutionList = solutionDao.getSolutionAllBypage(start, start+length);
		
		recordsTotal = solutionDao.getSolutionCount();
		recordsFiltered = solutionDao.getSolutionCount();
		
		datatablesViewPage.setData(solutionList);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		
		return datatablesViewPage;
	}
	public Solution getSolutionDetailByid(String solution_id) {
		// TODO Auto-generated method stub
		
		return solutionDao.getSolutionDetailByid(solution_id);
	}
	public void updateSolution(Solution solution) {
		// TODO Auto-generated method stub
		solutionDao.updateSolution(solution);
	}
	public void deleteSolution(String solution_id) {
		// TODO Auto-generated method stub
		solutionDao.deleteSolution(solution_id);
	}
	
	
	
}
