package dmk.gcp.appengine.handlers;

import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

import static org.springframework.http.MediaType.APPLICATION_JSON;
import static org.springframework.web.reactive.function.BodyInserters.fromValue;

public class HelloHandler {

    public Mono<ServerResponse> functionalHello(ServerRequest serverRequest) {
        return ServerResponse.ok().contentType(APPLICATION_JSON)
                .body(fromValue("{ \"msg\": \"Hello from functional Webflux and AppEngine!\" }"));
    }
}
