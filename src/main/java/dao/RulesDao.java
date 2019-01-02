package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.News;
import entity.Rules;

@Repository
public interface RulesDao {
	public void insertRules(Rules rules);
	public int getRulesCount();
	public List<Rules> getRulesAllBypage(@Param("start")int start,@Param("length")int length);
	public Rules getRulesDetailByid(@Param("rules_id")String rules_id);
	public void updateRules(Rules rules);
	public void deleteRules(@Param("rules_id")String rules_id);
	public List<Rules> findAllRules();
}
