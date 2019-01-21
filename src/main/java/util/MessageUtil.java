package util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;

import entity.Message;





public class MessageUtil {
	private static final String URL="https://api.mysubmail.com/message/send";
	public static final MediaType JSON=MediaType.parse("application/json; charset=utf-8");
	public static String httpPost(String phone,String content) throws IOException {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("appid", "31470");
		map.put("to", phone);
		map.put("content", "【领税】"+content);
		map.put("signature", "1670d2d8a7d8d7d17780dfbec4011f89");
        OkHttpClient httpClient = new OkHttpClient();
        //RequestBody requestBody = RequestBody.create(JSON, new Gson().toJson(map));
        //Request request = new Request.Builder().url(URL).post(requestBody).build();
        //Response response = httpClient.newCall(request).execute();
        //String resultjson = response.body().string();
        //Message message = new Gson().fromJson(resultjson, Message.class);
        //if("error".equals(message.getStatus())){
        	//return "0";
        //}
        //System.out.println(new JSONObject(map).toString());
        return "1";
    }
	public static void main(String[] args) {
		try {
			MessageUtil.httpPost("15732186819", "测试短信!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
