package br.com.rubensrodrigues.imobiliaria.dao;

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
}
