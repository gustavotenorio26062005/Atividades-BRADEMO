import java.util.List;

public interface PostagemService {
    List<Postagem> listAll();
    Postagem findById(Long id);
    void save(Postagem post);
    boolean update(Long id, Postagem post);
    boolean delete(Long id);
}