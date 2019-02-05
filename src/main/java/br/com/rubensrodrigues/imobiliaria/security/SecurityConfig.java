package br.com.rubensrodrigues.imobiliaria.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import br.com.rubensrodrigues.imobiliaria.dao.CorretorDAO;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private CorretorDAO corretorDAO;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/resources/css/**").permitAll()
			.antMatchers("/resources/js/**").permitAll()
			.antMatchers("/arquivos-carregados/**").permitAll()
			.antMatchers("/imovel/detalhe/**").permitAll()
			.antMatchers("/corretor/**").hasAnyRole("ADMIN")
			.antMatchers("/imovel/**").hasAnyRole("CORRETOR", "ADMIN")
			.antMatchers("/").permitAll()
			.anyRequest().authenticated()
			.and()
			.formLogin().loginPage("/login").permitAll().successForwardUrl("/")
			.and()
			.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/");
		
	}
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.userDetailsService(corretorDAO)
			.passwordEncoder(new BCryptPasswordEncoder());
	}
}
