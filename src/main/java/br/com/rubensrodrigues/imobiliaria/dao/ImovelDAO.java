package br.com.rubensrodrigues.imobiliaria.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
}
