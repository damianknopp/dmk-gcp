package dmk.gcp.appengine;

import dmk.gcp.appengine.conf.HelloRoutes;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@Import({HelloRoutes.class})
@PropertySource("classpath:application-development.properties")
@ComponentScan(basePackages = {"dmk.gcp.appengine"})
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}