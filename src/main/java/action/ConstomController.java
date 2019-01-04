package action;

import java.io.File;
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

import entity.ConstomVo;
import entity.Constomfile;
import entity.EUser;
import entity.FigClass;
import entity.Figfile;
import entity.Free_constom;
import entity.IUser;
import entity.LayuiDataTable;
import entity.UploadFilevo;
import service.ConstomService;
import service.FigClassService;
import util.ExcelUtil;
import util.FileUtil;
import util.StringUtil;
import util.UUIDUtil;

@RequestMapping("/Constom")
@RestController
public class ConstomController {
	@Autowired
	private ConstomService constomService;
	@Autowired
	private FigClassService figClassService;
	
	
	/**
	 * 新增定制班次
	 * @param Constom_name
	 * @param Constom_data
	 * @param Constom_datanum
	 * @param Constom_pernum
	 * @param Constom_address
	 * @param Constom_person
	 * @param Constom_phone
	 * @param files
	 * @param Constom_outline
	 * @param Constom_gaoery
	 * @param request
	 * @return
	 */
	@RequestMapping("/addConstom")
	public Map<String,Object> addConstom(String Constom_name,
			String Constom_data,@RequestParam(value="Constom_datanum",required=false,defaultValue="")String Constom_datanum,
			String Constom_pernum,String Constom_address,
			String Constom_person,String Constom_phone,@RequestParam("file")MultipartFile[] files,
			String[] Constom_outline,String Constom_gaoery,
			HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		//获取登录用户
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user");
		if(iUser == null){
			resultMap.put("success", false);
			resultMap.put("message", "0");//未登录
			return resultMap;
		}
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simpleDateFormat.format(new Date());
		//构建对象
		Free_constom free_constom = new Free_constom();
		free_constom.setFreeco_address(Constom_address);
		free_constom.setFreeco_creater(iUser.getUser_id());
		free_constom.setFreeco_createtime(date);
		free_constom.setFreeco_updater(iUser.getUser_id());
		free_constom.setFreeco_updatetime(date);
		free_constom.setFreeco_data(Constom_data);
		free_constom.setFreeco_gaoery(Constom_gaoery);
		String freeco_id = UUIDUtil.getUUid("con");
		free_constom.setFreeco_id(freeco_id);
		free_constom.setFreeco_isdelete("0");//未删除
		free_constom.setFreeco_name(Constom_name);
		free_constom.setFreeco_numfile("0");//未上传
		free_constom.setFreeco_status("0");//未审核
		free_constom.setFreeco_person(Constom_person);
		free_constom.setFreeco_phone(Constom_phone);
		free_constom.setFreeco_pernum(Constom_pernum);
		free_constom.setFreeco_datanum(Constom_datanum);
		
		StringBuffer outline = new StringBuffer();
		StringBuffer day = new StringBuffer();
		//判断是课程方案还是自由
		if("0".equals(Constom_gaoery)){
			//课程和方案走同一个方法
			if(Constom_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			outline.append(Constom_outline[0]+",");
			day.append(Constom_outline[1]);
			free_constom.setFreeco_day(day.toString());
		}else if("1".equals(Constom_gaoery)){
			//课程和方案走同一个方法
			if(Constom_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			for (String string : Constom_outline) {
				outline.append(string+",");
			}
		}
		else {
			// 课程和方案走同一个方法
			if (Constom_outline.length <= 0) {
				resultMap.put("success", false);
				resultMap.put("message", "1");// 未选择课程或者方案
				return resultMap;
			}
			outline.append(Constom_outline[1] + ",");
		}
		if (!"".equals(outline)) {
			free_constom.setFreeco_outline(outline.toString().substring(0, outline.toString().length() - 1));// 设置方案
		}
		// 批量上传文件
		List<UploadFilevo> uploadFilevos = new ArrayList<UploadFilevo>();

		FileUtil fileUtil = new FileUtil();
		List<MultipartFile> multipartFiles = new ArrayList<MultipartFile>();
		for (MultipartFile f : files) {
			multipartFiles.add(f);
		}
		boolean flag = fileUtil.uploadbatch(uploadFilevos, multipartFiles, request.getSession().getServletContext().getRealPath("/constomfile"));
		if (flag == false) {
			resultMap.put("success", false);
			resultMap.put("message", "3");// 失败
			return resultMap;
		}
		List<Constomfile> constomfiles = new ArrayList<Constomfile>();
		for (UploadFilevo uploadfile : uploadFilevos) {
			Constomfile constomfile = new Constomfile();
			constomfile.setCreater(iUser.getUser_id());
			constomfile.setCreatetime(date);
			constomfile.setIsdelete("0");
			constomfile.setOldfilename(uploadfile.getOldfilename());
			constomfile.setNewfilename(uploadfile.getFilename());
			constomfile.setFreeco_id(freeco_id);
			constomfiles.add(constomfile);
		}
		
		constomService.insertConstom(free_constom, constomfiles);
		resultMap.put("success", true);
		resultMap.put("message", "4");// 成功!
		return resultMap;
	}
	/**
	 * 根据id获取详情
	 * @param Constom_id
	 * @param request
	 * @return
	 */
	@RequestMapping("/getDetailByid")
	public Map<String, Object> getDetailByid(String Constom_id, HttpServletRequest request) {
		// 结果map
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}
		/*// 获取定制班次实例
		Free_constom free_constom = new Free_constom();
		free_constom = constomService.getDetailByid(Constom_id);
		if (free_constom == null) {
			resultMap.put("success", false);
			resultMap.put("message", "1");// 当前定制班次不存在
			return resultMap;
		}*/
		ConstomVo constomVo = new ConstomVo();
		constomVo = constomService.getShow(Constom_id);
		if (constomVo == null) {
			resultMap.put("success", false);
			resultMap.put("message", "1");// 当前定制班次不存在
			return resultMap;
		}
		resultMap.put("success", true);
		resultMap.put("data", constomVo);// 定制班次详情
		return resultMap;
	}
	/**
	 * 审批定制班次
	 * @param Constom_id
	 * @param request
	 * @param review_result
	 * @return
	 */
	@RequestMapping("/Review")
	public Map<String,Object> ReviewConstom(String Constom_id,HttpServletRequest request,String review_result){
		//结果map
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		//获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user");
		if(iUser == null){
			resultMap.put("success", false);
			resultMap.put("message", "0");//未登录
			return resultMap;
		}
		//获取定制班次实例
		Free_constom free_constom = new Free_constom();
		free_constom = constomService.getDetailByid(Constom_id);
		if(free_constom == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");//当前定制班次不存在
			return resultMap;
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String updatetime = dateFormat.format(new Date());
		String updater = iUser.getUser_id();
		constomService.updateReview(Constom_id, review_result, updater, updatetime);
		resultMap.put("success", true);
		resultMap.put("message", "2");//审核成功!
		return resultMap;
	}
	
	/**
	 * 人员导入
	 * @param file
	 * @param Constom_id
	 * @param request
	 * @return
	 */
	@RequestMapping("/importUser")
	public Map<String, Object> importUser(@RequestParam("file") MultipartFile file, String Constom_id,
			HttpServletRequest request) {
		// 结果map
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}
		// 获取定制班次实例
		Free_constom free_constom = new Free_constom();
		free_constom = constomService.getDetailByid(Constom_id);
		if (free_constom == null) {
			resultMap.put("success", false);
			resultMap.put("message", "1");// 当前定制班次不存在
			return resultMap;
		}
		//获取最大人数
		int maxnumber = Integer.valueOf(String.valueOf(free_constom.getFreeco_pernum()));
		// 获取上传的excel
		List<List<Object>> list = new ArrayList<List<Object>>();
		// EUSER列表
		List<EUser> eUsers = new ArrayList<EUser>();
		list = new ExcelUtil().getBankListByExcel(file);
		if (list == null || list.size() == 0) {
			resultMap.put("success", false);
			resultMap.put("message", "2");// execl无数据
			return resultMap;
		} else if (list.size() > maxnumber) {
			resultMap.put("success", false);
			resultMap.put("message", "3");// 人员数量与execl不符合
			return resultMap;
		}
		SimpleDateFormat APP = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String APPLYDATE = APP.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		for (List<Object> list2 : list) {
			EUser eUser = new EUser();
			eUser.setEUser_id(UUIDUtil.getUUid("eus"));
			eUser.setEUser_name(list2.get(0).toString());// 姓名
			String sex = list2.get(1).toString();
			if ("男".equals(sex)) {
				eUser.setEUser_sex("0");// 性别
			} else if ("女".equals(sex)) {
				eUser.setEUser_sex("1");// 性别
			}
			eUser.setEUser_isdelete("0");
			eUser.setEUser_companyname(list2.get(2).toString());// 工作单位
			eUser.setEUser_department(list2.get(3).toString());// 部门
			eUser.setEUser_hold(list2.get(4).toString());// 职务
			eUser.setEUser_indentitynumber(list2.get(5).toString());// 身份证号
			eUser.setEUser_phone(list2.get(6).toString());// 联系方式
			eUser.setEUser_remark(list2.get(7).toString());// 备注
			eUser.setEUser_creater(iUser.getUser_id());
			eUser.setEUser_createtime(APPLYDATE);
			eUser.setEUser_updatetime(APPLYDATE);
			eUser.setEUser_updater(iUser.getUser_id());
			eUsers.add(eUser);
		}
		// 检测excel里面身份证是否重复
		Map<String, Object> idnumber = new HashMap<String, Object>();
		for (EUser eUser : eUsers) {
			if (idnumber.put(eUser.getEUser_indentitynumber(), eUser) != null) {
				resultMap.put("success", false);
				resultMap.put("message", "4");// excel存在身份证重复!
				return resultMap;
			}
		}
		constomService.ImportUser(eUsers, Constom_id, iUser.getUser_id());
		resultMap.put("success", true);
		resultMap.put("message", "5");//导入成功
		return resultMap;
	}
	
	@RequestMapping("/LayConstom")
	public LayuiDataTable<Free_constom> getLayBypage(@RequestParam("page")int page,@RequestParam("limit")int limit,
			@RequestParam(value="caogery",required=false,defaultValue="")String caogery,
			@RequestParam(value = "status", required = false, defaultValue = "") String status,
			HttpServletRequest request) {
		LayuiDataTable<Free_constom> fDataTable = new LayuiDataTable<Free_constom>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if(iUser != null)
			fDataTable = constomService.getListBypage(status, caogery, page, limit, iUser.getUser_id());
		fDataTable.setCode(0);
		fDataTable.setMsg("");
		return fDataTable;
	}
	
	@RequestMapping("/LayConstomad")
	public LayuiDataTable<Free_constom> getLayBypagead(@RequestParam("page")int page,@RequestParam("limit")int limit,
			@RequestParam(value="caogery",required=false,defaultValue="")String caogery,
			@RequestParam(value = "status", required = false, defaultValue = "") String status,
			HttpServletRequest request) {
		LayuiDataTable<Free_constom> fDataTable = new LayuiDataTable<Free_constom>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if(iUser != null)
			fDataTable = constomService.getListBypage(status, caogery, page, limit, "");
		fDataTable.setCode(0);
		fDataTable.setMsg("");
		return fDataTable;
	}

	@RequestMapping("/cancel")
	public Map<String,Object> cancelConstom(String Constom_id,HttpServletRequest request){
		//结果返回的map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}
		//获取定制班次实体
		Free_constom free_constom = new Free_constom();
		free_constom = constomService.getDetailByid(Constom_id);
		if(free_constom == null){
			resultMap.put("success", false);
			resultMap.put("message", "1");// 定制班次不存在
			return resultMap;
		}
		constomService.deleteConstom(Constom_id, iUser.getUser_id());
		resultMap.put("success", true);
		resultMap.put("message", "2");//取消成功
		return resultMap;
	}
	
	@RequestMapping("/updateConstom")
	@ResponseBody
	public Map<String,Object> updateConstom(String constom_id,@RequestParam("file") MultipartFile[] file,String[] oldfilename,
			String Constom_name,String Constom_data,
			@RequestParam(value="Constom_datanum",required=false,defaultValue="")String Constom_datanum,
			String Constom_pernum,String Constom_address,
			String Constom_person,String Constom_phone,
			String[] Constom_outline,String Constom_gaoery,
			HttpServletRequest request){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 获取是否登录
		IUser iUser = new IUser();
		iUser = (IUser) request.getSession().getAttribute("user");
		if (iUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "0");// 未登录
			return resultMap;
		}
		FileUtil fileUtil = new FileUtil();
		if (StringUtil.isblack(constom_id)) {
			resultMap.put("success", false);
			resultMap.put("message", "1");//参数错误!
			return resultMap;
		}
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String Scheduled_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		//获取定制班次信息
		Free_constom free_constom = constomService.getDetailByid(constom_id);
		if(free_constom == null){
			resultMap.put("success", false);
			resultMap.put("message", "2");//获取定制班次失败!
			return resultMap;
		}
		List<Constomfile> constomfiles = free_constom.getConstomFiles();
		List<Constomfile> deletesList = new ArrayList<Constomfile>();
		for(int j = constomfiles.size()-1;j>=0;j--){
			boolean flag = false;
			if(oldfilename !=null){
				for (String oldscheduledfile : oldfilename) {
					if(oldscheduledfile.equals(constomfiles.get(j).getOldfilename())){
						flag = true;
					}
				}
				if(flag == true){
					flag = false;
				}
				else{
					deletesList.add(constomfiles.get(j));
					constomfiles.remove(j);
				}
			}
		}
		for (Constomfile constomfile : deletesList) {
			if("2".equals(fileUtil.delete(request.getRealPath("/constomfile")+"\\"+constomfile.getNewfilename()))){
				resultMap.put("success", false);
				resultMap.put("message", "3");//删除文件失败!
				return resultMap;
			}
		}
		
		List<UploadFilevo> uploadFilevos = new ArrayList<UploadFilevo>();
		if(file!=null && file.length>0){
			List<MultipartFile> filels = Arrays.asList(file);
			fileUtil.uploadbatch(uploadFilevos, filels, request.getRealPath("/constomfile"));
		}
		
		
		for (UploadFilevo uploadfile : uploadFilevos) {
			Constomfile constomfile = new Constomfile();
			constomfile.setCreater(iUser.getUser_id());
			constomfile.setCreatetime(Scheduled_Createtime);
			constomfile.setIsdelete("0");
			constomfile.setOldfilename(uploadfile.getOldfilename());
			constomfile.setNewfilename(uploadfile.getFilename());
			constomfile.setFreeco_id(constom_id);
			constomfiles.add(constomfile);
		}
		
		free_constom.setFreeco_address(Constom_address);
		free_constom.setFreeco_updater(iUser.getUser_id());
		free_constom.setFreeco_updatetime(Scheduled_Createtime);
		free_constom.setFreeco_data(Constom_data);
		free_constom.setFreeco_gaoery(Constom_gaoery);
		free_constom.setFreeco_name(Constom_name);
		free_constom.setFreeco_person(Constom_person);
		free_constom.setFreeco_phone(Constom_phone);
		free_constom.setFreeco_pernum(Constom_pernum);
		free_constom.setFreeco_datanum(Constom_datanum);
		StringBuffer outline = new StringBuffer();
		//判断是课程方案还是自由
		if("0".equals(Constom_gaoery)||"1".equals(Constom_gaoery)){
			//课程和方案走同一个方法
			if(Constom_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "4");//未选择课程或者方案
				return resultMap;
			}
			for (String string : Constom_outline) {
				outline.append(string+",");
			}
		}
		else {
			// 课程和方案走同一个方法
			if (Constom_outline.length <= 0) {
				resultMap.put("success", false);
				resultMap.put("message", "4");// 未选择课程或者方案
				return resultMap;
			}
			outline.append(Constom_outline[1] + ",");
		}
		if (!"".equals(outline)) {
			free_constom.setFreeco_outline(outline.toString().substring(0, outline.toString().length() - 1));// 设置方案
		}
		constomService.updateConstom(free_constom);
		resultMap.put("success", true);
		resultMap.put("message", "5");//修改成功!
		return resultMap;
	}
	
	/**
	 * 下载定制文件内容
	 * @param request
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/download/{filename:.+}") //匹配的是href中的download请求 带后缀名的那种
    public ResponseEntity<byte[]> download(HttpServletRequest request,@PathVariable String filename) throws IOException{
    	
    	
        FileUtil fileUtil = new FileUtil();
        HttpHeaders headers = new HttpHeaders();
        String fileoldname = constomService.getByfilename(filename);
        return fileUtil.download(request.getRealPath("/constomfile")+"\\"+filename, fileoldname,headers);        
    }
	
    @RequestMapping("/exportUser/{constom_id}")
	public void ExportUser(HttpServletRequest request,HttpServletResponse response,@PathVariable String constom_id){
		//获取登录用户
		IUser iUser = new IUser();
		iUser = (IUser)request.getSession().getAttribute("user");
		List<EUser> eUsers = new ArrayList<EUser>();
		eUsers = constomService.getListUserByid(iUser.getUser_id(), constom_id);
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
	
    @RequestMapping("/exportUserad/{constom_id}")
   	public void ExportUserad(HttpServletRequest request,HttpServletResponse response,@PathVariable String constom_id){
   		//获取登录用户
   		IUser iUser = new IUser();
   		iUser = (IUser)request.getSession().getAttribute("user");
   		List<EUser> eUsers = new ArrayList<EUser>();
   		eUsers = constomService.getListUserByid("", constom_id);
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
   	/**
   	 * 定制人数改变以后 变成拼班
   	 * @param constom_id
   	 * @param file
   	 * @param oldfilename
   	 * @param Constom_name
   	 * @param Constom_data
   	 * @param Constom_datanum
   	 * @param Constom_pernum
   	 * @param Constom_address
   	 * @param Constom_person
   	 * @param Constom_phone
   	 * @param Constom_outline
   	 * @param Constom_gaoery
   	 * @param figClass_class_end
   	 * @param figClass_class_start
   	 * @param figClass_department
   	 * @param figClass_end_date
   	 * @param figClass_start_date
   	 * @param request
   	 * @return
   	 */
   	@RequestMapping("/updateFig")
   	public Map<String,Object> TranToFig(String constom_id,@RequestParam("file") MultipartFile[] file,String[] oldfilename,
			String Constom_name,String Constom_data,
			@RequestParam(value="Constom_datanum",required=false,defaultValue="")String Constom_datanum,
			String Constom_pernum,String Constom_address,
			String Constom_person,String Constom_phone,
			String[] Constom_outline,String Constom_gaoery,
			String figClass_class_end,String figClass_class_start,
			String figClass_department,String figClass_end_date,
			String figClass_start_date,
			HttpServletRequest request){
   		//结果集
   		Map<String,Object> resultMap = new HashMap<String, Object>();
   		IUser iuser = new IUser();
   		iuser = (IUser)request.getSession().getAttribute("user");
   		//构建拼班实体
   		FigClass figClass = new FigClass();
   		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   		String CreateDate = simpleDateFormat.format(new Date());
   		String uuid = UUIDUtil.getUUid("fig");
   		figClass.setFigClass_address(Constom_address);//举办地点
   		figClass.setFigClass_caogery(Constom_gaoery);//类别
   		figClass.setFigClass_creater(iuser.getUser_id());//创建人
   		figClass.setFigClass_class_end(figClass_class_end);//结课日期
   		figClass.setFigClass_class_start(figClass_class_start);//开课日期
   		figClass.setFigClass_createtime(CreateDate);//创建日期
   		figClass.setFigClass_deparment(figClass_department);//举办单位
   		figClass.setFigClass_end_date(figClass_end_date);//报名截止日期
   		figClass.setFigClass_id(uuid);
   		figClass.setFigClass_isdelete("0");
   		figClass.setFigClass_isdelete(Constom_name);
   		figClass.setFigClass_numstatus("0");
   		StringBuffer outline = new StringBuffer();
		//判断是课程方案还是自由
		if("0".equals(Constom_gaoery)||"1".equals(Constom_gaoery)){
			//课程和方案走同一个方法
			if(Constom_outline.length<=0){
				resultMap.put("success", false);
				resultMap.put("message", "1");//未选择课程或者方案
				return resultMap;
			}
			for (String string : Constom_outline) {
				outline.append(string+",");
			}
		}
		else {
			// 课程和方案走同一个方法
			if (Constom_outline.length <= 0) {
				resultMap.put("success", false);
				resultMap.put("message", "1");// 未选择课程或者方案
				return resultMap;
			}
			outline.append(Constom_outline[0] + ",");
		}
		if (!"".equals(outline)) {
			figClass.setFigClass_outline(outline.toString().substring(0, outline.toString().length() - 1));// 设置方案
		}
		figClass.setFigClass_pernum(Constom_pernum);//容纳人数
		figClass.setFigClass_phone(Constom_phone);//联系电话
		figClass.setFigClass_start_date(figClass_start_date);//报名开始日期
		figClass.setFigClass_updater(iuser.getUser_id());
		figClass.setFigClass_updatetime(CreateDate);
		// 批量上传文件
		List<UploadFilevo> uploadFilevos = new ArrayList<UploadFilevo>();

		FileUtil fileUtil = new FileUtil();
		List<MultipartFile> multipartFiles = new ArrayList<MultipartFile>();
		
		Free_constom free_constom = new Free_constom();
		free_constom = constomService.getDetailByid(constom_id);
		
		for (Constomfile constomfile : free_constom.getConstomFiles()) {
			MultipartFile multipartFile = fileUtil.getFileByname(request.getSession().getServletContext().getRealPath("/constomfile")+"\\"+constomfile.getNewfilename());
			multipartFiles.add(multipartFile);
		}
		boolean flag = fileUtil.uploadbatch(uploadFilevos, multipartFiles,
				request.getSession().getServletContext().getRealPath("/figclassfile"));
		if (flag == false) {
			resultMap.put("success", false);
			resultMap.put("message", "2");// 文件上传失败
			return resultMap;
		}
		List<Figfile> figfiles = new ArrayList<Figfile>();
		for (UploadFilevo uploadfile : uploadFilevos) {
			Figfile figfile = new Figfile();
			figfile.setCreater(iuser.getUser_id());
			figfile.setCreatetime(CreateDate);
			figfile.setIsdelete("0");
			figfile.setOldfilename(uploadfile.getOldfilename());
			figfile.setNewfilename(uploadfile.getFilename());
			figfile.setFigClass_id(uuid);
			figfiles.add(figfile);
		}
		try{
			figClassService.insertFig(figClass, figfiles);
		}catch(Exception exception){
			exception.printStackTrace();
			resultMap.put("success", false);
			resultMap.put("message", "3");// 转换失败
			return resultMap;
		}
		try{
			constomService.deleteConstom(constom_id, iuser.getUser_id());
		}catch(Exception exception){
			exception.printStackTrace();
			resultMap.put("success", false);
			resultMap.put("message", "4");// 删除失败
			return resultMap;
		}

		resultMap.put("success", true);
		resultMap.put("message", "5");// 修改成功
		return resultMap;
   		
   	}
}
