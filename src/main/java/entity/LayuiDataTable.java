package entity;

import java.io.Serializable;
import java.util.List;
/**
 *layui的表格返回 
 */
public class LayuiDataTable<T> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5294359237722556142L;
	private int code;//返回代码
	private String msg;//信息
	private int count;//总条数
	private List<T> data;//要显示的数据
	
	public LayuiDataTable() {
		super();
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	
	
}
