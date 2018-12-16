package service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;














import dao.ApplyDao;
import dao.ProjectDao;
import service.ApplyService;
import service.ProjectService;
import entity.About;
import entity.Apply;
import entity.ApplyShowVo;
import entity.DatatablesViewPage;
import entity.Project;

/**
 * @author my
 *
 */
@Service
public class ApplyServiceImpl implements ApplyService{
	@Autowired
	private ApplyDao applyDao;

	public void insertApply(Apply Apply) {
		// TODO Auto-generated method stub
		applyDao.insertApply(Apply);
	}

	public DatatablesViewPage<Apply> GetlistPage(int start, int length) {
		// TODO Auto-generated method stub
		return null;
	}

	public Apply getApplyDetailByid(String Apply_id) {
		// TODO Auto-generated method stub
		
		return applyDao.getApplyDetailByid(Apply_id);
	}

	public void updateApply(Apply Apply) {
		// TODO Auto-generated method stub
		applyDao.updateapply(Apply);
	}

	public void deleteApply(String Apply_id) {
		// TODO Auto-generated method stub
		
	}
	public DatatablesViewPage<ApplyShowVo> GetlistApplyShow(int start, int length) {
		// TODO Auto-generated method stub
		DatatablesViewPage<ApplyShowVo> datatablesViewPage = new DatatablesViewPage<ApplyShowVo>();
				
		int recordsTotal = 0;
		int recordsFiltered = 0;
		List<Map<String,Object>> maps = new ArrayList<Map<String,Object>>();
		List<ApplyShowVo> applyShowVos = new ArrayList<ApplyShowVo>();		
		//AboutList = AboutDao.getAboutAllBypage(start, start+length);
		maps = applyDao.getApplyshow(start, start+length);		
		recordsTotal = applyDao.getApplyshowcount();
		recordsFiltered = applyDao.getApplyshowcount();
		if(maps!=null&&maps.size()>0){
			for (Map<String, Object> map : maps) {
				ApplyShowVo applyShowVo = new ApplyShowVo();
				applyShowVo.setApplyshow_caogery((String) map.get("CAOGERY"));
				applyShowVo.setApplyshow_date((String) map.get("APPLYDATE"));
				applyShowVo.setApplyshow_id((String) map.get("APPLYID"));
				applyShowVo.setApplyshow_project((String) map.get("PROJECT_NAME"));
				applyShowVo.setApplyshow_user((String) map.get("APPLYNAME"));
				applyShowVos.add(applyShowVo);
			}
		}
		datatablesViewPage.setData(applyShowVos);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		datatablesViewPage.setRecordsTotal(recordsTotal);			
		return datatablesViewPage;
	}

	public void deleteapply(String Apply_id) {
		// TODO Auto-generated method stub
		applyDao.deleteapply(Apply_id);
	}

	public void updatestatus(String status, String Apply_id) {
		// TODO Auto-generated method stub
		applyDao.updatestatus(status, Apply_id);
	}


	
	
}