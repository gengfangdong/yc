package entity;

import java.io.Serializable;

public class ScheduledShiftShow implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8593147654335257929L;
	private Scheduledshift scheduledshift;
	private String dataNumber;
	private String create_status;
	private String number;
	private String suuid;
	private String numfilestatus;//是否上传名单
	public ScheduledShiftShow() {
		super();
	}
	public ScheduledShiftShow(Scheduledshift scheduledshift, String dataNumber, String create_status, String number,
			String suuid) {
		super();
		this.scheduledshift = scheduledshift;
		this.dataNumber = dataNumber;
		this.create_status = create_status;
		this.number = number;
		this.suuid = suuid;
	}
	public Scheduledshift getScheduledshift() {
		return scheduledshift;
	}
	public void setScheduledshift(Scheduledshift scheduledshift) {
		this.scheduledshift = scheduledshift;
	}
	public String getCreate_status() {
		return create_status;
	}
	public void setCreate_status(String create_status) {
		this.create_status = create_status;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getSuuid() {
		return suuid;
	}
	public void setSuuid(String suuid) {
		this.suuid = suuid;
	}
	public String getDataNumber() {
		return dataNumber;
	}
	public void setDataNumber(String dataNumber) {
		this.dataNumber = dataNumber;
	}
	public String getNumfilestatus() {
		return numfilestatus;
	}
	public void setNumfilestatus(String numfilestatus) {
		this.numfilestatus = numfilestatus;
	}

	
}
