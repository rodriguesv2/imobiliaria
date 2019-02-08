package br.com.rubensrodrigues.imobiliaria.jpa_repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.rubensrodrigues.imobiliaria.models.Imovel;

public interface ImovelRepository extends JpaRepository<Imovel, Long>{

}
