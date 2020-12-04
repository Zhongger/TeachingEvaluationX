package com.zhongger;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class TEXApplication {
    public static void main(String[] args) {
        SpringApplication.run(com.zhongger.TEXApplication.class, args);
        System.out.println("\n" +
                "  _______ ________   __     _____ _    _  _____ _____ ______  _____ _____ \n" +
                " |__   __|  ____\\ \\ / /    / ____| |  | |/ ____/ ____|  ____|/ ____/ ____|\n" +
                "    | |  | |__   \\ V /____| (___ | |  | | |   | |    | |__  | (___| (___  \n" +
                "    | |  |  __|   > <______\\___ \\| |  | | |   | |    |  __|  \\___ \\\\___ \\ \n" +
                "    | |  | |____ / . \\     ____) | |__| | |___| |____| |____ ____) |___) |\n" +
                "    |_|  |______/_/ \\_\\   |_____/ \\____/ \\_____\\_____|______|_____/_____/ \n" +
                "                                                                          \n" +
                "                                                                          \n");
    }
}
