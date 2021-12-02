#language: pt
@oneUserBefore
@someMarkersBefore
Funcionalidade: Mostrar os markers
Como Usuário
Eu quero poder vizualizar os markers dos desastres próximos
Para que eu possa localizar os desastres próximos a mim

Cenário: Listagem de Markers do próprio Usuário
Dado que eu criei markers com meu usuário
E que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
Então os markers de usuário devem ser exibidos

Cenário: Listagem de Markers não verificados
Dado que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
Então os markers não verificados devem ser exibidos

Cenário: Listagem de Markers verificados
Dado que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
Então os markers verificados devem ser exibidos