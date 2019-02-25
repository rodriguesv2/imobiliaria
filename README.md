# imobiliaria
Projeto para fins didáticos de Spring e Hibernate

Usado até então no projeto: Spring Boot, JPA, Spring Security, JSTL e MySql. Projeto baseado em Maven. Bootstrap usado para o Front-end.

Caracteristicas do projeto até o momento: CRUD dos corretores. Alteração da senha de forma individual de cada corretor, os admins podem fazer a senha dos usuários resetar. CRUD do imovel, onde os corretores são vinculados aos imoveis na criação. Quando um corretor é excluido, todos os imoveis são passados para o admin que fez a ação.
É possível e recomendado que fotos sejam vinculadas ao imóvel. Ao serem adicionadas, as fotos são reduzidas caso tenham mais de 1000x700 e armazenadas no sistema. São excluidas junto com o imóvel.
A home possui a lista de todos os imóveis. A home está com a paginação implementada. Foi usado a interface JPARepository e Peageble para a função.

Os próximos passos serão a criação de filtros e busca para a home e para lista de corretores e imóveis. Também será usado Validation para os formularios, que não são a prova e dados mal inserido ainda.

Veja o projeto em produção pelo endereço: http://ec2-18-218-203-116.us-east-2.compute.amazonaws.com/
