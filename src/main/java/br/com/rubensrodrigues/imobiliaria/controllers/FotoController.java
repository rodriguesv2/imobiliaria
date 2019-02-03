package br.com.rubensrodrigues.imobiliaria.controllers;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.rubensrodrigues.imobiliaria.dao.FotoDAO;
import br.com.rubensrodrigues.imobiliaria.models.Foto;
import br.com.rubensrodrigues.imobiliaria.util.TratadorImagens;

@Controller
@RequestMapping("/imagem")
public class FotoController {

	@Autowired
	private FotoDAO fotoDao;
	
	@Autowired
	private TratadorImagens tratador;
	
	@RequestMapping("/form")
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("inserirImagem");
		return modelAndView;
	}
	
	@RequestMapping("/gravar")
	public ModelAndView gravar(MultipartFile[] arquivos) throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		
		for (MultipartFile arquivo : arquivos) {
			String novoNome = tratador.geraNome();
			Foto foto = new Foto(novoNome);
			
			if(tratador.ehImagemValida(arquivo)) {
				tratador.salvar(arquivo, novoNome);
				fotoDao.gravar(foto);
			}
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/lista")
	public ModelAndView listar() {
		ModelAndView modelAndView = new ModelAndView("foto/lista_imagens");
		List<Foto> fotos = fotoDao.lista();
		modelAndView.addObject("fotos", fotos);
		
		return modelAndView;
	}
}










