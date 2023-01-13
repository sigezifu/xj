package dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import bean.Goods;
import util.DataBaseUtils;

public class GoodsDao {
	private static String 				resource 	= "mybatis-config.xml";	//MyBatis的配置文件
	private static InputStream 			inputStream = null;					//输入流
	private static SqlSessionFactory 	factory 	= null;					//SqlSession工厂

	private static SqlSession getSqlSession() {								//生成SqlSession对象 
		SqlSession sqlSession = null; 

		try {
			if (inputStream == null) {
				inputStream = Resources.getResourceAsStream(resource); 
			}
			if (factory == null) {
				factory = new SqlSessionFactoryBuilder().build(inputStream);
			}
			
			sqlSession = factory.openSession();
			
		} catch (Exception e) { 
			System.err.println("\r\n创建数据库连接失败: " + e.getMessage() + "\r\n");	//输出错误信息到控制台
			
			try {
				sqlSession.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}	
			try {
				inputStream.close();
				inputStream = null;
			} catch (IOException e3) {
				e3.printStackTrace();
			} 		
		}
		
		return sqlSession;
	}  

	public static Goods findGoodsById(Integer userId) {
		Goods goods = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSession();		//生成Session对象 
												//调用mapper文件中的SQL语句进行数据操作											
			goods = sqlSession.selectOne("com.user.mapper.UserMapper.findUserById", userId); 
			//sqlSession.commit();				//查询不需要commit()
		} catch (Exception e) { 
			System.err.println("\r\n根据id查询数据失败: " + e.getMessage() + "\r\n");
		} finally { 	
			sqlSession.close(); 				//关闭会话 
		}
		
		return goods;
	}   

	public static Goods findGoodsByUsername(String username) {
		Goods goods = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSession();
			goods = sqlSession.selectOne("com.user.mapper.UserMapper.findUserByUsername", username);
			//sqlSession.commit();				//查询不需要commit()
		} catch (Exception e) { 
			System.err.println("\r\n根据姓名模糊查询数据失败: " + e.getMessage() + "\r\n");
		} finally { 	
			sqlSession.close(); 				//关闭会话 
		}
		
		return goods;
	} 

	public static List<Goods> findGoods(String search) {
		List<Goods> list = null;					//用于保存查询结果集
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSession();
			list = sqlSession.selectList("com.user.mapper.UserMapper.findUsers", search);  
			//sqlSession.commit();				//查询不需要commit()
		} catch (Exception e) { 
			System.err.println("\r\n根据字段模糊查询数据失败: " + e.getMessage() + "\r\n");
		} finally { 	
			sqlSession.close(); 				//关闭会话 
		}
		
		return list;
	} 

	public static List<Goods> getGoodsList() {
		List<Goods> list = null;					//用于保存查询结果集
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSession();
			list = sqlSession.selectList("com.user.mapper.UserMapper.getUserList");  
			//sqlSession.commit();				//查询不需要commit()
		} catch (Exception e) { 
			System.err.println("\r\n查询表中所有数据失败: " + e.getMessage() + "\r\n");
		} finally { 	
			sqlSession.close(); 				//关闭会话 
		}
		
		return list;
	} 
	
	public static int addGoods(Goods user) { 
		int userId = 0;
		SqlSession sqlSession = null;

		try {
			sqlSession = getSqlSession();
			sqlSession.insert("com.user.mapper.UserMapper.addUser", user);
			sqlSession.commit();				//新添、修改、删除时需要它
			userId = user.getUserId();
			
		} catch (Exception e) { 
			System.err.println("\r\n新添数据失败: " + e.getMessage() + "\r\n");
			sqlSession.rollback(); 				//出现异常回滚事务
		} finally { 	
			sqlSession.close(); 				//关闭会话
		}
		
		return userId;
	}  
	
	public static int updateGoods(Goods user) { 
		int count = 0;
		SqlSession sqlSession = null;

		try {
			sqlSession = getSqlSession();
			count = sqlSession.update("com.user.mapper.UserMapper.updateUser", user);
			sqlSession.commit();				//新添、修改、删除时需要它
			
		} catch (Exception e) { 
			System.err.println("\r\n修改数据失败: " + e.getMessage() + "\r\n");
			sqlSession.rollback(); 				//出现异常回滚事务
		} finally { 	
			sqlSession.close(); 				//关闭会话
		}
		
		return count;
	} 
	
	public static int deleteGoods(Integer userId) { 
		int count = 0;
		SqlSession sqlSession = null;

		try {
			sqlSession = getSqlSession();
			count = sqlSession.delete("com.user.mapper.UserMapper.deleteUser", userId);
			sqlSession.commit();				//新添、修改、删除时需要它
			
		} catch (Exception e) { 
			System.err.println("\r\n删除数据失败: " + e.getMessage() + "\r\n");
			sqlSession.rollback(); 				//出现异常回滚事务
		} finally { 	
			sqlSession.close(); 				//关闭会话
		}
		
		return count;
	}
	
	
	//// ----------------------以下为测试动态SQL的方法
	 

	public static List<Goods> findGoodsByUsernameAndJob(Goods user) {
		List<Goods> list = null;					//用于保存查询结果集
		SqlSession sqlSession = null;
		
		try {
			sqlSession = getSqlSession();
			list = sqlSession.selectList("com.user.mapper.UserMapper.findUsersByUsernameAndJob", user);  
			//sqlSession.commit();				//查询不需要commit()
		} catch (Exception e) { 
			System.err.println("\r\n根据字段模糊查询数据失败: " + e.getMessage() + "\r\n");
		} finally { 	
			sqlSession.close(); 				//关闭会话 
		}
		
		return list;
	} 
}
