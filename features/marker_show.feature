#language: pt

@someMarkersBefore
Funcionalidade: Mostrar os markers
Como Usuário
Eu quero poder vizualizar os markers dos desastres próximos
Para que eu possa localizar os desastres próximos a mim

Cenário: Carregamento dos Markers bem sucedido
Dado que estou na página home
Quando a página é carregada
Então os markers devem ser exibidos

Cenário: Listagem de Markers do próprio Usuário
Dado que estou logado na tela de home
E que sou um usuário
E que eu criei markers com meu usuário
Quando a página é carregada
Então os markers de usuário devem ser exibidos