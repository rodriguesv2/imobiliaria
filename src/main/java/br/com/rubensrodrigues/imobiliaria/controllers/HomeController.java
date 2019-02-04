package br.com.rubensrodrigues.imobiliaria.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.rubensrodrigues.imobiliaria.dao.ImovelDAO;
import br.com.rubensrodrigues.imobiliaria.models.Imovel;

@Controller
public class HomeController{
	
	@Autowired
	private ImovelDAO imovelDAO;
	
	@RequestMapping("/")
	public ModelAndView index(){
		ModelAndView modelAndView = new ModelAndView("home/index");
		
		List<Imovel> imoveis = imovelDAO.lista();
		modelAndView.addObject("imoveis", imoveis);

		return modelAndView;
	}
}
