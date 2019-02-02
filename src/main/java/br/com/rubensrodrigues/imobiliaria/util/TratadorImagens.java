package br.com.rubensrodrigues.imobiliaria.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class TratadorImagens {
	
	@Autowired
	public HttpServletRequest request;
	
	/**
	 * Gera o novo nome do arquivo de imagem baseado em UUID usando a extensão da imagem original
	 * @return O UUID + . + extensão. Ex: cec6800d-3329-4aef-9a4b-493efaf373cey.jpg
	 */
	public String geraNome(){
		UUID uuid = UUID.randomUUID();
		String extensao = ".jpg";
		
		return uuid.toString()+extensao;
	}
	
	
	public File salvar(MultipartFile arquivo) throws IllegalStateException, IOException {
		String realPath = request.getServletContext().getRealPath("arquivos-carregados");
		File file = new File(realPath + "/" + geraNome());
		
		arquivo.transferTo(file);
		return file;
		
	}
	
	public boolean ehImagemValida(MultipartFile arquivo) {	
		String tipo = arquivo.getContentType();
		
		if(tipo.equals("image/jpeg") || tipo.equals("image/png") || tipo.equals("image/gif"))
			return true;
		else
			return false;
	}
	
	public void redimensionaImagem(File arquivo) throws IOException {
        BufferedImage imagem = ImageIO.read(arquivo);
        
        float alturaSugerida = 700;
        float larguraSugerida = 1000; 
        
        float alturaAtual = imagem.getHeight();
        float larguraAtual = imagem.getWidth();
        
        float alturaNova = 0;
        float larguraNova = 0;
        
        if(alturaAtual > alturaSugerida || larguraAtual > larguraSugerida) {
	        if(larguraAtual > alturaAtual) {
	        	larguraNova = larguraSugerida;
	        	alturaNova = Math.round((larguraNova / larguraAtual) * alturaAtual);
	        }else if (alturaAtual > larguraAtual) {
				alturaNova = alturaSugerida;
				larguraNova = Math.round((alturaNova / alturaAtual) * larguraAtual);
			}else {
				alturaNova = alturaSugerida;
				larguraNova = alturaSugerida;
			}
	             
	        comprimir((int)larguraNova, (int)alturaNova, imagem, arquivo);	
	        
        }else {
        	System.out.println("Imagem não necessita de compressão");
        }
    }
	
	private void comprimir(int largura, int altura, BufferedImage imagem, File arquivo) throws IOException {
		BufferedImage novaImagem = new BufferedImage(largura, altura, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = novaImagem.createGraphics();
        g.drawImage(imagem, 0, 0, largura, altura, null);
        ImageIO.write(novaImagem, "JPG", arquivo);
	}
}











