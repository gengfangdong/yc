package action;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import entity.ApplyUnit;
import entity.DatatablesViewPage;
import entity.EUser;
import entity.FigClass;
import entity.FigUser;
import entity.IUser;
import entity.LayuiDataTable;
import entity.ScheduledShiftShow;
import entity.Scheduledfile;
import entity.Scheduledshift;
import entity.ScheduledshiftVo;
import entity.Ssuser;
import entity.UploadFilevo;
import service.ScheduledshiftService;
import service.SsuserService;
import util.FileUtil;
import util.MessageUtil;
import util.StringUtil;
import util.UUIDUtil;

@RequestMapping("/ScheduledShift")
@RestController
public class ScheduledShiftController {
	@Autowired
	private ScheduledshiftService scheduledshiftService;
	@Autowired
	private SsuserService ssuserService;
	
	@RequestMapping("/SaveScheduledShift")
	@ResponseBody
	public Map<String,Object> saveScheduledShift(@RequestParam("file") MultipartFile[] file,String Scheduled_name,String Scheduled_initiator,
			String Scheduled_address,String Scheduled_start,String Scheduled_end,String Scheduled_class_start,
			String Scheduled_class_end,String Scheduled_class_pnumber,String Scheduled_class_context,String Scheduled_other_context,String Scheduled_dname,String Scheduled_yh,String Scheduled_zh,
			HttpServletRequest request) throws IOException{
		Map<String,Object> resultMap = new HashMap<String, Object>();
		String Sid = UUIDUtil.getUUid("sch");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String Scheduled_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		Scheduledshift scheduledshift = new Scheduledshift();
		//获取登录人的信息
		IUser user = (IUser) request.getSession().getAttribute("user");
		if(user == null){
			resultMap.put("success", false);
			resultMap.put("message", "0");//失败
			return resultMap;
		}
		scheduledshift.setCreater(user.getUser_id());
		scheduledshift.setCreatetime(Scheduled_Createtime);
		scheduledshift.setIsdelete("0");
		scheduledshift.setScheduled_name(Scheduled_name);
		scheduledshift.setScheduled_address(Scheduled_address);
		scheduledshift.setScheduled_class_context(Scheduled_class_context);
		scheduledshift.setScheduled_class_end(Scheduled_class_end);
		scheduledshift.setScheduled_class_pnumber(Scheduled_class_pnumber);
		scheduledshift.setScheduled_class_start(Scheduled_class_start);
		scheduledshift.setScheduled_end(Scheduled_end);
		scheduledshift.setScheduled_id(Sid);
		scheduledshift.setScheduled_initiator(Scheduled_initiator);
		scheduledshift.setScheduled_other_context(Scheduled_other_context);
		scheduledshift.setScheduled_start(Scheduled_start);
		scheduledshift.setScheduled_dname(Scheduled_dname);
		scheduledshift.setScheduled_yh(Scheduled_yh);
		scheduledshift.setScheduled_zh(Scheduled_zh);
		scheduledshift.setScheduled_status("0");
		
		//批量上传文件
		List<UploadFilevo> uploadFilevos = new ArrayList<UploadFilevo>();
		
		FileUtil fileUtil = new FileUtil();
		List<MultipartFile> multipartFiles = new ArrayList<MultipartFile>();
		for (MultipartFile f : file) {
			multipartFiles.add(f);
		}
		boolean flag = fileUtil.uploadbatch(uploadFilevos, multipartFiles,request.getRealPath("/scheduledfile"));
		if(flag == false){
			resultMap.put("success", false);
			resultMap.put("message", "0");//失败
			return resultMap;
		}
		List<Scheduledfile> scheduleds = new ArrayList<Scheduledfile>();
		
		for (UploadFilevo filevo : uploadFilevos) {
			Scheduledfile scheduledfile = new Scheduledfile();
			scheduledfile.setCreater(user.getUser_id());
			scheduledfile.setCreatetime(Scheduled_Createtime);
			scheduledfile.setIsdelete("0");
			scheduledfile.setScheduled_file(filevo.getFilename());
			scheduledfile.setScheduled_oldfile(filevo.getOldfilename());
			scheduledfile.setScheduled_id(Sid);
			scheduleds.add(scheduledfile);
		}
		scheduledshift.setScheduleds(scheduleds);
		
		scheduledshiftService.insertScheduledshift(scheduledshift);
		resultMap.put("success", true);
		resultMap.put("message", "1");//成功!
		return resultMap;
	}
	
