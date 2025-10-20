import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@RestController
@SpringBootApplication
public class MyController_abc123 {

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello, World!";
    }
    
    public static void main(String[] args) {
        SpringApplication.run(MyController_abc123.class, args);
    }
}