package br.com.rubensrodrigues.imobiliaria.models;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Imovel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer referencia;
	private Integer cep;
	private String endereço;
	private Integer numero;
	private String complemento;
	private String bairro;
	private String cidade;
	private String uf;
	@Column(columnDefinition = "text")
	private String descricao;
	@OneToMany(fetch=FetchType.EAGER)
	private List<Foto> fotos = new ArrayList<Foto>();
	@ManyToOne
	private Corretor corretor;
	@DateTimeFormat
	private Calendar dataCriacao;
	@DateTimeFormat
	private Calendar dataModificacao;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getReferencia() {
		return referencia;
	}
	public void setReferencia(Integer referencia) {
		this.referencia = referencia;
	}
	public Integer getCep() {
		return cep;
	}
	public void setCep(Integer cep) {
		this.cep = cep;
	}
	public String getEndereço() {
		return endereço;
	}
	public void setEndereço(String endereço) {
		this.endereço = endereço;
	}
	public Integer getNumero() {
		return numero;
	}
	public void setNumero(Integer numero) {
		this.numero = numero;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public List<Foto> getFotos() {
		return fotos;
	}
	public void setFotos(List<Foto> fotos) {
		this.fotos = fotos;
	}
	public Corretor getCorretor() {
		return corretor;
	}
	public void setCorretor(Corretor corretor) {
		this.corretor = corretor;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Calendar getDataCriacao() {
		return dataCriacao;
	}
	public void setDataCriacao(Calendar dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	public Calendar getDataModificacao() {
		return dataModificacao;
	}
	public void setDataModificacao(Calendar dataModificacao) {
		this.dataModificacao = dataModificacao;
	}
}
