package service.impl;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ScheduledfileDao;
import dao.ScheduledshiftDao;
import dao.SsuserDao;
import entity.DatatablesViewPage;
import entity.EUser;
import entity.LayuiDataTable;
import entity.ScheduledShiftShow;
import entity.Scheduledfile;
import entity.Scheduledshift;
import entity.ScheduledshiftVo;
import entity.Ssuser;
import service.ScheduledshiftService;
import sun.print.resources.serviceui;
import util.StringUtil;
@Service
public class ScheduledshiftServiceImpl implements ScheduledshiftService{
	
	@Autowired
	private ScheduledshiftDao scheduledshiftDao;
	
	@Autowired
	private SsuserDao ssuserDao;
	@Autowired
	private ScheduledfileDao scheduledfileDao;

	public void insertScheduledshift(Scheduledshift scheduledshift) {
		// TODO Auto-generated method stub
		scheduledshiftDao.insertScheduledshift(scheduledshift);
		List<Scheduledfile> scheduledfiles = new ArrayList<Scheduledfile>();
		scheduledfiles = scheduledshift.getScheduleds();
		for (Scheduledfile scheduledfile : scheduledfiles) {
			scheduledfileDao.insertScheduledfile(scheduledfile);
		}
	}

	public void updateSch(Scheduledshift scheduledshift) {
		// TODO Auto-generated method stub
		
		scheduledfileDao.deleteScheduled(scheduledshift.getScheduled_id());
		List<Scheduledfile> scheduledfiles = new ArrayList<Scheduledfile>();
		scheduledfiles = scheduledshift.getScheduleds();
		for (Scheduledfile scheduledfile : scheduledfiles) {
			scheduledfileDao.insertScheduledfile(scheduledfile);
		}
		scheduledshiftDao.updateSch(scheduledshift);
		
		
	}

	public void deleteSch(String Scheduled_id) {
		// TODO Auto-generated method stub
		
		scheduledfileDao.deleteScheduled(Scheduled_id);
		scheduledshiftDao.deleteSch(Scheduled_id);
	}

	public Scheduledshift getDetailByid(String Scheduled_id) {
		// TODO Auto-generated method stub
		List<Scheduledshift> scheduledshiftList = new ArrayList<Scheduledshift>();
		scheduledshiftList = scheduledshiftDao.getDetailByid(Scheduled_id);
		
		if(scheduledshiftList != null &&scheduledshiftList.size()>0){
			Scheduledshift scheduledshift = new Scheduledshift();
			scheduledshift = scheduledshiftList.get(0);
			List<Scheduledfile> scheduledfiles = new ArrayList<Scheduledfile>();
			scheduledfiles = scheduledfileDao.getbyScheduledid(scheduledshift.getScheduled_id());
			scheduledshift.setScheduleds(scheduledfiles);
			return scheduledshift;
		}
		
		return null;
	}

	public DatatablesViewPage<Scheduledshift> getListBystatus(
			String Scheduled_status,int start,int length) {
		// TODO Auto-generated method stub
		
		DatatablesViewPage<Scheduledshift> datatablesViewPage = new DatatablesViewPage<Scheduledshift>();
		
		List<Scheduledshift> scheduledshifts = new ArrayList<Scheduledshift>();
		int recordsTotal = 0;
		int recordsFiltered = 0;
		
		scheduledshifts = scheduledshiftDao.getListBystatus(Scheduled_status,start,start+length);
		
		recordsTotal = scheduledshiftDao.getcountBystatus(Scheduled_status);
		recordsFiltered = scheduledshiftDao.getcountBystatus(Scheduled_status);
		
		datatablesViewPage.setData(scheduledshifts);
		datatablesViewPage.setRecordsTotal(recordsTotal);
		datatablesViewPage.setRecordsFiltered(recordsFiltered);
		return datatablesViewPage;
	}
	
	public String getByScheduledfile(String filename){
		List<String> strings = new ArrayList<String>();
		strings = scheduledfileDao.getByfilename(filename);
		return strings.get(0);
	}