	@RequestMapping("/deleteScheduled")
	@ResponseBody
	public Map<String,Object> deleteScheduled(String Scheduled_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Scheduledshift scheduledshift = new Scheduledshift();
		scheduledshift = scheduledshiftService.getDetailByid(Scheduled_id);
		if(scheduledshift == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取实体失败;
			return resultMap;
		}
		scheduledshiftService.deleteSch(Scheduled_id);
		resultMap.put("success", true);
		resultMap.put("message", "2");//删除成功!
		return resultMap;
	}
	
	@RequestMapping("/getPageByStatus")
	@ResponseBody
	public DatatablesViewPage<ScheduledshiftVo> getPageBystatus(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length,
			@RequestParam(value = "Scheduled_status",required=false)String Scheduled_status){
		
		DatatablesViewPage<ScheduledshiftVo> sDatatablesViewPage = new DatatablesViewPage<ScheduledshiftVo>();
		List<Scheduledshift> scheduledshifts  = new ArrayList<Scheduledshift>();
		if(StringUtil.isblack(Scheduled_status)){
			scheduledshifts = scheduledshiftService.getListBystatus("",start,length).getData();
			sDatatablesViewPage.setRecordsTotal(scheduledshiftService.getListBystatus("",start,length).getRecordsTotal());
			sDatatablesViewPage.setRecordsFiltered(scheduledshiftService.getListBystatus("",start,length).getRecordsFiltered());
		}
		else{
			scheduledshifts = scheduledshiftService.getListBystatus(Scheduled_status,start,length).getData();

			sDatatablesViewPage.setRecordsTotal(scheduledshiftService.getListBystatus("",start,length).getRecordsTotal());
			sDatatablesViewPage.setRecordsFiltered(scheduledshiftService.getListBystatus("",start,length).getRecordsFiltered());
		}
		sDatatablesViewPage.setData(trantoFromStoV(scheduledshifts));
		sDatatablesViewPage.setDraw(draw);
		return sDatatablesViewPage;
	}
	
	@RequestMapping("/getDetailByid")
	@ResponseBody
	public Map<String,Object> getDetailBySchid(@RequestParam("Scheduled_id")String Scheduled_id){
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		if(StringUtil.isblack(Scheduled_id)){
			resultMap.put("success", false);
			resultMap.put("msg", "0");//参数不对
			return resultMap;
		}
		
		Scheduledshift scheduledshift = new Scheduledshift();
		scheduledshift = scheduledshiftService.getDetailByid(Scheduled_id);
		if(scheduledshift == null){
			resultMap.put("success", false);
			resultMap.put("msg", "1");//未获取自主报名
			return resultMap;
		}
		
		resultMap.put("success", true);
		resultMap.put("data", scheduledshift);
		return resultMap;
		
	}
	
	@RequestMapping(value="/download/{filename:.+}") //匹配的是href中的download请求 带后缀名的那种
    public ResponseEntity<byte[]> download(HttpServletRequest request,@PathVariable String filename) throws IOException{
    	
    	
        FileUtil fileUtil = new FileUtil();
        HttpHeaders headers = new HttpHeaders();
        String fileoldname = scheduledshiftService.getByScheduledfile(filename);
        return fileUtil.download(request.getRealPath("/scheduledfile")+"\\"+filename, fileoldname,headers);        
    }
	
