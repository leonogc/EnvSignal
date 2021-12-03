#language: pt

Funcionalidade: Selecionar tipo de Login
Como usuário ou autoridade
Eu quero poder entrar na página de login específica
Para poder entrar na minha conta e interagir com o sistema

Cenário: Ir para Login de Usuário
Dado que estou na página de login da home
Quando eu clico em Ir para Login de Usuário
Então deverei ser redirecionado para a página de login de usuário

Cenário: Ir para Login de autoridade
Dado que estou na página de login da home
Quando eu clico em Ir para Login de Autoridade
Então deverei ser redirecionado para a página de login de autoridade

@oneUserBefore
Cenário: Tentativa de Acesso a Página de Login da Home Logado como Usuário
Dado que estou logado como usuário
E que estou na página de login da home
Então deverei ser redirecionado para a página principal dos usuários

@oneAuthorityBefore
Cenário: Tentativa de Acesso a Página de Login da Home Logado como Autoridade
Dado que estou logado como autoridade
E que estou na página de login da home
Então deverei ser redirecionado para a página principal das autoridades