package projeto.pitstop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import projeto.pitstop.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{

}
