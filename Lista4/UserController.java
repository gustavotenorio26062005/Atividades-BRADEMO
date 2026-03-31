import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.net.URI;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/{login}")
    public ResponseEntity<User> findUser(@PathVariable("login") String login) {
        User user = userService.find(login);
        if (user != null) {
            return ResponseEntity.ok(user);
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<User> addUser(@RequestBody User newUser) {
        userService.add(newUser);
        return ResponseEntity.created(URI.create("/user/" + newUser.getLogin()))
                             .body(newUser);
    }

    @DeleteMapping("/{login}")
    public ResponseEntity<String> removeUser(@PathVariable("login") String login) {
        boolean removed = userService.remove(login);
        if (removed) {
            return ResponseEntity.ok("Remoção de informação com LOGIN " + login + " realizada");
        }
        return ResponseEntity.status(404).body("Objeto para login " + login + " não encontrado");
    }
}