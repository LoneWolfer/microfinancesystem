
import com.luning.graduation.pojo.bo.TestBo;
import com.luning.graduation.service.TestService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring-mybatis.xml", "classpath:config/spring-mvc.xml"})
@Transactional
public class BaseJunit4Test {
    @Autowired
    private TestService testService;

    private final static Logger logger = LoggerFactory.getLogger(BaseJunit4Test.class);

    @Test
    public void testJunit() {
        System.out.println("---测试Spring整合Junit4进行单元测试---");

        List<TestBo> testBoList = testService.test();
        testBoList.forEach(testBo -> {
            System.out.println("编号:" + testBo.getId() + "--" + "姓名:" + testBo.getName());
        });

        System.out.println("---测试结束---");
    }

    @Test
    public void testLogback() {
        logger.info("logback-成功了");
        logger.error("logback-成功了");
        logger.debug("logback-成功了");
    }
}
