package test;

import java.io.*;
import java.util.*;

/**
 * 读取Properties文件的测试类
 */
public class TestProperties {
	public static void main(String[] args) {
		InputStream inputStream =  TestProperties.class.getClassLoader().getResourceAsStream("jdbc.properties");
		Properties p = new Properties();
		try {
			p.load(inputStream);
			System.out.println(p);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(p.getProperty("db.username"));
		System.out.println(p.getProperty("db.password"));
		System.out.println(p.getProperty("db.dataBaseName"));
	}
}