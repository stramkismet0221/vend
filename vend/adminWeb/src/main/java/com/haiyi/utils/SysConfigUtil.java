package com.haiyi.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
   * 
   * @ClassName: SysConfigUtil
   * @Company: 麦子科技
   * @Description: TODO
   * @author 技术部-谢维乐
   * @date 2016年7月21日上午11:17:37
   *
 */

public class SysConfigUtil {
	private final static Logger logger = LoggerFactory.getLogger(SysConfigUtil.class);
	private static final Properties properties;
	
	static {
		properties = new Properties();
		InputStream is = SysConfigUtil.class.getClassLoader().getResourceAsStream("properties/sysConfig.properties");
		try {
			properties.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
		}
	}
	
	public static Object getValue(String key) {
		return properties.getProperty(key);
	}
}