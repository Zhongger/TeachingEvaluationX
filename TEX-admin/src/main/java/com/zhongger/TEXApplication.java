package com.zhongger;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class TEXApplication {
    public static void main(String[] args) {
        SpringApplication.run(com.zhongger.TEXApplication.class, args);
        System.out.println(" 教学评价管理系统启动成功~");
    }
}
