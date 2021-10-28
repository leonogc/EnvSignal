#language: pt

Funcionalidade: Mostrar os markers
Como Usuário
Eu quero poder vizualizar os markers dos desastres próximos
Para que eu possa localizar os desastres próximos a mim

@someMarkersBefore
Cenário: Carregamento dos Markers bem sucedido
Dado que estou na página home
Quando a página é carregada
Então os markers devem ser exibidos