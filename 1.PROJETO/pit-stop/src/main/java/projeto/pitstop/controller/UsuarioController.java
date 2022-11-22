package projeto.pitstop.controller;

import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import projeto.pitstop.model.Usuario;
import projeto.pitstop.repository.UsuarioRepository;

@RestController
@RequestMapping("/user")
public class UsuarioController {
	
	//INICIALIZAÇÃO DO LOGGER
	final Logger log = LoggerFactory.getLogger(UsuarioController.class);
	
	@Autowired
	private UsuarioRepository userRepository;

	//CRUD
	
	//METODO CREATE
	@PostMapping
	public void create(@RequestBody Usuario user) {
		log.info("Gravando os dados...");
		userRepository.save(user);	
		log.info("O usuário {}, foi salvo com sucesso!", user.getNome());	
	}
	
	//METODO READ
	@GetMapping
	public List<Usuario> findAll(){
		
		log.info("Buscando os dados...");
		return userRepository.findAll();
	}
	
	//METODO BUSCA POR ID
	@GetMapping(path = "/userbyid")
	public Optional<Usuario> findById(@RequestBody Usuario user) {
		int id = user.getIdUser();
		
		log.info("Buscando os dados...");
		return userRepository.findById(id);
	}
	
	/*************IMPLEMENTAR COM BUSCA POR ID****************/
	//METODO UPDATE
	@PutMapping
	public void update(@RequestBody Usuario user) {
		if(user.getIdUser() > 0) {
			userRepository.save(user);
			log.info("Dados atualizados com sucesso!");
		}
	}
	
	/*************IMPLEMENTAR COM BUSCA POR ID****************/
	//METODO DELETE
	@DeleteMapping
	public void delete(@RequestBody Usuario user) {
		userRepository.delete(user);
		log.info("O usuário {}, foi deletado com sucesso!", user.getNome());
	}
	
}