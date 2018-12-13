package util;

import java.util.UUID;

public class UUIDUtil {
	public static String getUUid(String id){
		String uuid = UUID.randomUUID().toString().replaceAll("-","");  
        return id+uuid;
	}
	public static void main(String[] args) {
		System.out.println(UUIDUtil.getUUid("s"));
	}
}
