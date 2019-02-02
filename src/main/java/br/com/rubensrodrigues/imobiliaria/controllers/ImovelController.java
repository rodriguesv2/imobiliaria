package br.com.rubensrodrigues.imobiliaria.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.rubensrodrigues.imobiliaria.dao.ImovelDAO;
import br.com.rubensrodrigues.imobiliaria.models.Imovel;
import br.com.rubensrodrigues.imobiliaria.models.TipoImovel;

@Controller
@RequestMapping("/imovel")
public class ImovelController {
	
	@Autowired
	private ImovelDAO imovelDAO;
	
	@RequestMapping("/formulario")
	public ModelAndView formImagem() {
		ModelAndView modelAndView = new ModelAndView("imovel/formulario");
		modelAndView.addObject("tipoImovel", TipoImovel.values());
		return modelAndView;
	}
	
	@RequestMapping("/salvar")
	public ModelAndView salvarImovel(Imovel imovel) {
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		imovelDAO.gravar(imovel);
		
		return modelAndView;
	}
}
