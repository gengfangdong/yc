package entity;

public class ScheduledshiftVo {
	private String Scheduled_id; //规定班次id
	private String Scheduled_publish;//发布时间
	private String Scheduled_name;//规定班次名字
	private String datanumber;//举办天数
	private String Scheduled_class_start;//预计开课日期
	private String Scheduled_start;//报名开始日期
	private String Scheduled_end;//报名截止日期
	private String Scheduled_class_pnumber;//班级容纳人数
	private String Scheduled_status;//状态 0为未开始 1为进行中 2为已结束
	public ScheduledshiftVo() {
		super();
	}
	public String getScheduled_id() {
		return Scheduled_id;
	}
	public void setScheduled_id(String scheduled_id) {
		Scheduled_id = scheduled_id;
	}
	public String getScheduled_name() {
		return Scheduled_name;
	}
	public void setScheduled_name(String scheduled_name) {
		Scheduled_name = scheduled_name;
	}
	public String getDatanumber() {
		return datanumber;
	}
	public void setDatanumber(String datanumber) {
		this.datanumber = datanumber;
	}
	public String getScheduled_class_start() {
		return Scheduled_class_start;
	}
	public void setScheduled_class_start(String scheduled_class_start) {
		Scheduled_class_start = scheduled_class_start;
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
	public String getScheduled_class_pnumber() {
		return Scheduled_class_pnumber;
	}
	public void setScheduled_class_pnumber(String scheduled_class_pnumber) {
		Scheduled_class_pnumber = scheduled_class_pnumber;
	}
	public String getScheduled_status() {
		return Scheduled_status;
	}
	public void setScheduled_status(String scheduled_status) {
		Scheduled_status = scheduled_status;
	}
	public String getScheduled_publish() {
		return Scheduled_publish;
	}
	public void setScheduled_publish(String scheduled_publish) {
		Scheduled_publish = scheduled_publish;
	}
	
	
	
}
