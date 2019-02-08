package br.com.rubensrodrigues.imobiliaria.jpa_repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.com.rubensrodrigues.imobiliaria.models.Corretor;
import br.com.rubensrodrigues.imobiliaria.models.Imovel;

public interface ImovelRepository extends JpaRepository<Imovel, Long>{

	@Query("Select i from Imovel i where corretor = ?1")
	public Page<Imovel> findByCorretor(Corretor corretor, Pageable pageable); 
	
}
