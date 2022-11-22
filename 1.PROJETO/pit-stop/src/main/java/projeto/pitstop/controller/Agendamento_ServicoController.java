package projeto.pitstop.controller;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import projeto.pitstop.model.Agendamento_Servico;
import projeto.pitstop.repository.Agendamento_ServicoRepository;


@RestController
@RequestMapping("/servico")
public class Agendamento_ServicoController {

	@Autowired
	private Agendamento_ServicoRepository servicoRepository;

	//CRUD
	
	//METODO CREATE
	@PostMapping
	public void create(@RequestBody Agendamento_Servico servico) {
		servicoRepository.save(servico);
	}
	
	//METODO READ
	@GetMapping
	public List<Agendamento_Servico> findAll(){
		return servicoRepository.findAll();
	}
	
	//METODO BUSCA POR ID
	@GetMapping(path = "/servicobyid")
	public Optional<Agendamento_Servico> findById(@RequestBody Agendamento_Servico servico) {
		int id = servico.getIdServico();
		
		return servicoRepository.findById(id);
	}
	
	/*************IMPLEMENTAR COM BUSCA POR ID****************/
	//METODO UPDATE
	@PutMapping
	public void update(@RequestBody Agendamento_Servico servico) {
		if(servico.getIdServico() > 0) {
			servicoRepository.save(servico);
		}
	}
	
	/*************IMPLEMENTAR COM BUSCA POR ID****************/
	//METODO DELETE
	@DeleteMapping
	public void delete(@RequestBody Agendamento_Servico servico) {
		servicoRepository.delete(servico);
	}
	
}