	public void startScheduled() {
		// TODO Auto-generated method stub
		scheduledshiftDao.startScheduled();
	}

	public LayuiDataTable<ScheduledShiftShow> getScByPage(int start, int limit,String user_id,String scstatus,String memstatus) {
		// TODO Auto-generated method stub
		LayuiDataTable<ScheduledShiftShow> sLayuiDataTable = new LayuiDataTable<ScheduledShiftShow>();
		List<ScheduledShiftShow> scheduledShiftShows = new ArrayList<ScheduledShiftShow>();
		List<Map<String,Object>> scheduledMap = new ArrayList<Map<String, Object>>();
		scheduledMap = scheduledshiftDao.getLastNumber((start-1)*limit, start*limit,user_id,scstatus,memstatus);
		List<Ssuser> ssusers = new ArrayList<Ssuser>();
		Map<String,Object> ssuserMap = new HashMap<String, Object>();
		ssusers = ssuserDao.getSsuserByUserId(user_id);
		if(ssusers!=null&&ssusers.size()>0){
			for (Ssuser ssuser : ssusers) {
				ssuserMap.put(ssuser.getSsu_ssid(), ssuser);
			}
		}
		int count = 0;
		count = scheduledshiftDao.getCountLastNumber(user_id,scstatus,memstatus);
		if(scheduledMap!=null&&scheduledMap.size()>0){
			for (Map<String, Object> map : scheduledMap) {
				//构建对象
				Scheduledshift scheduledshift = new Scheduledshift();
				ScheduledShiftShow scheduledShiftShow = new ScheduledShiftShow();
				String num="0";
				if(map.get("PNUM")!=null&&!"".equals(map.get("PNUM"))){
					num = ((BigDecimal)map.get("PNUM")).toString();
				}
				scheduledshift.setScheduled_id((String)map.get("SCHEDULED_ID"));
				scheduledshift.setScheduled_class_start((String)map.get("SCHEDULED_CLASS_START"));
				scheduledshift.setScheduled_class_end((String)map.get("SCHEDULED_CLASS_END"));
				scheduledshift.setScheduled_start((String)map.get("SCHEDULED_START"));
				scheduledshift.setScheduled_end((String)map.get("SCHEDULED_END"));
				scheduledshift.setScheduled_name((String)map.get("SCHEDULED_NAME"));
				scheduledshift.setScheduled_address((String)map.get("SCHEDULED_ADDRESS"));
				scheduledshift.setScheduled_class_pnumber((String)map.get("SCHEDULED_CLASS_PNUMBER"));
				String createtime = (String)map.get("CREATETIME");
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				try {
					scheduledshift.setCreatetime(simpleDateFormat.format(simpleDateFormat.parse(createtime)));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				scheduledshift.setScheduled_status((String)map.get("SCHEDULED_STATUS"));
				scheduledShiftShow.setDataNumber(""+StringUtil.getDataSub(scheduledshift.getScheduled_class_start(), scheduledshift.getScheduled_class_end()));
				scheduledShiftShow.setScheduledshift(scheduledshift);
				scheduledShiftShow.setNumber(num);
				String project_id = (String)map.get("SCHEDULED_ID");
				if(ssuserMap.get(project_id)!=null){
					String create_status = "";
					Ssuser ssuser = (Ssuser) ssuserMap.get(project_id);
					create_status = ssuser.getSsu_status();
					scheduledShiftShow.setCreate_status(create_status);
					scheduledShiftShow.setSuuid(ssuser.getSsu_id());
				}
				else
					scheduledShiftShow.setCreate_status("");
				scheduledShiftShows.add(scheduledShiftShow);
				
			}
			
			
		}
		sLayuiDataTable.setData(scheduledShiftShows);
		sLayuiDataTable.setCount(count);
		return sLayuiDataTable;
	}

	public LayuiDataTable<ScheduledShiftShow> getAdminScByPage(int start, int limit, String status) {
		// TODO Auto-generated method stub
		LayuiDataTable<ScheduledShiftShow> sLayuiDataTable = new LayuiDataTable<ScheduledShiftShow>();
		List<ScheduledShiftShow> scheduledShiftShows = new ArrayList<ScheduledShiftShow>();
		List<Map<String,Object>> scheduledMap = new ArrayList<Map<String, Object>>();
		scheduledMap = scheduledshiftDao.getAdminLastNumber((start-1)*limit, start*limit,status);
		int count = 0;
		count = scheduledshiftDao.getAdminCountLastNumber(status);
		if(scheduledMap!=null&&scheduledMap.size()>0){
			for (Map<String, Object> map : scheduledMap) {
				//构建对象
				Scheduledshift scheduledshift = new Scheduledshift();
				ScheduledShiftShow scheduledShiftShow = new ScheduledShiftShow();
				String num="0";
				if(map.get("PNUM")!=null&&!"".equals(map.get("PNUM"))){
					num = ((BigDecimal)map.get("PNUM")).toString();
				}
				scheduledshift.setScheduled_id((String)map.get("SCHEDULED_ID"));
				scheduledshift.setScheduled_class_start((String)map.get("SCHEDULED_CLASS_START"));
				scheduledshift.setScheduled_class_end((String)map.get("SCHEDULED_CLASS_END"));
				scheduledshift.setScheduled_start((String)map.get("SCHEDULED_START"));
				scheduledshift.setScheduled_end((String)map.get("SCHEDULED_END"));
				scheduledshift.setScheduled_name((String)map.get("SCHEDULED_NAME"));
				scheduledshift.setScheduled_address((String)map.get("SCHEDULED_ADDRESS"));
				scheduledshift.setScheduled_class_pnumber((String)map.get("SCHEDULED_CLASS_PNUMBER"));
				
				
				String createtime = (String)map.get("CREATETIME");
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				try {
					scheduledshift.setCreatetime(simpleDateFormat.format(simpleDateFormat.parse(createtime)));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				scheduledshift.setScheduled_status((String)map.get("SCHEDULED_STATUS"));
				
				scheduledShiftShow.setScheduledshift(scheduledshift);
				scheduledShiftShow.setDataNumber(""+StringUtil.getDataSub(scheduledshift.getScheduled_class_start(), scheduledshift.getScheduled_class_end()));
				scheduledShiftShow.setNumber(num);
				scheduledShiftShows.add(scheduledShiftShow);				
			}	
			
		}
		sLayuiDataTable.setData(scheduledShiftShows);
		sLayuiDataTable.setCount(count);
		return sLayuiDataTable;
	}

	public ScheduledshiftVo trantoFromStoV(Scheduledshift scheduledshift) {
		ScheduledshiftVo scheduledshiftVos = new ScheduledshiftVo();
		ScheduledshiftVo scheduledshiftVo = new ScheduledshiftVo();
		scheduledshiftVo.setDatanumber("" + StringUtil.getDataSub(scheduledshift.getScheduled_class_start(),
				scheduledshift.getScheduled_class_end()));
		scheduledshiftVo.setScheduled_class_pnumber(scheduledshift.getScheduled_class_pnumber());
		scheduledshiftVo.setScheduled_class_start(scheduledshift.getScheduled_class_start());
		scheduledshiftVo.setScheduled_end(scheduledshift.getScheduled_end());
		scheduledshiftVo.setScheduled_id(scheduledshift.getScheduled_id());
		scheduledshiftVo.setScheduled_name(scheduledshift.getScheduled_name());
		scheduledshiftVo.setScheduled_start(scheduledshift.getScheduled_start());
		scheduledshiftVo.setScheduled_status(scheduledshift.getScheduled_status());
		scheduledshiftVo.setScheduled_publish(scheduledshift.getCreatetime());

		return scheduledshiftVos;
	}

	public List<EUser> getListUserByid(String user_id, String scheduled_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
