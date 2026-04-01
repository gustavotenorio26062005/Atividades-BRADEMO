import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class PostagemServiceImpl implements PostagemService {
    private List<Postagem> posts = new ArrayList<>();

    @Override
    public List<Postagem> listAll() { return posts; }

    @Override
    public Postagem findById(Long id) {
        return posts.stream().filter(p -> p.getId().equals(id)).findFirst().orElse(null);
    }

    @Override
    public void save(Postagem post) { posts.add(post); }

    @Override
    public boolean update(Long id, Postagem post) {
        Postagem existing = findById(id);
        if (existing != null) {
            existing.setTitulo(post.getTitulo());
            existing.setConteudo(post.getConteudo());
            return true;
        }
        return false;
    }

    @Override
    public boolean delete(Long id) {
        return posts.removeIf(p -> p.getId().equals(id));
    }
}