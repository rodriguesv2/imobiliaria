package br.com.rubensrodrigues.imobiliaria.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rubensrodrigues.imobiliaria.models.Corretor;

@Repository
@Transactional
public class CorretorDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void salvar(Corretor corretor) {
		manager.persist(corretor);
	}
}
