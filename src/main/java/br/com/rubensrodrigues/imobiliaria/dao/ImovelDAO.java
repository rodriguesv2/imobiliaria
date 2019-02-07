package br.com.rubensrodrigues.imobiliaria.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rubensrodrigues.imobiliaria.models.Corretor;
import br.com.rubensrodrigues.imobiliaria.models.Imovel;

@Repository
@Transactional
public class ImovelDAO{
 
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Imovel imovel){
		manager.persist(imovel);
	}
	
	public List<Imovel> lista() {
		return manager.createQuery("select i from Imovel i", Imovel.class).getResultList();
	}
	
	public Imovel find(Integer id) {
		return manager.find(Imovel.class, id);
	}

	public List<Imovel> listaPorCorretor(Corretor corretor) {
		List<Imovel> imoveis = manager.createQuery("select i from Imovel i where corretor = :corretor", Imovel.class)
				.setParameter("corretor", corretor)
				.getResultList();
		
		return imoveis;
	}
	
	public void alterar(Imovel imovel) {
		manager.merge(imovel);
	}
	
	public void remover(Imovel imovel) {
		manager.remove(imovel);
	}
}
