import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequestMapping("/api")
public class MyRestController {

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello from Spring Boot REST controller!";
    }
    
    @GetMapping("/status")
    public String getStatus() {
        return "Service is running";
    }
}