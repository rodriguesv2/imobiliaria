package br.com.rubensrodrigues.imobiliaria.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class TratadorImagens {
	
	@Autowired
	public HttpServletRequest request;
	
	public String geraNome(String nomeArquivo){
		UUID uuid = UUID.randomUUID();	
		String extensao = nomeArquivo.substring(nomeArquivo.length()-5);
		
		return uuid.toString()+extensao;
	}
	
	public void salvar(MultipartFile arquivo) throws IllegalStateException, IOException {
		String nomeArquivo = arquivo.getOriginalFilename();
		
		String realPath = request.getServletContext().getRealPath("arquivos-carregados");
		arquivo.transferTo(new File(realPath+"/"+geraNome(nomeArquivo)));
	}
}
