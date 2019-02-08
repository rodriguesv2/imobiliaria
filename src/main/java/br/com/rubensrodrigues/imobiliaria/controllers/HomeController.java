package br.com.rubensrodrigues.imobiliaria.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.rubensrodrigues.imobiliaria.dao.ImovelDAO;
import br.com.rubensrodrigues.imobiliaria.jpa_repository.ImovelRepository;
import br.com.rubensrodrigues.imobiliaria.models.Imovel;

@Controller
public class HomeController{
	
	@Autowired
	private ImovelDAO imovelDAO;
	
	@Autowired
	private ImovelRepository imovelRepo;
	
	@RequestMapping("/teste")
	public ModelAndView index(){
		ModelAndView modelAndView = new ModelAndView("home/index");
		
		List<Imovel> imoveis = imovelDAO.lista();
		modelAndView.addObject("imoveis", imoveis);

		return modelAndView;
	}
	
	@RequestMapping("/")
	public ModelAndView home(
			@RequestParam(defaultValue = "1") Integer pagina, 
			@RequestParam(defaultValue = "7") Integer porPagina,
			@RequestParam(defaultValue = "cidade") String ordenacao,
			@RequestParam(defaultValue = "ASC") Sort.Direction direcao) {
		ModelAndView modelAndView = new ModelAndView("home/home");
		
		//modelAndView.addObject("paginaAtual", pagina);
		
		Page<Imovel> pageImovel = imovelRepo.findAll(new PageRequest(--pagina, porPagina));
		modelAndView.addObject("pageImovel", pageImovel);
		
		return modelAndView;
	}
}
