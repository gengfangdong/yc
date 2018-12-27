package entity;

import java.io.Serializable;
import java.util.List;

/*
Freeco_ID	N	VARCHAR2(64)	N			课程定制id
Freeco_NAME	N	VARCHAR2(100)	N			课程定制班级名称
Freeco_DATA	N	VARCHAR2(100)	N			课程定制举办日期
Freeco_PERNUM	N	VARCHAR2(10)	N			课程定制计划参加人数
Freeco_ADDRESS	N	VARCHAR2(100)	N			课程定制举办地点
Freeco_PERSON	N	VARCHAR2(100)	N			课程定制联系人
Freeco_PHONE	N	VARCHAR2(30)	N			课程定制联系电话
Freeco_CREATER	N	VARCHAR2(64)	N			课程定制创建人
Freeco_CREATETIME	N	VARCHAR2(100)	N			课程定制创建时间
Freeco_UPDATER	N	VARCHAR2(64)	N			课程定制修改人
Freeco_UPDATETIME	N	VARCHAR2(100)	N			课程定制修改时间
Freeco_ISDELETE	N	VARCHAR2(2)	N			课程定制是否删除 0 为未删除  1为删除
Freeco_STATUS	N	VARCHAR2(2)	N			课程定制状态0为未审核1为审核通过2为审核未通过3为开班中4结课
Freeco_OUTLINE	N	VARCHAR2(500)	N			课程定制大纲
FREECO_GAOERY
FREECO_NUMFILE
 * */
public class Free_constom implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6071573654417951325L;
	private String Freeco_id;//课程定制id
	private String Freeco_name;//课程定制班级名称
	private String Freeco_data;//课程定制举办日期
	private String Freeco_datanum;//举办天数
	private String Freeco_pernum;//课程定制计划参加人数
	private String Freeco_address;//课程定制举办地点
	private String Freeco_person;//课程定制联系人
	private String Freeco_phone;//课程定制联系电话
	private String Freeco_creater;//课程定制创建人
	private String Freeco_createtime;//课程定制创建时间
	private String Freeco_updater;//课程定制修改人
	private String Freeco_updatetime;//课程定制修改时间
	private String Freeco_isdelete;//课程定制是否删除 0 为未删除  1为删除
	private String Freeco_status;//课程定制状态0为未审核1为审核通过2为审核未通过3为开班中4结课
	private String Freeco_outline;//课程定制大纲
	private String Freeco_gaoery;//分类 0为课程1为方案2为自由
	private String Freeco_numfile;//是否长传名单 0为未上传 1为已上传
	private List<Constomfile> constomFiles;//文件list  不在数据库存储
	public Free_constom() {
		super();
	}
	public String getFreeco_id() {
		return Freeco_id;
	}
	public void setFreeco_id(String freeco_id) {
		Freeco_id = freeco_id;
	}
	public String getFreeco_name() {
		return Freeco_name;
	}
	public void setFreeco_name(String freeco_name) {
		Freeco_name = freeco_name;
	}
	public String getFreeco_data() {
		return Freeco_data;
	}
	public void setFreeco_data(String freeco_data) {
		Freeco_data = freeco_data;
	}
	public String getFreeco_pernum() {
		return Freeco_pernum;
	}
	public void setFreeco_pernum(String freeco_pernum) {
		Freeco_pernum = freeco_pernum;
	}
	public String getFreeco_address() {
		return Freeco_address;
	}
	public void setFreeco_address(String freeco_address) {
		Freeco_address = freeco_address;
	}
	public String getFreeco_person() {
		return Freeco_person;
	}
	public void setFreeco_person(String freeco_person) {
		Freeco_person = freeco_person;
	}
	public String getFreeco_phone() {
		return Freeco_phone;
	}
	public void setFreeco_phone(String freeco_phone) {
		Freeco_phone = freeco_phone;
	}
	public String getFreeco_creater() {
		return Freeco_creater;
	}
	public void setFreeco_creater(String freeco_creater) {
		Freeco_creater = freeco_creater;
	}
	public String getFreeco_createtime() {
		return Freeco_createtime;
	}
	public void setFreeco_createtime(String freeco_createtime) {
		Freeco_createtime = freeco_createtime;
	}
	public String getFreeco_updater() {
		return Freeco_updater;
	}
	public void setFreeco_updater(String freeco_updater) {
		Freeco_updater = freeco_updater;
	}
	public String getFreeco_updatetime() {
		return Freeco_updatetime;
	}
	public void setFreeco_updatetime(String freeco_updatetime) {
		Freeco_updatetime = freeco_updatetime;
	}
	public String getFreeco_isdelete() {
		return Freeco_isdelete;
	}
	public void setFreeco_isdelete(String freeco_isdelete) {
		Freeco_isdelete = freeco_isdelete;
	}
	public String getFreeco_status() {
		return Freeco_status;
	}
	public void setFreeco_status(String freeco_status) {
		Freeco_status = freeco_status;
	}
	public String getFreeco_outline() {
		return Freeco_outline;
	}
	public void setFreeco_outline(String freeco_outline) {
		Freeco_outline = freeco_outline;
	}
	public String getFreeco_gaoery() {
		return Freeco_gaoery;
	}
	public void setFreeco_gaoery(String freeco_gaoery) {
		Freeco_gaoery = freeco_gaoery;
	}
	public String getFreeco_numfile() {
		return Freeco_numfile;
	}
	public void setFreeco_numfile(String freeco_numfile) {
		Freeco_numfile = freeco_numfile;
	}
	public String getFreeco_datanum() {
		return Freeco_datanum;
	}
	public void setFreeco_datanum(String freeco_datanum) {
		Freeco_datanum = freeco_datanum;
	}
	public List<Constomfile> getConstomFiles() {
		return constomFiles;
	}
	public void setConstomFiles(List<Constomfile> constomFiles) {
		this.constomFiles = constomFiles;
	}
	
	
}
