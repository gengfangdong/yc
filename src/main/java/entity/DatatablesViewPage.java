package entity;

import java.io.Serializable;
import java.util.List;
/**
 *   dataTables 的数据表格
 * @author my
 *
 * @param <T>
 */
public class DatatablesViewPage<T> implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8344279184198408746L;
	private int draw;
	private List<T> data;
    private int recordsTotal;   
    private int recordsFiltered;
    
    
	public DatatablesViewPage() {
		super();
	}
	
	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public int getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	
    
    
}