	@RequestMapping("/updateScheduled")
	@ResponseBody
	public Map<String,Object> updateScheduled(@RequestParam("file") MultipartFile[] file,String Scheduled_id,String[] oldfilename,String Scheduled_name,String Scheduled_initiator,
			String Scheduled_address,String Scheduled_start,String Scheduled_end,String Scheduled_class_start,String Scheduled_dname,String Scheduled_yh,String Scheduled_zh,
			String Scheduled_class_end,String Scheduled_class_pnumber,String Scheduled_class_context,String Scheduled_other_context,
			HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		FileUtil fileUtil = new FileUtil();
		if(StringUtil.isblack(Scheduled_id)){
			resultMap.put("success", false);
			resultMap.put("message", "0");//参数错误!
			return resultMap;
		}
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String Scheduled_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		//获取自主报名信息
		Scheduledshift scheduledshift = new Scheduledshift();
		scheduledshift = scheduledshiftService.getDetailByid(Scheduled_id);
		if(scheduledshift == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//获取自主报名失败!
			return resultMap;
		}
		List<Scheduledfile> scheduledfiles = scheduledshift.getScheduleds();
		List<Scheduledfile> deletesList = new ArrayList<Scheduledfile>();
		for(int j = scheduledfiles.size()-1;j>=0;j--){
			boolean flag = false;
			if(oldfilename !=null){
				for (String oldscheduledfile : oldfilename) {
					if(oldscheduledfile.equals(scheduledfiles.get(j).getScheduled_file())){
						flag = true;
					}
				}
				if(flag == true){
					flag = false;
				}
				else{
					deletesList.add(scheduledfiles.get(j));
					scheduledfiles.remove(j);
				}
			}
			else{
				deletesList.add(scheduledfiles.get(j));
				scheduledfiles.remove(j);
				
			}
		}
		for (Scheduledfile scheduledfile : deletesList) {
			if("2".equals(fileUtil.delete(request.getRealPath("/scheduledfile")+"\\"+scheduledfile.getScheduled_file()))){
				resultMap.put("success", false);
				resultMap.put("message", "2");//删除文件失败!
				return resultMap;
			}
		}
		
		List<UploadFilevo> uploadFilevos = new ArrayList<UploadFilevo>();
		if(file!=null && file.length>0){
			List<MultipartFile> files = Arrays.asList(file);
			fileUtil.uploadbatch(uploadFilevos, files, request.getRealPath("/scheduledfile"));
		}

		// 获取登录人的信息
		IUser user = (IUser) request.getSession().getAttribute("user");
		if (user == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 失败
			return resultMap;
		}
		for (UploadFilevo filevo : uploadFilevos) {
			Scheduledfile scheduledfile = new Scheduledfile();
			scheduledfile.setCreater(user.getUser_id());
			scheduledfile.setCreatetime(Scheduled_Createtime);
			scheduledfile.setIsdelete("0");
			scheduledfile.setScheduled_file(filevo.getFilename());
			scheduledfile.setScheduled_oldfile(filevo.getOldfilename());
			scheduledfile.setScheduled_id(Scheduled_id);
			scheduledfiles.add(scheduledfile);
		}
		
		scheduledshift.setCreater(user.getUser_id());
		scheduledshift.setCreatetime(Scheduled_Createtime);
		scheduledshift.setScheduled_address(Scheduled_address);
		scheduledshift.setScheduled_class_context(Scheduled_class_context);
		scheduledshift.setScheduled_class_end(Scheduled_class_end);
		scheduledshift.setScheduled_class_pnumber(Scheduled_class_pnumber);
		scheduledshift.setScheduled_class_start(Scheduled_class_start);
		scheduledshift.setScheduled_end(Scheduled_end);
		scheduledshift.setScheduled_start(Scheduled_start);
		scheduledshift.setScheduled_initiator(Scheduled_initiator);
		scheduledshift.setScheduled_name(Scheduled_name);
		scheduledshift.setScheduled_other_context(Scheduled_other_context);
		scheduledshift.setScheduleds(scheduledfiles);
		scheduledshift.setScheduled_dname(Scheduled_dname);
		scheduledshift.setScheduled_yh(Scheduled_yh);
		scheduledshift.setScheduled_zh(Scheduled_zh);
		scheduledshiftService.updateSch(scheduledshift);
		resultMap.put("success", true);
		resultMap.put("message", "3");//修改成功!
		return resultMap;
	}
	
