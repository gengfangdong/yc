package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	public static Boolean isblack(String obj){
		if(obj == null ||"".equals(obj)){
			return true;
		}
		else
			return false;
	}
	
	public int getSub(String a,String b){
		int an = 0;
		int bn = 0;
		try{
		 an = Integer.getInteger(a);
		 bn = Integer.getInteger(b);
		}catch(NumberFormatException n){
			n.printStackTrace();
			return -9999;
		}
		return bn-an;
	}
	
	public static int getDataSub(String date1,String date2){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		int sub = 0;
		try {
			Date b = df.parse(date2);
			Date a = df.parse(date1);
			int sub1 = longOfTwoDate(a,b);
			sub = sub1;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sub;
	}
	
	public static int longOfTwoDate(Date first, Date second)
			throws ParseException {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(first);
		int cnt = 0;
		while (calendar.getTime().compareTo(second) != 0) {
			calendar.add(Calendar.DATE, 1);
			cnt++;
		}
		return cnt;
	}
}
