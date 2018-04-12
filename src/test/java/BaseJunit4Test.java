
import com.alibaba.fastjson.JSON;
import com.luning.graduation.dao.SystemMenuDao;
import com.luning.graduation.entity.CountApplyBo;
import com.luning.graduation.entity.SystemMenuBo;
import com.luning.graduation.entity.SystemUserBo;
import com.luning.graduation.service.AuthorityService;
import com.luning.graduation.service.BusinessLoanService;
import com.luning.graduation.service.SystemUserService;
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
    private SystemUserService systemUserService;
    @Autowired
    private BusinessLoanService businessLoanService;
    @Autowired
    private AuthorityService authorityService;

    private final static Logger logger = LoggerFactory.getLogger(BaseJunit4Test.class);

    @Test
    public void testJunit() {
        System.out.println("---测试Spring整合Junit4进行单元测试---");

        List<SystemUserBo> testBoList = systemUserService.listSystemUser();
        testBoList.forEach(testBo -> {
            System.out.println("编号:" + testBo.getId() + "--" + "账号:" + testBo.getUserName());
        });

        System.out.println("---测试结束---");
    }

    @Test
    public void testCount(){
        System.out.println("---测试Spring整合Junit4进行单元测试---");

        List<CountApplyBo> countApplyBos = businessLoanService.countByDay();
        System.out.println(JSON.toJSONString(countApplyBos));

        System.out.println("---测试结束---");
    }

    @Test
    public void testAuth(){
        System.out.println("---测试Spring整合Junit4进行单元测试---");

        List<SystemMenuBo> systemMenuBoList = authorityService.listMenuByUserId(1L);
        System.out.println(JSON.toJSONString(systemMenuBoList));

        System.out.println("---测试结束---");
    }

    @Test
    public void testLogback() {
        logger.info("logback-成功了");
        logger.error("logback-成功了");
        logger.debug("logback-成功了");
    }
}
