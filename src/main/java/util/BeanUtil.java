package util;

import java.lang.reflect.Field;

//将两个对象一样的属性复制过去  -----草
//object1  源   object2  目的
public class BeanUtil {
	
	/**
	 * 方法判断
	 * @param object1
	 * @param object2
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static void Copy(Object object1,Object object2) throws IllegalArgumentException, IllegalAccessException{
		//获取类
		Class<? extends Object> clazz1 = object1.getClass();
		Class<? extends Object> clazz2 = object2.getClass();
		//获取所有属性
		Field[] fields1 = clazz1.getDeclaredFields();
		Field[] fields2 = clazz2.getDeclaredFields();
		for (Field field : fields1) {
			field.setAccessible(true);
			if(!"serialVersionUID".equals(field.getName())){
				String name = field.getName();
				Object object = field.get(object1);
				Class<?> type = field.getType();
				
				if(object!=null){
					for (Field field2 : fields2) {
						field2.setAccessible(true);
						if(name.equals(field2.getName())){
							if(type.equals(field2.getType())){
								field2.set(object2, object);
							}
						}
					}
				}
				
				
			}
		}
		//System.out.println(object2.toString());
		
	}
	/*public static void main(String[] args) {
		Course course = new Course();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String About_Createtime = df.format(new Date());// Date()为获取当前系统时间，也可使用当前时间戳
		course.setCourse_id(UUIDUtil.getUUid("course"));
		course.setCreatetime(About_Createtime);
		course.setFirst_course("1");
		course.setCourse_context("context");
		course.setIsDelete("0");
		course.setSecond_course("2");
		course.setThird_course("3");
		course.setCreater("admin");
		try {
			Copy(course, new CourseVo());
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
}
