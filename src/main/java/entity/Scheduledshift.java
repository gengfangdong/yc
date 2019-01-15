package entity;

import java.io.Serializable;
import java.util.List;
		

public class Scheduledshift implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3157241306168536673L;
	private String Scheduled_id; //自主报名id
	private String Scheduled_name;//自主报名名字
	private String Scheduled_initiator; //发起单位
	private String Scheduled_address; //培训开课地点
	private String Scheduled_start;//报名开始日期
	private String Scheduled_end;//报名截止日期
	private String Scheduled_class_start;//预计开课日期
	private String Scheduled_class_end;//预计结课日期
	private String Scheduled_class_pnumber;//班级容纳人数
	private String Scheduled_class_context;//课程大纲
	private String Scheduled_other_context;//其他相关信息
	private String Scheduled_status;//状态  0为未开始 1为进行中 2为未开课 3为开课中 4为结课
	private String isdelete;//是否删除
	private String creater;//创建人
	private String createtime;//创建时间
	private String Scheduled_dname;//单位名称 SCHEDULED_DNAME
	private String Scheduled_yh;//银行 SCHEDULED_YH
	private String Scheduled_zh;//账号 SCHEDULED_ZH
	private List<Scheduledfile> scheduleds;//不映射表字段
	public Scheduledshift() {
		super();
	}
	public Scheduledshift(String scheduled_id, String scheduled_name, String scheduled_initiator,
			String scheduled_address, String scheduled_start, String scheduled_end, String scheduled_class_start,
			String scheduled_class_end, String scheduled_class_pnumber, String scheduled_class_context,
			String scheduled_other_context, String scheduled_status, String isdelete, String creater, String createtime,
			String scheduled_dname, String scheduled_yh, String scheduled_zh, List<Scheduledfile> scheduleds) {
		super();
		Scheduled_id = scheduled_id;
		Scheduled_name = scheduled_name;
		Scheduled_initiator = scheduled_initiator;
		Scheduled_address = scheduled_address;
		Scheduled_start = scheduled_start;
		Scheduled_end = scheduled_end;
		Scheduled_class_start = scheduled_class_start;
		Scheduled_class_end = scheduled_class_end;
		Scheduled_class_pnumber = scheduled_class_pnumber;
		Scheduled_class_context = scheduled_class_context;
		Scheduled_other_context = scheduled_other_context;
		Scheduled_status = scheduled_status;
		this.isdelete = isdelete;
		this.creater = creater;
		this.createtime = createtime;
		Scheduled_dname = scheduled_dname;
		Scheduled_yh = scheduled_yh;
		Scheduled_zh = scheduled_zh;
		this.scheduleds = scheduleds;
	}

	public String getScheduled_dname() {
		return Scheduled_dname;
	}

	public void setScheduled_dname(String scheduled_dname) {
		Scheduled_dname = scheduled_dname;
	}

	public String getScheduled_yh() {
		return Scheduled_yh;
	}

	public void setScheduled_yh(String scheduled_yh) {
		Scheduled_yh = scheduled_yh;
	}

	public String getScheduled_zh() {
		return Scheduled_zh;
	}

	public void setScheduled_zh(String scheduled_zh) {
		Scheduled_zh = scheduled_zh;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getScheduled_id() {
		return Scheduled_id;
	}
	public void setScheduled_id(String scheduled_id) {
		Scheduled_id = scheduled_id;
	}
	public String getScheduled_initiator() {
		return Scheduled_initiator;
	}
	public void setScheduled_initiator(String scheduled_initiator) {
		Scheduled_initiator = scheduled_initiator;
	}
	public String getScheduled_address() {
		return Scheduled_address;
	}
	public void setScheduled_address(String scheduled_address) {
		Scheduled_address = scheduled_address;
	}
	public String getScheduled_start() {
		return Scheduled_start;
	}
	public void setScheduled_start(String scheduled_start) {
		Scheduled_start = scheduled_start;
	}
	public String getScheduled_end() {
		return Scheduled_end;
	}
	public void setScheduled_end(String scheduled_end) {
		Scheduled_end = scheduled_end;
	}
	public String getScheduled_class_start() {
		return Scheduled_class_start;
	}
	public void setScheduled_class_start(String scheduled_class_start) {
		Scheduled_class_start = scheduled_class_start;
	}
	public String getScheduled_class_end() {
		return Scheduled_class_end;
	}
	public void setScheduled_class_end(String scheduled_class_end) {
		Scheduled_class_end = scheduled_class_end;
	}
	public String getScheduled_class_pnumber() {
		return Scheduled_class_pnumber;
	}
	public void setScheduled_class_pnumber(String scheduled_class_pnumber) {
		Scheduled_class_pnumber = scheduled_class_pnumber;
	}
	public String getScheduled_class_context() {
		return Scheduled_class_context;
	}
	public void setScheduled_class_context(String scheduled_class_context) {
		Scheduled_class_context = scheduled_class_context;
	}
	public String getScheduled_other_context() {
		return Scheduled_other_context;
	}
	public void setScheduled_other_context(String scheduled_other_context) {
		Scheduled_other_context = scheduled_other_context;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}



	public String getScheduled_status() {
		return Scheduled_status;
	}



	public void setScheduled_status(String scheduled_status) {
		Scheduled_status = scheduled_status;
	}


	public List<Scheduledfile> getScheduleds() {
		return scheduleds;
	}


	public void setScheduleds(List<Scheduledfile> scheduleds) {
		this.scheduleds = scheduleds;
	}


	public String getScheduled_name() {
		return Scheduled_name;
	}

	public void setScheduled_name(String scheduled_name) {
		Scheduled_name = scheduled_name;
	}
	
	
	
}
