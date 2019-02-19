package br.com.rubensrodrigues.imobiliaria.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.rubensrodrigues.imobiliaria.dao.ImovelDAO;
import br.com.rubensrodrigues.imobiliaria.models.Imovel;

@RestController
@RequestMapping("/api")
public class ImovelControllerRest {

	@Autowired
	private ImovelDAO imovelDAO;
	
	@RequestMapping("/imoveis")
	public List<Imovel> lista() {
		return imovelDAO.lista();
	}
}
