package br.com.rubensrodrigues.imobiliaria.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GeradorBCrypt {

	public static String gerar(String senha) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String senhaNova = passwordEncoder.encode(senha);
		
		return senhaNova;
	}
}
