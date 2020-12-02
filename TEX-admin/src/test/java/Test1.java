import com.zhongger.web.controller.common.CommonController;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Zhong Mingyi on 2020/12/2.
 */

public class Test1 {

    @Autowired
    private static CommonController captchaProducer;

    public static void main(String[] args) {
        System.out.println(captchaProducer);
    }


}
