#language: pt
@oneUserBefore
@someMarkersBefore
Funcionalidade: Mostrar os markers
Como Usuário
Eu quero poder visualizar os markers dos desastres próximos
Para que eu possa localizar os desastres próximos a mim

@OneMarkerVerifiedFromUserBefore
Cenário: Listagem de Markers verificados do próprio Usuário
E que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
Então os markers de usuário verificados devem ser exibidos

@OneMarkerPendingFromUserBefore
Cenário: Listagem de Markers não verificados do próprio Usuário
E que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
Então os markers de usuário não verificados devem ser exibidos

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