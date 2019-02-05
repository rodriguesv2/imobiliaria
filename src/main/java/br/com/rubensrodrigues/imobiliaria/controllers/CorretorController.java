package br.com.rubensrodrigues.imobiliaria.controllers;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.rubensrodrigues.imobiliaria.dao.CorretorDAO;
import br.com.rubensrodrigues.imobiliaria.models.Corretor;
import br.com.rubensrodrigues.imobiliaria.models.Foto;
import br.com.rubensrodrigues.imobiliaria.util.TratadorImagens;

@Controller
@RequestMapping("/corretor")
public class CorretorController {
	
	@Autowired
	private CorretorDAO CorretorDAO;
	
	@Autowired
	private TratadorImagens tratador;
	
	@RequestMapping("/formulario")
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("corretor/formulario");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/salvar", method = RequestMethod.POST)
	public ModelAndView salvar(Corretor corretor, MultipartFile arquivo) throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		
		String nomeFoto = tratador.geraNome();
		tratador.salvarFotoCorretor(arquivo, nomeFoto);
		
		Foto novaFoto = new Foto(nomeFoto);
		corretor.setFoto(novaFoto);
		
		CorretorDAO.salvar(corretor);
		
		return modelAndView;
	}
}
