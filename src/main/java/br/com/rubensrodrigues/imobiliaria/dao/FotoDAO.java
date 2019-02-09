package br.com.rubensrodrigues.imobiliaria.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rubensrodrigues.imobiliaria.models.Foto;

@Repository
@Transactional
public class FotoDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Foto foto) {
		manager.persist(foto);
	}
	
	public List<Foto> lista(){
		String query = "select f from Foto f";
		return manager.createQuery(query, Foto.class).getResultList();
	}
	
	public void remover(Foto foto) {
		manager.remove(foto);
	}
	
	public Foto find(Integer id) {
		return manager.find(Foto.class, id);
	}
}
