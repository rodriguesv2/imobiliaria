package br.com.rubensrodrigues.imobiliaria.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.rubensrodrigues.imobiliaria.dao.ImovelDAO;
import br.com.rubensrodrigues.imobiliaria.models.Foto;
import br.com.rubensrodrigues.imobiliaria.models.Imovel;
import br.com.rubensrodrigues.imobiliaria.models.TipoImovel;
import br.com.rubensrodrigues.imobiliaria.util.TratadorImagens;

@Controller
@RequestMapping("/imovel")
public class ImovelController {
	
	@Autowired
	private ImovelDAO imovelDAO;
	
	@Autowired
	private HttpServletRequest request;//Parametro usado para usar a sessão para "carregar" o imovel pelos formulários e salvar após o carregamento das fotos
	
	@Autowired
	private TratadorImagens tratador; //Classe util para manipulação das imagens carregadas pelo formulario.
	
	@RequestMapping("/formulario")
	public ModelAndView formImagem() {
		ModelAndView modelAndView = new ModelAndView("imovel/formulario");
		modelAndView.addObject("tipoImovel", TipoImovel.values());
		return modelAndView;
	}
	
	/*O metodo não persiste o imovel, apenas o coloca na sessão e vai para o formulario de adição de imagens (salvarFotos(MultipartFile)), assim não duplica no banco com o F5,
	e principalmente, aguarda as fotos para persistir.*/
	
	@RequestMapping(value = "/salvar", method = RequestMethod.POST)
	public ModelAndView salvarImovel(Imovel imovel) {
		ModelAndView modelAndView = new ModelAndView("imovel/inserirImagem");
		request.getSession().setAttribute("imovel", imovel);
		
		return modelAndView;
	}
	
	/*Este recebe o imovel via sessão. As fotos vem via paramentro em um array de MultipartFile. As imagens são renomeadas, gravadas em diretório e os novos nomes são salvos
	*em objetos e são guardados em uma List para serem carregados junto com o Imovel. Persistencia é CASCADE.
	*/
	
	@RequestMapping(value="/salvarImagens", method=RequestMethod.POST)
	public ModelAndView salvarFotos(MultipartFile[] arquivos) throws IllegalStateException, IOException {
		ModelAndView modelAndView = new ModelAndView("redirect:/");		
		
		Imovel imovel = (Imovel) request.getSession().getAttribute("imovel");
		List<Foto> fotos = new ArrayList<Foto>();
		
		for (MultipartFile arquivo : arquivos) {
			String novoNome = tratador.geraNome();
			Foto foto = new Foto(novoNome);
			
			if(tratador.ehImagemValida(arquivo)) { //Verifica se arquivo é um GIF, PNG ou JPG
				tratador.salvar(arquivo, novoNome);
				fotos.add(foto);
			}
		}
		
		if(fotos.isEmpty())
			imovel.setFotos(fotos);
		
		imovelDAO.gravar(imovel);

		return modelAndView;
	}
}







