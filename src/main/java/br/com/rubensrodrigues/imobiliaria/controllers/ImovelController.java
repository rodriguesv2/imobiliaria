package br.com.rubensrodrigues.imobiliaria.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.rubensrodrigues.imobiliaria.dao.CorretorDAO;
import br.com.rubensrodrigues.imobiliaria.dao.FotoDAO;
import br.com.rubensrodrigues.imobiliaria.dao.ImovelDAO;
import br.com.rubensrodrigues.imobiliaria.enumerated.EstadoImovel;
import br.com.rubensrodrigues.imobiliaria.enumerated.TipoImovel;
import br.com.rubensrodrigues.imobiliaria.enumerated.TipoNegocio;
import br.com.rubensrodrigues.imobiliaria.jpa_repository.ImovelRepository;
import br.com.rubensrodrigues.imobiliaria.models.Corretor;
import br.com.rubensrodrigues.imobiliaria.models.Foto;
import br.com.rubensrodrigues.imobiliaria.models.Imovel;
import br.com.rubensrodrigues.imobiliaria.util.TratadorImagens;

@Controller
@RequestMapping("/imovel")
public class ImovelController {
	
	@Autowired
	private ImovelDAO imovelDAO;
	
	@Autowired
	private ImovelRepository imovelRepo;
	
	@Autowired
	private CorretorDAO corretorDAO;
	
	@Autowired
	private FotoDAO fotoDAO;
	
	@Autowired
	private HttpServletRequest request;//Parametro usado para usar a sessão para "carregar" o imovel pelos formulários e salvar após o carregamento das fotos
	
	@Autowired
	private TratadorImagens tratador; //Classe util para manipulação das imagens carregadas pelo formulario.
	
	@RequestMapping("/formulario")
	public ModelAndView formImovel() {
		ModelAndView modelAndView = new ModelAndView("imovel/formulario");
		modelAndView.addObject("tipoImovel", TipoImovel.values());
		modelAndView.addObject("estadoImovel", EstadoImovel.values());
		modelAndView.addObject("tipoNegocio", TipoNegocio.values());
		
		return modelAndView;
	}
	
	/*O metodo não persiste o imovel, apenas o coloca na sessão e chama para o formulario de adição de imagens (salvarFotos(MultipartFile)), assim não duplica no banco com o F5,
	*e principalmente, aguarda as fotos para persistir.
	*/
	@RequestMapping(value = "/salvar", method = RequestMethod.POST)
	public ModelAndView salvarImovel(Imovel imovel, @RequestParam String idCorretor) {
		ModelAndView modelAndView = new ModelAndView("imovel/inserirImagem");
		
		String semVigula = idCorretor.replace(",", "");
		
		Corretor corretor = corretorDAO.find(Integer.parseInt(semVigula));
		imovel.setCorretor(corretor);
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
		
		if(!fotos.isEmpty())
			imovel.setFotos(fotos);
		
		imovelDAO.gravar(imovel);

		return modelAndView;
	}
	
	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("imovel/detalhe");
		
		modelAndView.addObject("imovel", imovelDAO.find(id));
		
