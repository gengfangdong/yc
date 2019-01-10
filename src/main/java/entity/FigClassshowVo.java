package entity;
//前台展示拼班vo
public class FigClassshowVo {
	private String FigClass_id;//id
	private String FigClass_name;//名字
	private String FigClass_pernum;//容纳人数
	private String FigClass_start;//报名开始日期
	private String FigClass_end;//报名截止日期
	private String FigClass_class_start;//开课日期
	private String FigClass_class_end;//结课日期
	private String FigClass_status;//班次状态
	private String user_status;//个人状态 是否上传名单
	private String bmstatus;//个人是否报名
	private String FigClass_creater;
	private String FigClass_updatetime;
	private String isdelete;
	private int FigClass_number;//剩余人数
	public FigClassshowVo() {
		super();
	}
	public String getFigClass_id() {
		return FigClass_id;
	}
	public void setFigClass_id(String figClass_id) {
		FigClass_id = figClass_id;
	}
	public String getFigClass_name() {
		return FigClass_name;
	}
	public void setFigClass_name(String figClass_name) {
		FigClass_name = figClass_name;
	}
	public String getFigClass_pernum() {
		return FigClass_pernum;
	}
	public void setFigClass_pernum(String figClass_pernum) {
		FigClass_pernum = figClass_pernum;
	}
	public String getFigClass_start() {
		return FigClass_start;
	}
	public void setFigClass_start(String figClass_start) {
		FigClass_start = figClass_start;
	}
	public String getFigClass_end() {
		return FigClass_end;
	}
	public void setFigClass_end(String figClass_end) {
		FigClass_end = figClass_end;
	}
	public String getFigClass_class_start() {
		return FigClass_class_start;
	}
	public void setFigClass_class_start(String figClass_class_start) {
		FigClass_class_start = figClass_class_start;
	}
	public String getFigClass_class_end() {
		return FigClass_class_end;
	}
	public void setFigClass_class_end(String figClass_class_end) {
		FigClass_class_end = figClass_class_end;
	}
	public String getFigClass_status() {
		return FigClass_status;
	}
	public void setFigClass_status(String figClass_status) {
		FigClass_status = figClass_status;
	}
	public String getUser_status() {
		return user_status;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	public int getFigClass_number() {
		return FigClass_number;
	}
	public void setFigClass_number(int figClass_number) {
		FigClass_number = figClass_number;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	public String getFigClass_creater() {
		return FigClass_creater;
	}
	public void setFigClass_creater(String figClass_creater) {
		FigClass_creater = figClass_creater;
	}
	public String getFigClass_updatetime() {
		return FigClass_updatetime;
	}
	public void setFigClass_updatetime(String figClass_updatetime) {
		FigClass_updatetime = figClass_updatetime;
	}
	public String getBmstatus() {
		return bmstatus;
	}
	public void setBmstatus(String bmstatus) {
		this.bmstatus = bmstatus;
	}
	
	
	
}
