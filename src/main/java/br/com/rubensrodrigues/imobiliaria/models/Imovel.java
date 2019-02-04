package br.com.rubensrodrigues.imobiliaria.models;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Imovel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private BigInteger referencia;
	private String cep;
	private String endereco;
	private Integer numero;
	private String complemento;
	private String bairro;
	private String cidade;
	private String uf;
	@Column(columnDefinition = "text")
	private String descricao;
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private List<Foto> fotos = new ArrayList<Foto>();
	@ManyToOne
	private Corretor corretor;
	@CreationTimestamp
	private Calendar dataCriacao;
	@UpdateTimestamp
	private Calendar dataModificacao;
	@Enumerated(EnumType.STRING)
	private TipoImovel tipo;
	private Double valor;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public BigInteger getReferencia() {
		return referencia;
	}
	public void setReferencia(BigInteger referencia) {
		this.referencia = referencia;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getEndereco() {
		return endereco;
	}
	public TipoImovel getTipo() {
		return tipo;
	}
	public void setTipo(TipoImovel tipo) {
		this.tipo = tipo;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
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
	public Double getValor() {
		return valor;
	}
	public void setValor(Double valor) {
		this.valor = valor;
	}
	
	/**
	 * Usado para listar exemplares de no maximo 6 fotos para a apresentação na home.
	 * @return Uma sub lista com 6 imagens. Caso o imovel tenha menos de 6 fotos, o metodo trará todas sem filtrar quantidade. Porem se o imóvel não tiver fotos, o retorno será uma lista vazia
	 */
	public List<Foto> seisFotos(){
		List<Foto> seisFotos = new ArrayList<Foto>();
		
		try {
			seisFotos = fotos.subList(0, 6);
		} catch (IndexOutOfBoundsException e) {
			if(!fotos.isEmpty())
				seisFotos = fotos.subList(0, fotos.size());
		}
		return seisFotos;
	}
}
