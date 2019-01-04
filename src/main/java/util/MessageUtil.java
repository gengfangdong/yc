package util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class MessageUtil {
	private static final String URL="https://api.mysubmail.com/message/send";
	public static final MediaType JSON=MediaType.parse("application/json; charset=utf-8");
	public static String httpPost(String phone,String content) throws IOException {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("appid", "31172");
		map.put("to", phone);
		map.put("content", "【领税】"+content);
		map.put("signature", "03411f99ea765096a04b41fbfb1011e2");
        OkHttpClient httpClient = new OkHttpClient();
        RequestBody requestBody = RequestBody.create(JSON, new Gson().toJson(map));
        Request request = new Request.Builder().url(URL).post(requestBody).build();
        Response response = httpClient.newCall(request).execute();
        return response.body().string();
    }
	/*public static void main(String[] args) {
		try {
			MessageUtil.httpPost("15732186819", "测试短信!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
}
