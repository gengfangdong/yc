package util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class PropertiesUtil {
	private static Properties props;
	synchronized static private void loadProps(){
        props = new Properties();
        InputStream in = null;
        try {

            in = PropertiesUtil.class.getClassLoader().getResourceAsStream("configAll.properties");
            //in = PropertyUtil.class.getResourceAsStream("/jdbc.properties");
            props.load(in);
        } catch (FileNotFoundException e) {
            System.out.println("jdbc.properties文件未找到");
        } catch (IOException e) {
            System.out.println("出现IOException");
        } finally {
            try {
                if(null != in) {
                    in.close();
                }
            } catch (IOException e) {
                System.out.println("jdbc.properties文件流关闭出现异常");
            }
        }
        System.out.println("加载properties文件内容完成...........");
        System.out.println("properties文件内容：" + props);
    }
	public static String getProperty(String key){
        if(null == props) {
            loadProps();
        }
        return props.getProperty(key);
    }

    public static String getProperty(String key, String defaultValue) {
        if(null == props) {
            loadProps();
        }
        return props.getProperty(key, defaultValue);
    }
}
