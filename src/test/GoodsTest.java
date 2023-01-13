package test;
import java.util.List;

import dao.GoodsDao;
import bean.Goods;
import org.junit.Test;

public class GoodsTest {
	public void findUserByIdTest() {
		Integer userId = 1;
		Goods goods = GoodsDao.findGoodsById(userId);
		System.out.println("@Test----findUserByIdTest():");
		System.out.println(goods.valueAll());
	}
	
//	@Test
	public void getUserList() {
		List<Goods> list = GoodsDao.getGoodsList();
		System.out.println("@Test----getUserList():");
		
		for (Goods goods : list) {
			System.out.println(goods.valueAll());		
		}
	}
	
	//鐢╩ain()娴嬭瘯
	public static void main(String[] args) {
		List<Goods> list = GoodsDao.getGoodsList();
		System.out.println("main()----getUserList():");
		
		for (Goods goods : list) {
			System.out.println(goods.valueAll());		
		}
	}
}
