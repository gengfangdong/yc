package entity;

import java.util.List;
/*
 * 拼班展示vo
 */
public class FigClassVo {
	private FigClass figClass;
	private List<Object> objects;
	public FigClassVo() {
		super();
	}
	public FigClass getFigClass() {
		return figClass;
	}
	public void setFigClass(FigClass figClass) {
		this.figClass = figClass;
	}
	public List<Object> getObjects() {
		return objects;
	}
	public void setObjects(List<Object> objects) {
		this.objects = objects;
	}
	
}
