package action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import entity.Culture;
import entity.DatatablesViewPage;
import entity.Expert;
import entity.IUser;
import entity.LayuiDataTable;
import entity.Project;
import entity.ScheduledShiftShow;
import entity.Solution;
import entity.Tax;
import entity.Teaching;
import service.CultureService;
import service.ExpertService;
import service.ProjectService;
import service.ScheduledshiftService;
import service.SolutionService;
import service.TaxService;
import service.TeachingService;

@RequestMapping("/Show")
@RestController
public class ShowController {
	@Autowired
	private CultureService cultureService;
	@Autowired
	private SolutionService solutionService;
	
	@Autowired
	private TeachingService teachingService;
	@Autowired
	private TaxService taxService;
	@Autowired
	private ExpertService expertService;
	@Autowired
	private ProjectService ProjectService;
	@Autowired
	private ScheduledshiftService scheduledShiftService;
	
	/**
	 * 培养列表获取
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlistCulture")
	@ResponseBody
	public DatatablesViewPage<Culture> CultureGetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Culture> datatablesViewPage = new DatatablesViewPage<Culture>();
		datatablesViewPage = cultureService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取培养的内容
	 * @param culture_id
	 * @return json
	 */
	@RequestMapping(value = "/getCulturedetailByid")
	@ResponseBody
	public Map<String,Object> GetCultureDetailByid(@RequestParam("culture_id")String culture_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Culture culture = new Culture();
		if(culture_id == null || "".equals(culture_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		culture = cultureService.getCultureDetailByid(culture_id);
		if(culture == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", culture); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 新闻列表获取
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlistSolution")
	@ResponseBody
	public DatatablesViewPage<Solution> SolutionGetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Solution> datatablesViewPage = new DatatablesViewPage<Solution>();
		datatablesViewPage = solutionService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取新闻的内容
	 * @param solution_id
	 * @return json
	 */
	@RequestMapping(value = "/getSolutiondetailByid")
	@ResponseBody
	public Map<String,Object> GetSolutionDetailByid(@RequestParam("solution_id")String solution_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Solution solution = new Solution();
		if(solution_id == null || "".equals(solution_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		solution = solutionService.getSolutionDetailByid(solution_id);
		if(solution == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", solution); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 新闻列表获取
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlistTeaching")
	@ResponseBody
	public DatatablesViewPage<Teaching> TeachingGetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Teaching> datatablesViewPage = new DatatablesViewPage<Teaching>();
		datatablesViewPage = teachingService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取新闻的内容
	 * @param teaching_id
	 * @return json
	 */
	@RequestMapping(value = "/getTeachingdetailByid")
	@ResponseBody
	public Map<String,Object> GetTeachingDetailByid(@RequestParam("teaching_id")String teaching_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Teaching teaching = new Teaching();
		if(teaching_id == null || "".equals(teaching_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		teaching = teachingService.getTeachingDetailByid(teaching_id);
		if(teaching == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", teaching); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 新闻列表获取
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlistTax")
	@ResponseBody
	public DatatablesViewPage<Tax> TaxGetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Tax> datatablesViewPage = new DatatablesViewPage<Tax>();
		datatablesViewPage = taxService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取新闻的内容
	 * @param tax_id
	 * @return json
	 */
	@RequestMapping(value = "/getTaxdetailByid")
	@ResponseBody
	public Map<String,Object> GetTaxDetailByid(@RequestParam("tax_id")String tax_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Tax tax = new Tax();
		if(tax_id == null || "".equals(tax_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		tax = taxService.getTaxDetailByid(tax_id);
		if(tax == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", tax); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 新闻列表获取
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlistExpert")
	@ResponseBody
	public DatatablesViewPage<Expert> ExpertGetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Expert> datatablesViewPage = new DatatablesViewPage<Expert>();
		datatablesViewPage = expertService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取新闻的内容
	 * @param expert_id
	 * @return json
	 */
	@RequestMapping(value = "/getExpertdetailByid")
	@ResponseBody
	public Map<String,Object> GetExpertDetailByid(@RequestParam("expert_id")String expert_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Expert expert = new Expert();
		if(expert_id == null || "".equals(expert_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		expert = expertService.getExpertDetailByid(expert_id);
		if(expert == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", expert); //请求成功
		}
			
		return resultMap;
	}
	
	/**
	 * 项目列表获取
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/getlistProject")
	@ResponseBody
	public DatatablesViewPage<Project> ProjectGetlistPage(@RequestParam("draw")int draw,@RequestParam("start")int start,@RequestParam("length")int length){
		//DataTables  返回实例
		DatatablesViewPage<Project> datatablesViewPage = new DatatablesViewPage<Project>();
		datatablesViewPage = ProjectService.GetlistPage(start, length);
		datatablesViewPage.setDraw(draw);
		return datatablesViewPage;
	}
	
	/**
	 * 根据id获取项目的内容
	 * @param news_id
	 * @return json
	 */
	@RequestMapping(value = "/getProjectdetailByid")
	@ResponseBody
	public Map<String,Object> GetProjectDetailByid(@RequestParam("Project_id")String Project_id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		Project Project = new Project();
		if(Project_id == null || "".equals(Project_id)){
			resultMap.put("success", false);
			resultMap.put("meg", "0"); //请求错误
		}
		Project = ProjectService.getProjectDetailByid(Project_id);
		if(Project == null){
			resultMap.put("success", false);
			resultMap.put("meg", "1"); //请求错误
		}
		else{
			resultMap.put("success", true);
			resultMap.put("data", Project); //请求成功
		}
			
		return resultMap;
	}
	
	
	@RequestMapping(value = "/getScList")
	@ResponseBody
	public LayuiDataTable<ScheduledShiftShow> getShowList(@RequestParam("page")int page,@RequestParam("limit")int limit,
			@RequestParam(value="scstatus",required=false,defaultValue="")String scstatus,
			@RequestParam(value="memstatus",required=false,defaultValue="")String memstatus,
			HttpServletRequest request){
		LayuiDataTable<ScheduledShiftShow> sDataTable = new LayuiDataTable<ScheduledShiftShow>();
		
		IUser iuser = new IUser();
		iuser = (IUser) request.getSession().getAttribute("user");
		
		if(iuser == null){
			sDataTable = scheduledShiftService.getAdminScByPage(page, limit, scstatus);
		}
		else
			sDataTable = scheduledShiftService.getScByPage(page, limit, iuser.getUser_id(), scstatus, memstatus);
		sDataTable.setCode(0);
		sDataTable.setMsg("");
		return sDataTable;
	}
	
	
}
