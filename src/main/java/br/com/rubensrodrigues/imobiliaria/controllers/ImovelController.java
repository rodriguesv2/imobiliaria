package br.com.rubensrodrigues.imobiliaria.controllers;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/imovel")
public class ImovelController {

	@Autowired
	private EntityManager manager;
	
	@RequestMapping("/formulario")
	public ModelAndView formImagem() {
		ModelAndView modelAndView = new ModelAndView("imovel/formulario");

		return modelAndView;
	}
}
