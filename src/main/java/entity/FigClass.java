package entity;

import java.io.Serializable;
import java.util.List;

/*
 * 拼班实体
 * FIGCLASS_ID	N	VARCHAR2(64)	N			拼班id
FIGCLASS_NAME	N	VARCHAR2(100)	N			拼班培训名称
FIGCLASS_DEPARMENT	N	VARCHAR2(100)	N			拼班发起单位
FIGCLASS_ADDRESS	N	VARCHAR2(200)	N			拼班开课地点
FIGCLASS_START_DATE	N	VARCHAR2(100)	N			拼班开始日期
FIGCLASS_END_DATE	N	VARCHAR2(100)	N			拼班截止日期
FIGCLASS_CLASS_START	N	VARCHAR2(100)	N			拼班开课日期
FIGCLASS_CLASS_END	N	VARCHAR2(100)	N			拼班结课日期
FIGCLASS_PERNUM	N	VARCHAR2(20)	N			拼班容纳人数
FIGCLASS_PHONE	N	VARCHAR2(20)	N			拼班联系电话
FIGCLASS_PERSON	N	VARCHAR2(100)	N			拼班联系人
FIGCLASS_STATUS	N	VARCHAR2(2)	N			拼班状态
FIGCLASS_CREATER	N	VARCHAR2(64)	N			拼班创建人
FIGCLASS_CREATETIME	N	VARCHAR2(100)	N			拼班创建时间
FIGCLASS_UPDATER	N	VARCHAR2(64)	N			拼班更新人
FIGCLASS_UPDATETIME	N	VARCHAR2(100)	N			拼班更新时间
FIGCLASS_ISDELETE	N	VARCHAR2(2)	N			拼班是否删除
FIGCLASS_NUMSTATUS	N	VARCHAR2(2)	N			拼班名单是否上传
FIGCLASS_CAOGERY	N	VARCHAR2(2)	N			拼班种类 1为课程0为方案2为自由
FIGCLASS_OUTLINE	N	VARCHAR2(2000)	N			大纲


 */
public class FigClass implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5037501498884673198L;
	private String FigClass_id;//拼班id
	private String FigClass_name;//拼班培训名称
	private String FigClass_deparment;//拼班发起单位
	private String FigClass_address;//拼班开课地点
	private String FigClass_start_date;//拼班开始日期
	private String FigClass_end_date;//拼班截止日期
	private String FigClass_class_start;//拼班开课日期
	private String FigClass_class_end;//拼班结课日期
	private String FigClass_pernum;//拼班容纳人数
	private String FigClass_phone;//拼班联系电话
	private String FigClass_person;//拼班联系人
	private String FigClass_status;//拼班状态 0为未审核1为审核通过2为审核未通过3为开班中4结课
	private String FigClass_creater;//拼班创建人
	private String FigClass_createtime;//拼班创建时间
	private String FigClass_updater;//拼班更新人
	private String FigClass_updatetime;//拼班更新时间
	private String FigClass_isdelete;//拼班是否删除 0为未删除 1为已删除
	private String FigClass_numstatus;//拼班名单是否上传    0为未上传 1为已上传
	private String FigClass_caogery;//拼班1为课程0为方案2为自由
	private String FigClass_outline;//大纲
	private List<Figfile> figFiles;//文件列表
	public FigClass() {
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
	public String getFigClass_deparment() {
		return FigClass_deparment;
	}
	public void setFigClass_deparment(String figClass_deparment) {
		FigClass_deparment = figClass_deparment;
	}
	public String getFigClass_address() {
		return FigClass_address;
	}
	public void setFigClass_address(String figClass_address) {
		FigClass_address = figClass_address;
	}
	public String getFigClass_start_date() {
		return FigClass_start_date;
	}
	public void setFigClass_start_date(String figClass_start_date) {
		FigClass_start_date = figClass_start_date;
	}
	public String getFigClass_end_date() {
		return FigClass_end_date;
	}
	public void setFigClass_end_date(String figClass_end_date) {
		FigClass_end_date = figClass_end_date;
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
	public String getFigClass_pernum() {
		return FigClass_pernum;
	}
	public void setFigClass_pernum(String figClass_pernum) {
		FigClass_pernum = figClass_pernum;
	}
	public String getFigClass_phone() {
		return FigClass_phone;
	}
	public void setFigClass_phone(String figClass_phone) {
		FigClass_phone = figClass_phone;
	}
	public String getFigClass_person() {
		return FigClass_person;
	}
	public void setFigClass_person(String figClass_person) {
		FigClass_person = figClass_person;
	}
	public String getFigClass_status() {
		return FigClass_status;
	}
	public void setFigClass_status(String figClass_status) {
		FigClass_status = figClass_status;
	}
	public String getFigClass_creater() {
		return FigClass_creater;
	}
	public void setFigClass_creater(String figClass_creater) {
		FigClass_creater = figClass_creater;
	}
	public String getFigClass_createtime() {
		return FigClass_createtime;
	}
	public void setFigClass_createtime(String figClass_createtime) {
		FigClass_createtime = figClass_createtime;
	}
	public String getFigClass_updater() {
		return FigClass_updater;
	}
	public void setFigClass_updater(String figClass_updater) {
		FigClass_updater = figClass_updater;
	}
	public String getFigClass_updatetime() {
		return FigClass_updatetime;
	}
	public void setFigClass_updatetime(String figClass_updatetime) {
		FigClass_updatetime = figClass_updatetime;
	}
	public String getFigClass_isdelete() {
		return FigClass_isdelete;
	}
	public void setFigClass_isdelete(String figClass_isdelete) {
		FigClass_isdelete = figClass_isdelete;
	}
	public String getFigClass_numstatus() {
		return FigClass_numstatus;
	}
	public void setFigClass_numstatus(String figClass_numstatus) {
		FigClass_numstatus = figClass_numstatus;
	}
	public String getFigClass_caogery() {
		return FigClass_caogery;
	}
	public void setFigClass_caogery(String figClass_caogery) {
		FigClass_caogery = figClass_caogery;
	}
	public String getFigClass_outline() {
		return FigClass_outline;
	}
	public void setFigClass_outline(String figClass_outline) {
		FigClass_outline = figClass_outline;
	}
	public List<Figfile> getFigFiles() {
		return figFiles;
	}
	public void setFigFiles(List<Figfile> figFiles) {
		this.figFiles = figFiles;
	}
	
}
