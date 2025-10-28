import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequestMapping("/api")
public class MyRestController_73829 {
    
    @GetMapping("/hello")
    public String getHello() {
        return "Hello from Spring Boot REST controller!";
    }
    
    @GetMapping("/data")
    public String getData() {
        return "This is sample data from the GET endpoint.";
    }
}