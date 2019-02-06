package br.com.rubensrodrigues.imobiliaria.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.rubensrodrigues.imobiliaria.dao.CorretorDAO;
import br.com.rubensrodrigues.imobiliaria.enumerated.UF;
import br.com.rubensrodrigues.imobiliaria.models.Corretor;
import br.com.rubensrodrigues.imobiliaria.models.Foto;
import br.com.rubensrodrigues.imobiliaria.models.Role;
import br.com.rubensrodrigues.imobiliaria.util.TratadorImagens;

@Controller
@RequestMapping("/corretor")
public class CorretorController {
	
	@Autowired
	private CorretorDAO corretorDAO;
	
	@Autowired
	private TratadorImagens tratador;
	
	@RequestMapping("/formulario")
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("corretor/formulario");
		modelAndView.addObject("listaUF", UF.values());
		
		return modelAndView;
	}
	
	@RequestMapping("/alterar/{id}")
	public ModelAndView alterar(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("corretor/formulario");
		
		modelAndView.addObject("listaUF", UF.values());
		modelAndView.addObject("corretor", corretorDAO.find(id));
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/salvar", method = RequestMethod.POST)
	public ModelAndView salvar(Corretor corretor, MultipartFile arquivo, String nomeRole) throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/corretor/lista");
		
		if(corretor.getId() == null)
			criarCorretor(corretor, arquivo, nomeRole);
		else
			alterarCorretor(corretor, arquivo, nomeRole);
		
		return modelAndView;
	}
	
	@RequestMapping("/lista")
	public ModelAndView lista() {
		ModelAndView modelAndView = new ModelAndView("corretor/lista");
		
		List<Corretor> lista = corretorDAO.lista();
		modelAndView.addObject("corretores", lista);
		
		return modelAndView;
	}
	
	
	
	private void criarCorretor(Corretor corretor, MultipartFile arquivo, String nomeRole) throws IllegalStateException, IOException {
		if(!arquivo.isEmpty()){			
			String nomeFoto = tratador.geraNome();
			tratador.salvarFotoCorretor(arquivo, nomeFoto);
			Foto novaFoto = new Foto(nomeFoto);
			corretor.setFoto(novaFoto);
		}
		
		Role role = new Role(nomeRole.replace(",", ""));
		List<Role> roles = new ArrayList<Role>();
		roles.add(role);
		
		corretor.setRoles(roles);
		corretor.setSenha("$2a$10$Am99vPgOrxymS3Dua6Nsa.f.jXqNP0Y48Jp539UaysbaK2pg77EdK"); //Senha BCrypt para 123456
		
		corretorDAO.salvar(corretor);
	}
	
	private void alterarCorretor(Corretor corretor, MultipartFile arquivo, String nomeRole) throws IllegalStateException, IOException {
		if(!arquivo.isEmpty()){			
			String nomeFoto = tratador.geraNome();
			tratador.salvarFotoCorretor(arquivo, nomeFoto);
			Foto novaFoto = new Foto(nomeFoto);
			corretor.setFoto(novaFoto);
		}
		
		Role role = new Role(nomeRole.replace(",", ""));
		List<Role> roles = new ArrayList<Role>();
		roles.add(role);
		
		corretor.setRoles(roles);
		
		corretorDAO.alterar(corretor);
	}
}







