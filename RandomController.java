import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RandomController {

    @GetMapping("/hello")
    public String sayHello() {
        return "Greetings from a randomly named Spring Boot Controller!";
    }
}