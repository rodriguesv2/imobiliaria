package br.com.rubensrodrigues.imobiliaria.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rubensrodrigues.imobiliaria.models.Corretor;

@Repository
@Transactional
public class CorretorDAO implements UserDetailsService{

	@PersistenceContext
	private EntityManager manager;
	
	public void salvar(Corretor corretor) {
		manager.persist(corretor);
	}
	
	public void alterar(Corretor corretor) {
		manager.merge(corretor);
	}
	
	public Corretor find(Integer id) {
		return manager.find(Corretor.class, id);
	}
	
	public List<Corretor> lista(){
		return manager.createQuery("select c from Corretor c", Corretor.class).getResultList();
	}

	public void remover(Corretor corretor) {
		manager.remove(corretor);
		
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		List<Corretor> corretores = manager.createQuery("select c from Corretor c where c.email = :email", Corretor.class)
				.setParameter("email", username)
				.getResultList();
		
		if(corretores.isEmpty())
			throw new UsernameNotFoundException("O usuário " + username + " não foi encontrado");
		
		return corretores.get(0);
	}


}
