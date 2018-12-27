package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.Solution;

@Repository
public interface SolutionDao {
	public void insertSolution(Solution solution);
	public int getSolutionCount();
	public List<Solution> getSolutionAllBypage(@Param("start")int start,@Param("length")int length);
	public Solution getSolutionDetailByid(@Param("solution_id")String solution_id);
	public void updateSolution(Solution solution);
	public void deleteSolution(@Param("solution_id")String solution_id);
}
