package br.com.rubensrodrigues.imobiliaria;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Boot
{

   public static void main(String[] args)
   {
	   System.out.println("teste");
	   int a = 5;
	   int b = 10;
	   int c = a + b;
	   System.out.println(c);
	   SpringApplication.run(Boot.class, args);
   }
}
