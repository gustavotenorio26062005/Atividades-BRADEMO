import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/posts")
public class PostagemController {

    @Autowired
    private PostagemService postagemService;

    @GetMapping
    public List<Postagem> getAll() {
        return postagemService.listAll();
    }

    @PostMapping
    public ResponseEntity<Postagem> create(@RequestBody Postagem post) {
        postagemService.save(post);
        return ResponseEntity.created(URI.create("/posts/" + post.getId())).body(post);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Postagem> getById(@PathVariable Long id) {
        Postagem p = postagemService.findById(id);
        return (p != null) ? ResponseEntity.ok(p) : ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        return postagemService.delete(id) ? ResponseEntity.ok().build() : ResponseEntity.notFound().build();
    }
}