	@RequestMapping("/getmemberRegulationClasses")
	@ResponseBody
	public LayuiDataTable<ScheduledShiftShow> getMemBer(@RequestParam("page")int page,@RequestParam("limit")int limit,
			@RequestParam(value="scstatus",defaultValue="",required=false)String scstatus,@RequestParam(value="memstatus",defaultValue="",required=false)String memstatus,
			@RequestParam(value="classname",required=false,defaultValue="")String classname,
			@RequestParam(value="starttime",required=false,defaultValue="")String starttime,@RequestParam(value="endtime",required=false,defaultValue="")String endtime,
			HttpServletRequest request){
		//结果集
		LayuiDataTable<ScheduledShiftShow> sDataTable = new LayuiDataTable<ScheduledShiftShow>();
		
		//session获取人员
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if(iUser == null){
			return null;
		}
		sDataTable = scheduledshiftService.getScByPage1(page, limit, iUser.getUser_id(),scstatus,memstatus,classname,starttime,endtime);
		sDataTable.setCode(0);
		sDataTable.setMsg("");
		return sDataTable;
	}
	
	@RequestMapping("/getRegulationClasses")
	@ResponseBody
	public LayuiDataTable<ScheduledShiftShow> getAdminBer(@RequestParam("page")int page,@RequestParam("limit")int limit,
			@RequestParam(value="status",required=false,defaultValue="")String status,
			@RequestParam(value="classname",required=false,defaultValue="")String classname,
			@RequestParam(value="starttime",required=false,defaultValue="")String starttime,@RequestParam(value="endtime",required=false,defaultValue="")String endtime,HttpServletRequest request){
		//结果集
		LayuiDataTable<ScheduledShiftShow> sDataTable = new LayuiDataTable<ScheduledShiftShow>();
		
		//session获取人员
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if(iUser == null){
			return null;
		}
		sDataTable = scheduledshiftService.getAdminScByPage1(page, limit, status,classname,starttime,endtime);
		sDataTable.setCode(0);
		sDataTable.setMsg("");
		return sDataTable;
	}
	@RequestMapping("/exportUser/{Scheduled_id}")
	public void ExportUser(HttpServletRequest request,HttpServletResponse response,@PathVariable String Scheduled_id){
		//获取登录用户
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user");
		List<EUser> eUsers = new ArrayList<EUser>();
		eUsers = scheduledshiftService.getListUserByid(iUser.getUser_id(), Scheduled_id);
		//导出excel
		
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet();
		HSSFRow row1 = sheet.createRow(0);//标题行
		String[] titleValue ={"姓名","性别","工作单位","部门","职务","身份证号","联系方式","备注"}; 
		for(int i=0;i<8;i++){
			HSSFCell cell = row1.createCell(i);
			cell.setCellValue(titleValue[i]);
		}
		for(int j=0;j<eUsers.size();j++){
			EUser eUser = eUsers.get(j);
			HSSFRow row = sheet.createRow(j+1);
			HSSFCell cell = row.createCell(0);
			cell.setCellValue(eUser.getEUser_name());
			HSSFCell cell1 = row.createCell(1);
			String sex = eUser.getEUser_sex();
			if("0".equals(sex)){
				cell1.setCellValue("男");
			}else if("1".equals(sex)){
				cell1.setCellValue("女");
			}
			
			HSSFCell cell2 = row.createCell(2);
			cell2.setCellValue(eUser.getEUser_companyname());
			HSSFCell cell3 = row.createCell(3);
			cell3.setCellValue(eUser.getEUser_department());
			HSSFCell cell4 = row.createCell(4);
			cell4.setCellValue(eUser.getEUser_hold());
			HSSFCell cell5 = row.createCell(5);
			cell5.setCellValue(eUser.getEUser_indentitynumber());
			HSSFCell cell6 = row.createCell(6);
			cell6.setCellValue(eUser.getEUser_phone());
			HSSFCell cell7 = row.createCell(7);
			cell7.setCellValue(eUser.getEUser_remark());
			
		}
		
		//输出Excel文件
	    OutputStream output;
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+new String("人员列表".getBytes("gbk"), "iso8859-1")+".xls");
			response.setContentType("application/x-download");
			response.setCharacterEncoding("UTF-8");
			output = response.getOutputStream();
			wb.write(output);
			output.flush();// 刷新流  
			output.close();
			wb.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				wb.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			//logger.info("yes");
		}
	   
	}
	
	@RequestMapping("/openClass/{scheduled_id}")
	public Map<String,Object> openClass(@PathVariable String scheduled_id,HttpServletRequest request){
		//
		Map<String,Object> resultmap = new HashMap<>();
		IUser iuser = new IUser();
		iuser = (IUser)request.getSession().getAttribute("user");
		if(iuser == null){
			resultmap.put("success", false);
			resultmap.put("message", "0");//未登录
			return resultmap;
		}
		//获取规定实例
		Scheduledshift scheduledshift = new Scheduledshift();
		scheduledshift = scheduledshiftService.getDetailByid(scheduled_id);
		if(scheduledshift == null){
			resultmap.put("success", false);
			resultmap.put("message", "1");//实例不存在
			return resultmap;
		}
		//更新状态
		scheduledshift.setScheduled_status("3");
		try{
			scheduledshiftService.updateStatus(scheduledshift);
			List<Ssuser> ssusers = new ArrayList<>();
			ssusers = ssuserService.getcountBynoPage(scheduled_id);
			if(ssusers!=null&&ssusers.size()>0){
				try {

					for (Ssuser figUser : ssusers) {
						String context = "您报名的自主报名培训班: " + scheduledshift.getScheduled_name() + " 开课成功!";
						String phone = figUser.getSsu_ydphone();
						if ("0".equals(MessageUtil.httpPost(phone, context))) {
							resultmap.put("success", false);
							resultmap.put("message", "1");// 审核成功!
							return resultmap;
						}
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					resultmap.put("success", false);
					resultmap.put("message", "1");// 审核成功!
					return resultmap;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			resultmap.put("success", false);
			resultmap.put("message", "2");//开课失败
			return resultmap;
		}
		resultmap.put("success", true);
		resultmap.put("message", "3");//开课成功
		return resultmap;
	}
	@RequestMapping("/endClass/{scheduled_id}")
	public Map<String,Object> endClass(@PathVariable String scheduled_id,HttpServletRequest request){
		//
		Map<String,Object> resultmap = new HashMap<>();
		IUser iuser = new IUser();
		iuser = (IUser)request.getSession().getAttribute("user");
		if(iuser == null){
			resultmap.put("success", false);
			resultmap.put("message", "0");//未登录
			return resultmap;
		}
		//获取规定实例
		Scheduledshift scheduledshift = new Scheduledshift();
		scheduledshift = scheduledshiftService.getDetailByid(scheduled_id);
		if(scheduledshift == null){
			resultmap.put("success", false);
			resultmap.put("message", "1");//实例不存在
			return resultmap;
		}
		//更新状态
		scheduledshift.setScheduled_status("4");
		try{
			scheduledshiftService.updateStatus(scheduledshift);
			
		}catch(Exception e){
			e.printStackTrace();
			resultmap.put("success", false);
			resultmap.put("message", "2");//开课失败
			return resultmap;
		}
		resultmap.put("success", true);
		resultmap.put("message", "3");//开课成功
		return resultmap;
	}
	
	
	
	
	
	
	
	public List<ScheduledshiftVo> trantoFromStoV(List<Scheduledshift> scheduledshifts){
		List<ScheduledshiftVo> scheduledshiftVos = new ArrayList<ScheduledshiftVo>();
		
		for (Scheduledshift scheduledshift : scheduledshifts) {
			ScheduledshiftVo scheduledshiftVo = new ScheduledshiftVo();
			scheduledshiftVo.setDatanumber(""+StringUtil.getDataSub(scheduledshift.getScheduled_class_start(), scheduledshift.getScheduled_class_end()));
			scheduledshiftVo.setScheduled_class_pnumber(scheduledshift.getScheduled_class_pnumber());
			scheduledshiftVo.setScheduled_class_start(scheduledshift.getScheduled_class_start());
			scheduledshiftVo.setScheduled_end(scheduledshift.getScheduled_end());
			scheduledshiftVo.setScheduled_id(scheduledshift.getScheduled_id());
			scheduledshiftVo.setScheduled_name(scheduledshift.getScheduled_name());
			scheduledshiftVo.setScheduled_start(scheduledshift.getScheduled_start());
			scheduledshiftVo.setScheduled_status(scheduledshift.getScheduled_status());
			scheduledshiftVo.setScheduled_publish(scheduledshift.getCreatetime());
			scheduledshiftVos.add(scheduledshiftVo);
		}
		return scheduledshiftVos;
	}
}