		return modelAndView;
	}
	
	
	
	
	
	@RequestMapping(value = "/lista-do-corretor/paginacao", method = RequestMethod.POST)
	public ModelAndView paginacaoPorCorretor(@RequestParam(defaultValue = "15") Integer quantItens){
		ModelAndView modelAndView = new ModelAndView("redirect:/imovel/lista");
		
		request.getSession().setAttribute("porPaginaTabela", quantItens);
		
		return modelAndView;
	}
	
	@RequestMapping("/lista-do-corretor")
	public ModelAndView listaPorCorretor(
			@RequestParam(defaultValue = "1") Integer pagina, 
			@RequestParam(defaultValue = "cidade") String ordenacao,
			@RequestParam(defaultValue = "ASC") Sort.Direction direcao,
			Authentication usuario) {
		ModelAndView modelAndView = new ModelAndView("imovel/lista-por-corretor");
		
		Integer porPaginaTabela = (Integer) request.getSession().getAttribute("porPaginaTabela");
		
		if(porPaginaTabela == null) {
			porPaginaTabela = 10;
			request.getSession().setAttribute("porPaginaTabela", 10);
		}
		
		Corretor corretor = (Corretor) usuario.getPrincipal();
		//List<Imovel> imoveis = imovelDAO.listaPorCorretor(corretor);
		Page<Imovel> pageImovel = imovelRepo.findByCorretor(corretor, new PageRequest(--pagina, porPaginaTabela));
		
		
		modelAndView.addObject("pageImovel", pageImovel);
		
		return modelAndView;
	}
	
	
	
	
	
	@RequestMapping(value = "/lista/paginacao", method = RequestMethod.POST)
	public ModelAndView paginacao(@RequestParam(defaultValue = "15") Integer quantItens){
		ModelAndView modelAndView = new ModelAndView("redirect:/imovel/lista");
		
		request.getSession().setAttribute("porPaginaTabela", quantItens);
		
		return modelAndView;
	}
	
	@RequestMapping("/lista")
	public ModelAndView listaGeral(
			@RequestParam(defaultValue = "1") Integer pagina, 
			@RequestParam(defaultValue = "cidade") String ordenacao,
			@RequestParam(defaultValue = "ASC") Sort.Direction direcao) {
		ModelAndView modelAndView = new ModelAndView("imovel/lista");
		
		Integer porPaginaTabela = (Integer) request.getSession().getAttribute("porPaginaTabela");
		
		if(porPaginaTabela == null) {
			porPaginaTabela = 10;
			request.getSession().setAttribute("porPaginaTabela", 10);
		}
		
		Page<Imovel> pageImovel = imovelRepo.findAll(new PageRequest(--pagina, porPaginaTabela));
		modelAndView.addObject("pageImovel", pageImovel);
		
		return modelAndView;
	}
	
	
	
	
	
	
	
	@RequestMapping("/remover-por-corretor/{id}")
	public ModelAndView removerPorCorretor(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/imovel/lista-do-corretor");
		
		removerGenerico(id);
		
		return modelAndView;
	}
	
	@RequestMapping("/remover/{id}")
	public ModelAndView remover(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/imovel/lista");
		
		removerGenerico(id);
		
		return modelAndView;
	}
	
	private void removerGenerico(Integer id) {
		Imovel imovel = imovelDAO.find(id);
		
		for (Foto foto : imovel.getFotos()) {
			tratador.removerFoto(foto.getNomeArquivo());
		}
		
		imovelDAO.remover(imovel);
	}
	
	
	
	
	
	
	@RequestMapping("/alterar-por-corretor/{id}")
	public ModelAndView formularioAlterarPorCorretor(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("imovel/formulario-alterar");
		
		modelAndView.addObject("tipoImovel", TipoImovel.values());
		modelAndView.addObject("estadoImovel", EstadoImovel.values());
		modelAndView.addObject("tipoNegocio", TipoNegocio.values());
		
		Imovel imovel = imovelDAO.find(id);
		modelAndView.addObject("imovel", imovel);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/salvar-alteracao")
	public ModelAndView alteraImovel(Imovel imovel, @RequestParam String idCorretor) {
		ModelAndView modelAndView = new ModelAndView("redirect:/imovel/lista-do-corretor");
		
		Corretor corretor = corretorDAO.find(Integer.parseInt(idCorretor.replace(",", "")));
		Imovel imovelPersistido = imovelDAO.find(imovel.getId());
		
		imovel.setFotos(imovelPersistido.getFotos());
		imovel.setCorretor(corretor);
		imovel.setDataCriacao(imovelPersistido.getDataCriacao());
		
		imovelDAO.alterar(imovel);
		
		return modelAndView;
	}
	
	@RequestMapping("/gerenciar-fotos-por-corretor")
	public ModelAndView gerenciarFotosPorCorretor(@RequestParam Integer idImovel) {
		ModelAndView modelAndView = new ModelAndView("imovel/gerenciar-fotos");
		
		List<Foto> fotos = imovelDAO.find(idImovel).getFotos();
		modelAndView.addObject("fotos", fotos);
		
		modelAndView.addObject("idImovel", idImovel);
		
		return modelAndView;
	}
	
	@RequestMapping("/excluir-foto-por-corretor")
	public ModelAndView excluirFotoPorCorretor(Foto foto, @RequestParam String idImovel){
		ModelAndView modelAndView = new ModelAndView("redirect:/imovel/gerenciar-fotos-por-corretor?idImovel="+idImovel.replace(",", ""));
		
		Imovel imovel = imovelDAO.find(Integer.parseInt(idImovel.replace(",", "")));
		imovel.getFotos().remove(fotoDAO.find(foto.getId()));
		
		imovelDAO.alterar(imovel);
		
		tratador.removerFoto(fotoDAO.find(foto.getId()).getNomeArquivo());
		
		return modelAndView;
	}
}







