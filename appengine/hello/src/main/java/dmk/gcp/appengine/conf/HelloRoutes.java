package dmk.gcp.appengine.conf;

import dmk.gcp.appengine.handlers.HelloHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.config.EnableWebFlux;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.ServerResponse;

import static org.springframework.web.reactive.function.server.RequestPredicates.GET;
import static org.springframework.web.reactive.function.server.RouterFunctions.route;

@EnableWebFlux
@Configuration
public class HelloRoutes {

    @Bean
    HelloHandler helloHandler() {
        return new HelloHandler();
    }

    @Bean
    RouterFunction<ServerResponse> helloFunctionalWebflux(HelloHandler handler) {
        return route(GET("/hello"), handler::functionalHello);
    }

}
