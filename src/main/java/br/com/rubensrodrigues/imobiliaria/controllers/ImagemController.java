package br.com.rubensrodrigues.imobiliaria.controllers;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.rubensrodrigues.imobiliaria.util.TratadorImagens;

@Controller
@RequestMapping("/imagem")
public class ImagemController {

	
	@Autowired
	private TratadorImagens tratador;
	
	@RequestMapping("/form")
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("inserirImagem");
		return modelAndView;
	}
	
	@RequestMapping("/gravar")
	public ModelAndView gravar(MultipartFile arquivo) throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		
		if(tratador.ehImagemValida(arquivo)) {
			File file = tratador.salvar(arquivo);
			tratador.redimensionaImagem(file);
		}
		else
			System.out.println("O arquivo não é valido");
		
		return modelAndView;
	}
}
