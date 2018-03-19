import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bean.Bus;
import com.dao.IBusDao;
import com.service.IBusService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestMybatis {
	@Autowired
	private IBusService busService=null;
	
	@Autowired
	private IBusDao busDao=null;
	@Test
	public void test() {
		List<Bus> list = busDao.findByPage(8, 8);
		for(Bus bus:list) {
			System.out.println(bus.getType());
		}
		
	}
	@Test
	public void test2() {
		String str="1 2 2 2 2";
		String[] split = str.split(" ");
		System.out.println(split.toString());
	}
	
}
