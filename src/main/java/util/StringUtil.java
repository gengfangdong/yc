package util;

public class StringUtil {
	public static Boolean isblack(String obj){
		if(obj == null ||"".equals(obj)){
			return true;
		}
		else
			return false;
	}
}
