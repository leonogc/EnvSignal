#language: pt

@listMarkerBefore
Funcionalidade: Listagem de Desastres - Autoridade
Como usuário
Eu quero poder ver uma lista de desastres próximos
Para poder ver a distância relativa entre nós

Cenário: Carregamento da lista - user
Dado que estou logado no meu perfil
Quando acesso a listagem de desastres
Então os desastres devem ser exibidos

Cenário: Carregamento da lista - authority
Dado que estou logado como autoridade na página home
Quando acesso a listagem de desastres
Então os desastres devem ser exibidos