package br.com.rubensrodrigues.imobiliaria.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.rubensrodrigues.imobiliaria.jpa_repository.ImovelRepository;
import br.com.rubensrodrigues.imobiliaria.models.Imovel;

@Controller
public class HomeController{
	
	@Autowired
	private ImovelRepository imovelRepo;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/paginacao")
	public ModelAndView paginacao(@RequestParam(defaultValue = "5") Integer quantItens){
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		
		request.getSession().setAttribute("porPagina", quantItens);
		
		return modelAndView;
	}
	
	@RequestMapping("/")
	public ModelAndView home(
			@RequestParam(defaultValue = "1") Integer pagina, 
			@RequestParam(defaultValue = "cidade") String ordenacao,
			@RequestParam(defaultValue = "ASC") Sort.Direction direcao) {
		ModelAndView modelAndView = new ModelAndView("home/home");
		
		Integer porPagina = (Integer) request.getSession().getAttribute("porPagina");
		
		if(porPagina == null) {
			porPagina = 5;
		}
		
		Page<Imovel> pageImovel = imovelRepo.findAll(new PageRequest(--pagina, porPagina));
		modelAndView.addObject("pageImovel", pageImovel);
		
		return modelAndView;
	}
}
